import 'package:flutter_bloc/flutter_bloc.dart';
import 'basket_states.dart';

class BasketCubit extends Cubit<BasketStates>
{
  BasketCubit(): super(InitialState());
  static  BasketCubit get(context) => BlocProvider.of(context);

  int counter = 1;

  void minus()async {
    if(counter<=1){
      print('fdv');
    }else {
      counter --;
      emit(MinusState());
    }
  }
  void plus()async {
    counter ++;
    emit(PlusState());

  }

}