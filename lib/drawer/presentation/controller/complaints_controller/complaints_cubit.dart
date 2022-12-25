import 'package:bloc/bloc.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'complaints_state.dart';

class ComplaintsCubit extends Cubit<ComplaintsState> {
  ComplaintsCubit() : super(ComplaintsCubitInitialState());

  static ComplaintsCubit get(context) => BlocProvider.of(context);

  Future<void> sendComplaint({
    issueId,
    required String issueType,
    required String issueDescription,
    orderId,
  }) async {
    emit(SendComplaintLoadingState());
    print(CacheHelper.getData(key: AppConstants.userId));
    print(issueType);
    print(issueDescription);
    await DioHelper.postData(
      url: ApiConstants.complaints,
      data: {

        "issueType": issueType,
        "issueDescription": issueDescription,
        "userId": CacheHelper.getData(key: AppConstants.userId)
      },
    ).then((value) {
      emit(SendComplaintSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SendComplaintErrorState(error.toString()));
    });
  }
}
