abstract class AboutUsState {}

class AboutUsCubitInitialState extends AboutUsState {}

class GetAboutUsLoadingState extends AboutUsState {}

class GetAboutUsSuccessState extends AboutUsState {}

class GetAboutUsErrorState extends AboutUsState
{
  final String error;

  GetAboutUsErrorState(this.error);

}
