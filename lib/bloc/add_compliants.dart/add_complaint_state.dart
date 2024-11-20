part of 'add_complaint_bloc.dart';

abstract class AddComplaintState extends Equatable {
  const AddComplaintState();

  @override
  List<Object> get props => [];
}

class AddComplaintInitial extends AddComplaintState {}

class AddComplaintLoading extends AddComplaintState {}

class AddComplaintSuccess extends AddComplaintState {}

class AddComplaintError extends AddComplaintState {
  final String message;
  
  const AddComplaintError({required this.message});

  @override
  List<Object> get props => [message];
}