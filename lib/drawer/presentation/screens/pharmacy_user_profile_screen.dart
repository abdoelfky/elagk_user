
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/enums.dart';
import '../components/error_screen.dart';
import '../components/loading_widget.dart';
import '../components/pharmacy_user_profile/pharmacy_user_profile_content.dart';
import '../controller/pharmacy_user_profile_controller/pharmacy_profile_bloc.dart';

class PharmacyUserProfileScreen extends StatelessWidget {
  const PharmacyUserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<PharmacyProfileBloc, PharmacyProfileState>(
        builder: (context, state) {
          switch (state.pharmacyUserRequestState) {
            case RequestState.loading:
              return const LoadingWidget(showDrawer: true);
            case RequestState.loaded:
              return const PharmacyUserProfileContent();
            case RequestState.error:
              return const ErrorScreen();
          }return const ErrorScreen();
        },
      ),
    );
  }
}
