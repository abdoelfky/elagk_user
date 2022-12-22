part of 'complaints_bloc.dart';

abstract class ComplaintsEvent extends Equatable {
  const ComplaintsEvent();
}

class SendComplaintEvent extends ComplaintsEvent {
  final BuildContext context;
  final String issueType;
  final String issueDescription;

  const SendComplaintEvent({
    required this.context,
    required this.issueType,
    required this.issueDescription,
  });

  @override
  List<Object> get props => [context,issueType, issueDescription];
}
