part of 'login_pharmacy_bloc.dart';

abstract class LoginPharmacyEvent extends Equatable {
  const LoginPharmacyEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends LoginPharmacyEvent {
  final BuildContext context;
  final String email;
  final String password;

  const LoginEvent({required this.context, required this.email, required this.password});

  @override
  List<Object> get props => [context, email, password];
}
