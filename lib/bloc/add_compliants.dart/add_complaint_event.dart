part of 'add_complaint_bloc.dart';

abstract class AddComplaintEvent extends Equatable {
  const AddComplaintEvent();

  @override
  List<Object> get props => [];
}

class SubmitAddComplaintEvent extends AddComplaintEvent {
  final String complaintDescription;
  final int complaintTypeId;

  const SubmitAddComplaintEvent({
    required this.complaintDescription,
    required this.complaintTypeId,
  });

  @override
  List<Object> get props => [complaintDescription, complaintTypeId];
}