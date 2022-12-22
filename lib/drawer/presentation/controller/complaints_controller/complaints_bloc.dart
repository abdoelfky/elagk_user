import 'dart:async';

import 'package:elagk_pharmacy/core/local/cache_helper.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/core/utils/app_routes.dart';
import 'package:elagk_pharmacy/core/utils/navigation.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/send_complaint_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'complaints_event.dart';

part 'complaints_state.dart';

class ComplaintsBloc extends Bloc<ComplaintsEvent, ComplaintsState> {
  final SendComplaintUseCase sendComplaintUseCase;

  ComplaintsBloc(this.sendComplaintUseCase) : super(const ComplaintsState()) {
    on<SendComplaintEvent>(_sendComplaint);
  }

  FutureOr<void> _sendComplaint(
    SendComplaintEvent event,
    Emitter<ComplaintsState> emit,
  ) async {
    await sendComplaintUseCase(
      SendComplaintParameters(
        userId: CacheHelper.getData(key: AppConstants.userId),
        issueType: event.issueType,
        issueDescription: event.issueDescription,
      ),
    ).then((value) => navigateFinalTo(
      context: event.context,
      screenRoute: Routes.homeDrawerScreen,
    ));
  }
}
