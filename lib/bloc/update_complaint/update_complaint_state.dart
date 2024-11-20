part of 'update_complaint_bloc.dart';

abstract class UpdateComplaintState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateComplaintInitial extends UpdateComplaintState {}

class UpdateComplaintLoading extends UpdateComplaintState {}

class UpdateComplaintSuccess extends UpdateComplaintState {}

class UpdateComplaintError extends UpdateComplaintState {
  final String message;

  UpdateComplaintError({required this.message});

  @override
  List<Object> get props => [message];
}