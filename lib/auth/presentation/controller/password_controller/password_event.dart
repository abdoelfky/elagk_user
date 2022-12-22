part of 'password_bloc.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgetPasswordEvent extends PasswordEvent {
  final BuildContext context;
  final String email;

  const ForgetPasswordEvent({required this.context, required this.email});

  @override
  List<Object> get props => [context, email];
}

class SendMailEvent extends PasswordEvent {
  final BuildContext context;
  final String email;

  const SendMailEvent({required this.context, required this.email});

  @override
  List<Object> get props => [context, email];
}

class ActivationEmailEvent extends PasswordEvent {
  final BuildContext context;
  final int code;

  const ActivationEmailEvent({required this.context, required this.code});

  @override
  List<Object> get props => [context, code];
}

class ResetPasswordEvent extends PasswordEvent {
  final BuildContext context;
  final String password;
  final String email;

  const ResetPasswordEvent({
    required this.context,
    required this.password,
    required this.email,
  });

  @override
  List<Object> get props => [context, password, email];
}
