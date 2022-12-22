import 'package:elagk/auth/presentation/controller/password_controller/password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordPharmacyCubit extends Cubit<PasswordPharmacyState> {
  PasswordPharmacyCubit() : super(PasswordPharmacyInitialState());
  static PasswordPharmacyCubit get(context) => BlocProvider.of(context);

}
