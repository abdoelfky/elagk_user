import 'package:elagk/basket/data/basket_model.dart';
import 'package:elagk/pharmacy/data/product_model.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'basket_states.dart';

class BasketCubit extends Cubit<BasketStates> {
  BasketCubit() : super(InitialState());

  static BasketCubit get(context) => BlocProvider.of(context);

  List<int> counter = [];

  int? pharmacyId;
  int? distance;

  void minus({required int index}) async {
    if (counter[index] > 1) {
      counter[index]--;
      basketProducts[index] = BasketModel.fromJson({
        'productId': basketProducts[index].productId,
        'productName': basketProducts[index].productName,
        'imageUrl': basketProducts[index].imageUrl,
        'price': basketProducts[index].price,
        'quantity': counter[index],
      });
      calcTotalPrice();
      emit(MinusState());
    }
  }

  void plus({required int index}) async {
    counter[index]++;
    basketProducts[index] = BasketModel.fromJson({
      'productId': basketProducts[index].productId,
      'productName': basketProducts[index].productName,
      'imageUrl': basketProducts[index].imageUrl,
      'price': basketProducts[index].price,
      'quantity': counter[index],
    });
    calcTotalPrice();
    emit(PlusState());
  }

  List<BasketModel> basketProducts = [];

  Future<void> AddToCart({
    required ProductModel productModel,
    required phId,
    required dist,
  }) async {

    pharmacyId=int.parse(phId.toString());
    distance=int.parse(dist.toString());
    checkIfContain(ID: productModel.productId!).then((value) {
      if (productIfContain == false) {
        counter.insert(counter.length, 1);
        BasketModel basketModel;
        basketModel = BasketModel.fromJson({
          'productId': productModel.productId,
          'productName': productModel.productName,
          'imageUrl': productModel.imageUrl,
          'price': productModel.price,
          'quantity': 1,
        });
        emit(AddToBasketLoadingState());
        basketProducts.add(basketModel);
        calcTotalPrice();
        emit(AddToBasketSuccessState());
        // print(basketProducts.length);
        // print(basketModel.productId);
        print(basketModel.productName);
        print(basketModel.price);
      } else {
        plus(index: index);
        print(index);
      }
    });
  }

  bool productIfContain = false;
  int index = 0;

  Future<void> checkIfContain({required int ID}) async {
    productIfContain = false;
    if (basketProducts.isNotEmpty) {
      basketProducts.asMap().forEach((elementIndex, element) {
        if (element.productId == ID) {
          productIfContain = true;
          index = elementIndex;
        }
      });
    }
    emit(CheckIfContainedSuccessfullyState());
  }

  Future<void> removeFromCart({
    required int index,
  }) async {
    counter.removeAt(index);
    emit(removeFromCartLoadingState());
    basketProducts.removeAt(index);
    calcTotalPrice();
    emit(removeFromCartSuccessState());
    print(basketProducts.length);
  }

  Future<void> addToCartByPrescription({required image}) async {
    BasketModel basketModel;
    basketModel = BasketModel.fromJson({
      'productId': 0,
      'productName': 'Prescription',
      'imageUrl': image,
      'price': 0.0,
    });
    emit(AddToBasketLoadingState());
    basketProducts.add(basketModel);
    emit(AddToBasketSuccessState());
    print(basketProducts.length);
    // print(basketModel.productId);
    print(image);
    print(basketModel.price);
  }

  double totalPrice = 0.0;
  double delivery=0.0;
  void calcTotalPrice() {
    totalPrice = 0.0;
    basketProducts.forEach((element) {
      totalPrice += (element.price! * element.quantity!);
    });
    // totalPrice+=delivery;
    emit(CalculatedSuccessfullyState());
    print(basketProducts);
  }


  Future<void> postCart({ required pharmacyId,
    required distance})
  async {
    emit(PostCartLoadingState());
    DioHelper.postData(
      url: ApiConstants.postCart,
      data: {
        "userId":CacheHelper.getData(key: AppConstants.userId),
      }
    ).then((value)
    {
      emit(PostCartSuccessState());

      getCartId(pharmacyId: pharmacyId, distance: distance);

    }).catchError((onError)
    {
      emit(PostCartErrorState(onError.toString()));
    });

  }


  String? cartId;
  Future<void> getCartId({
    required pharmacyId,
    required distance})
  async {
    emit(GetCartIdLoadingState());

    DioHelper.getData(
        url: ApiConstants.getCartByUserId(
            CacheHelper.getData(key: AppConstants.userId).toString()))
        .then((value)
    {
      cartId=value.data["message"];
      print(cartId.toString());
      emit(GetCartIdSuccessState());
      postCartProducts(pharmacyId: pharmacyId, distance: distance);
    }).catchError((onError)
    {
      emit(GetCartIdErrorState(onError.toString()));
    });

  }


  Future<void> postCartProducts({ required pharmacyId,
    required distance}) async {

    emit(PostCartOrderLoadingState());

      DioHelper.postData(url: ApiConstants.postCartProducts,
          data: {
        "productId": basketProducts.first.productId,
        "usertId": CacheHelper.getData(key: AppConstants.userId),
        "cartId": int.parse(cartId.toString()),
        "quantity": basketProducts.first.quantity,
        "price": basketProducts.first.price
      })
          .then((value) {

        emit(PostCartOrderSuccessState());

        if(basketProducts.length>1)
        {
          basketProducts.asMap().forEach((elementIndex, element) {
            print(elementIndex);
            emit(PutCartOrderLoadingState());
            if(elementIndex>0) {
              DioHelper.putDataFromJson(
                  url: ApiConstants.postCartProducts,
                  data: {
                    "productId": basketProducts[elementIndex].productId,
                    "usertId": CacheHelper.getData(
                        key: AppConstants.userId),
                    "cartId": int.parse(cartId.toString()),
                    "quantity": basketProducts[elementIndex].quantity,
                    "price": basketProducts[elementIndex].price
                  }).then((value)
              {

                emit(PutCartOrderSuccessState());

              });
            }
          });
        }

        postOrder(pharmacyId: pharmacyId, distance: distance);

      }).catchError((onError) {
        emit(PostCartOrderErrorState(onError.toString()));
      });
  }



  Future<void> postOrder(
  {
    required pharmacyId,
    required distance
})
  async {
    emit(PostOrderLoadingState());
    print({
      "distance": distance,
      "destinationLatitude":AppConstants.myLat ,
      "destinationLongitude":AppConstants.myLong  ,
      "address": AppConstants.currentLocation,
      "fees": 0,
      "totalPrice": totalPrice,
      "userId": CacheHelper.getData(key: AppConstants.userId),
      "pharmacyId": pharmacyId,
      "cartId": cartId,
    });
    DioHelper.postData(
        url: ApiConstants.postOrder,
        data: {
          "distance": distance,
          "destinationLatitude":AppConstants.myLat ,
          "destinationLongitude":AppConstants.myLong  ,
          "address": AppConstants.currentLocation,
          "fees": 0,
          "totalPrice": totalPrice,
          "userId": CacheHelper.getData(key: AppConstants.userId),
          "pharmacyId": pharmacyId,
          "cartId": cartId,
        }
    ).then((value)
    {
      emit(PostOrderSuccessState());

      deleteCartProducts();

    }).catchError((onError)
    {
      emit(PostOrderErrorState(onError.toString()));
    });

  }


  void deleteCartProducts()
  {
    basketProducts=[];
    counter=[];
    totalPrice=0.0;
    emit(DeleteCartProductsSuccessState());
  }

}
