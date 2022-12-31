import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/local/shared_preference.dart';
import '../../shared/utils/app_routes.dart';
import '../../shared/utils/navigation.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit() : super(OnboardingInitialState());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  bool isLast = false;

  void changeOnBoarding(index, boardingLength) {
    if (index == boardingLength - 1) {
      isLast = true;
      emit(ChangeOnBoardingState());
    } else {
      isLast = false;
      emit(ChangeOnBoardingState());
    }
  }

  void submit(context) {
    CacheHelper.setData(key: AppConstants.onBoarding, value: true)
        .then((value) {
      if (value == true) {
        navigateFinalTo(context: context, screenRoute: Routes.loginScreen);
      }
    });
  }
}
