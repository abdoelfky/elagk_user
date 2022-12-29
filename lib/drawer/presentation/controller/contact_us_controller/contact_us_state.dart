abstract class ContactUsState {}

class ContactUsCubitInitialState extends ContactUsState {}

class GetContactUsLoadingState extends ContactUsState {}

class GetContactUsSuccessState extends ContactUsState {}

class GetContactUsErrorState extends ContactUsState
{
  final String error;

  GetContactUsErrorState(this.error);

}
