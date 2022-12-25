import 'package:elagk/shared/network/api_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/dio_helper.dart';
import 'confirm_password_state.dart';

class ConfirmPasswordCubit extends Cubit<ConfirmPasswordStates>
{
  ConfirmPasswordCubit(): super(ConfirmPasswordInitialState());
  static  ConfirmPasswordCubit get(context) => BlocProvider.of(context);

  Future<void> sendCode({
    required int code,

  }) async {
    emit(SendCodeLoadingState());
    await DioHelper.getData(
      url: ApiConstants.activationCodePath(code),
    ).then((value) {
      emit(SendCodeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SendCodeErrorState(error.toString()));
    });}


}