import 'package:bloc/bloc.dart';
import 'package:elagk/drawer/data/models/past_orders/stepper_follow_model.dart';
import 'package:elagk/drawer/presentation/controller/stepper_controller/stepper_state.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StepperCubit extends Cubit<StepperState> {
  StepperCubit() : super(StepperInitial());
  static StepperCubit get(context) => BlocProvider.of(context);



  StepperFollowModel? stepperFollowModel;
  Future<StepperFollowModel?> followOrder({required orderId})
  async {
    emit(OrderFollowLoadingState());
    DioHelper.getData(url: ApiConstants.followOrder(orderId))
        .then((value)
    {
      stepperFollowModel=StepperFollowModel.fromJson(value.data);
      emit(OrderFollowSuccessState());

    }).catchError((onError)
    {
      print(onError.toString());
      emit(OrderFollowErrorState());

    });

    return stepperFollowModel;

  }







}
