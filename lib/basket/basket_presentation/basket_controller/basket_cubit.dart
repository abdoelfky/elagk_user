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
      emit(MinusState());
  }
  }
  void plus({required int index})async {
    counter[index] ++;
    emit(PlusState());
  }


  List <BasketModel> baskets = [];
  Future<void> AddToCart(
  {
  required ProductModel productModel,

}) async {
    counter.insert(counter.length,1);
    BasketModel basketModel;
   basketModel=BasketModel.fromJson(
   {
   'productId' : productModel.productId,
   'productName' : productModel.productName,
   'imageUrl' : productModel.imageUrl,
   'price' : productModel.price,});
    emit(AddToBasketLoadingState());
  baskets.add(basketModel);
    emit(AddToBasketSuccessState());
    print(baskets.length);
    // print(basketModel.productId);
    print(basketModel.productName);
    print(basketModel.price);

  }

  Future<void> removeFromCart(
      {
        required int index,

      }) async {
    counter.removeAt(index);

    emit(removeFromCartLoadingState());
    baskets.removeAt(index);
    emit(removeFromCartSuccessState());
    print(baskets.length);

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
    baskets.add(basketModel);
    emit(AddToBasketSuccessState());
    print(baskets.length);
    // print(basketModel.productId);
    print(image);
    print(basketModel.price);

  }






}