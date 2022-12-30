import 'package:elagk/auth/data/models/register_model/register_model.dart';
import 'package:elagk/auth/presentation/controller/register_controller/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/api_constants.dart';
import '../../../../shared/network/dio_helper.dart';


class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit(): super(RegisterInitialState());

  static  RegisterCubit get(context) => BlocProvider.of(context);

  RegisterModel? registerModel;


  Future<void> userRegister({
    required String email,
    required String password,
    required String phone,
    required String firstName,
    required String lastName,


  }) async
  {
    emit(RegisterLoadingState());
    await DioHelper.postData(
        url: ApiConstants.register ,
        data:{
          "firstName": "${firstName}",
          "lastName": "${lastName}",
          "username":'${email.split(RegExp('\\W'))[0]}',
          "email": "${email}",
          "password": "${password}",
          "phones": [
            "${phone}"
          ],
          "roles": [
            {
              "name": "user"
            }
          ]
        }
    ).then((value) {

      // registerModel= RegisterModel.fromJson(value.data);

      emit(RegisterSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }




}