import 'package:equatable/equatable.dart';
import '../../data/models/complaint_model.dart';

abstract class ComplaintsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ComplaintsInitial extends ComplaintsState {}

class ComplaintsLoading extends ComplaintsState {}

class ComplaintsLoaded extends ComplaintsState {
  final List<Complaint> complaints;

  ComplaintsLoaded(this.complaints);

  @override
  List<Object> get props => [complaints];
}

class ComplaintsError extends ComplaintsState {
  final String message;

  ComplaintsError(this.message);

  @override
  List<Object> get props => [message];
}