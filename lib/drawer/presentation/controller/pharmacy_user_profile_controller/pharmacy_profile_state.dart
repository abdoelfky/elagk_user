part of 'pharmacy_profile_bloc.dart';

class PharmacyProfileState extends Equatable {
  final PharmacyUser? pharmacyUser;
  final RequestState pharmacyUserRequestState;
  final String pharmacyUserMessage;

  const PharmacyProfileState({
    this.pharmacyUser,
    this.pharmacyUserRequestState = RequestState.loading,
    this.pharmacyUserMessage = AppConstants.empty,
  });

  PharmacyProfileState copyWith({
    PharmacyUser? pharmacyUser,
    RequestState? pharmacyUserRequestState,
    String? pharmacyUserMessage,
  }) {
    return PharmacyProfileState(
      pharmacyUser: pharmacyUser ?? this.pharmacyUser,
      pharmacyUserRequestState:
          pharmacyUserRequestState ?? this.pharmacyUserRequestState,
      pharmacyUserMessage: pharmacyUserMessage ?? this.pharmacyUserMessage,
    );
  }

  @override
  List<Object?> get props => [
        pharmacyUser,
        pharmacyUserRequestState,
        pharmacyUserMessage,
      ];
}
