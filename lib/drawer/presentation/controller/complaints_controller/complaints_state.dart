part of 'complaints_cubit.dart';

@immutable
abstract class ComplaintsState {}

class ComplaintsCubitInitialState extends ComplaintsState {}

class SendComplaintLoadingState extends ComplaintsState{}

class SendComplaintSuccessState extends ComplaintsState{}

class SendComplaintErrorState extends ComplaintsState
{
  final String error;

  SendComplaintErrorState(this.error);
}
