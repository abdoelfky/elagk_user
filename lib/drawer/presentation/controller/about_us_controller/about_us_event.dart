part of 'about_us_bloc.dart';

abstract class AboutUsEvent extends Equatable {
  const AboutUsEvent();

  @override
  List<Object> get props => [];
}

class GetContactUsEvent extends AboutUsEvent {
  const GetContactUsEvent();

  @override
  List<Object> get props => [];
}

class GetAboutUsFirstEvent extends AboutUsEvent {
  const GetAboutUsFirstEvent();

  @override
  List<Object> get props => [];
}

class GetAboutUsSecondEvent extends AboutUsEvent {
  const GetAboutUsSecondEvent();

  @override
  List<Object> get props => [];
}

class ContactUsViaLocationEvent extends AboutUsEvent {
  final String latitude;
  final String longitude;

  const ContactUsViaLocationEvent({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object> get props => [latitude, longitude];
}

class ContactUsViaCallEvent extends AboutUsEvent {

  const ContactUsViaCallEvent();

  @override
  List<Object> get props => [];
}

class ContactUsViaEmailEvent extends AboutUsEvent {
  final String email;

  const ContactUsViaEmailEvent(this.email);

  @override
  List<Object> get props => [email];
}

class ContactUsViaWhatsappEvent extends AboutUsEvent {
  final BuildContext context;
  final String whatsApp;

  const ContactUsViaWhatsappEvent({
    required this.context,
    required this.whatsApp,
  });

  @override
  List<Object> get props => [context, whatsApp];
}

class ContactUsViaFacebookEvent extends AboutUsEvent {
  final String facebook;

  const ContactUsViaFacebookEvent(this.facebook);

  @override
  List<Object> get props => [facebook];
}

class ContactUsViaInstagramEvent extends AboutUsEvent {
  final String instagram;

  const ContactUsViaInstagramEvent(this.instagram);

  @override
  List<Object> get props => [instagram];
}
