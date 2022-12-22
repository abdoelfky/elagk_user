import 'dart:async';

import 'package:elagk_pharmacy/core/local/cache_helper.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/core/utils/enums.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/pharmacy_user_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_pharmacy_user_profile_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pharmacy_profile_event.dart';

part 'pharmacy_profile_state.dart';

class PharmacyProfileBloc
    extends Bloc<PharmacyProfileEvent, PharmacyProfileState> {
  final GetPharmacyUserProfileUseCase getPharmacyUserProfileUseCase;

  PharmacyProfileBloc(this.getPharmacyUserProfileUseCase) : super(const PharmacyProfileState()) {on<GetPharmacyUserProfileEvent>(_getPharmacyUserProfile);}

  FutureOr<void> _getPharmacyUserProfile(GetPharmacyUserProfileEvent event, Emitter<PharmacyProfileState> emit) async {
    final result = await getPharmacyUserProfileUseCase(
      GetPharmacyUserParameters(userId: CacheHelper.getData(key: AppConstants.userId)), // Done
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            pharmacyUserRequestState: RequestState.error,
            pharmacyUserMessage: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            pharmacyUserRequestState: RequestState.loaded,
            pharmacyUser: r,
          ),
        );
      },
    );
  }
}
