import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_pharmacy_state.dart';

class LoginPharmacyCubit extends Cubit<LoginPharmacyState> {
  LoginPharmacyCubit() : super(LoginPharmacyInitialState());
  static LoginPharmacyCubit get(context) => BlocProvider.of(context);

}
