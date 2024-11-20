part of 'update_complaint_bloc.dart';

abstract class UpdateComplaintEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SubmitUpdateComplaintEvent extends UpdateComplaintEvent {
  final UpdateComplaint updateComplaint;

  SubmitUpdateComplaintEvent({required this.updateComplaint});

  @override
  List<Object> get props => [updateComplaint];
}