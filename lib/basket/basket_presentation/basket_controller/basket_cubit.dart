import 'package:elagk/basket/data/basket_model.dart';
import 'package:elagk/pharmacy/data/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'basket_states.dart';

class BasketCubit extends Cubit<BasketStates>
{
  BasketCubit(): super(InitialState());
  static  BasketCubit get(context) => BlocProvider.of(context);

  List<int> counter =[];

  void minus({required int index})async {
    if(counter[index]>1){
      counter[index] --;
      basketProducts[index]=BasketModel.fromJson(
          {
            'productId' : basketProducts[index].productId,
            'productName' : basketProducts[index].productName,
            'imageUrl' : basketProducts[index].imageUrl,
            'price' : basketProducts[index].price,
            'quantity' :counter[index],

          });
      calcTotalPrice();
      emit(MinusState());
  }
  }
  void plus({required int index})async {
    counter[index] ++;
    basketProducts[index]=BasketModel.fromJson(
        {
          'productId' : basketProducts[index].productId,
          'productName' : basketProducts[index].productName,
          'imageUrl' : basketProducts[index].imageUrl,
          'price' : basketProducts[index].price,
          'quantity' :counter[index],

        });
    calcTotalPrice();
    emit(PlusState());
  }


  List <BasketModel> basketProducts = [];
  Future<void> AddToCart(
  {
  required ProductModel productModel,

}) async {
    checkIfContain(ID: productModel.productId!).then((value)
    {
      if(productIfContain==false){
      counter.insert(counter.length,1);
      BasketModel basketModel;
      basketModel=BasketModel.fromJson(
          {
            'productId' : productModel.productId,
            'productName' : productModel.productName,
            'imageUrl' : productModel.imageUrl,
            'price' : productModel.price,
            'quantity' :1,

          });
      emit(AddToBasketLoadingState());
      basketProducts.add(basketModel);
      calcTotalPrice();
      emit(AddToBasketSuccessState());
      // print(basketProducts.length);
      // print(basketModel.productId);
      print(basketModel.productName);
      print(basketModel.price);

      }

      else
      {
        plus(index: index);
        print(index);
      }
    });



  }

  bool productIfContain=false;
  int index=0;
  Future<void>  checkIfContain({required int ID})
  async {
    productIfContain=false;
    if(basketProducts.isNotEmpty){
    basketProducts.asMap().forEach((elementIndex,element)
    {
      if(element.productId==ID)
      {
        productIfContain=true;
        index=elementIndex;

      }
    });
    }
    emit(CheckIfContainedSuccessfullyState());
  }

  Future<void> removeFromCart(
      {
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
    basketModel=BasketModel.fromJson(
        {
          'productId' : 0,
          'productName' : 'Prescription',
          'imageUrl' : image,
          'price' : 0.0,
        });
    emit(AddToBasketLoadingState());
    basketProducts.add(basketModel);
    emit(AddToBasketSuccessState());
    print(basketProducts.length);
    // print(basketModel.productId);
    print(image);
    print(basketModel.price);

  }

  double totalPrice=0.0;

  void calcTotalPrice()
  {
    totalPrice=0.0;
    basketProducts.forEach((element)
    {
      totalPrice += (element.price! * element.quantity!);
    });
    emit(CalculatedSuccessfullyState());
    print(basketProducts);
    if(basketProducts.isNotEmpty)
    {
      totalPrice += 15;

    }
  }




}