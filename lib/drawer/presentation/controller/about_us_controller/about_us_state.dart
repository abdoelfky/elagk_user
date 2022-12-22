part of 'about_us_bloc.dart';

class AboutUsState extends Equatable {
  // Contact us
  final ContactUs? contactUs;
  final RequestState contactUsRequestState;
  final String contactUsMessage;

  // About us first
  final AboutUsFirst? aboutUsFirst;
  final RequestState aboutUsFirstRequestState;
  final String aboutUsFirstMessage;

  // About us second
  final AboutUsSecond? aboutUsSecond;
  final RequestState aboutUsSecondRequestState;
  final String aboutUsSecondMessage;

  const AboutUsState({
    // Contact us
    this.contactUs,
    this.contactUsRequestState = RequestState.loading,
    this.contactUsMessage = '',
    // About us first
    this.aboutUsFirst,
    this.aboutUsFirstRequestState = RequestState.loading,
    this.aboutUsFirstMessage = '',
    // About us second
    this.aboutUsSecond,
    this.aboutUsSecondRequestState = RequestState.loading,
    this.aboutUsSecondMessage = '',
  });

  AboutUsState copyWith({
    // Contact us
    ContactUs? contactUs,
    RequestState? contactUsRequestState,
    String? contactUsMessage,
    // About us first
    AboutUsFirst? aboutUsFirst,
    RequestState? aboutUsFirstRequestState,
    String? aboutUsFirstMessage,
    // About us second
    AboutUsSecond? aboutUsSecond,
    RequestState? aboutUsSecondRequestState,
    String? aboutUsSecondMessage,
  }) {
    return AboutUsState(
      // Contact us
      contactUs: contactUs ?? this.contactUs,
      contactUsRequestState:
          contactUsRequestState ?? this.contactUsRequestState,
      contactUsMessage: contactUsMessage ?? this.contactUsMessage,
      // About us first
      aboutUsFirst: aboutUsFirst ?? this.aboutUsFirst,
      aboutUsFirstRequestState:
          aboutUsFirstRequestState ?? this.aboutUsFirstRequestState,
      aboutUsFirstMessage: aboutUsFirstMessage ?? this.aboutUsFirstMessage,
      // About us second
      aboutUsSecond: aboutUsSecond ?? this.aboutUsSecond,
      aboutUsSecondRequestState:
          aboutUsSecondRequestState ?? this.aboutUsSecondRequestState,
      aboutUsSecondMessage: aboutUsSecondMessage ?? this.aboutUsSecondMessage,
    );
  }

  @override
  List<Object?> get props => [
        // Contact us
        contactUs,
        contactUsRequestState,
        contactUsMessage,
        // About us first
        aboutUsFirst,
        aboutUsFirstRequestState,
        aboutUsFirstMessage,
        // About us second
        aboutUsSecond,
        aboutUsSecondRequestState,
        aboutUsSecondMessage,
      ];
}
