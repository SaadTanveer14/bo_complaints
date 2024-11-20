import 'package:bloc/bloc.dart';
import 'package:bo_complaints/data/repository/complaints_repository.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/update_complaint_model.dart';


part 'update_complaint_event.dart';
part 'update_complaint_state.dart';

class UpdateComplaintBloc extends Bloc<UpdateComplaintEvent, UpdateComplaintState> {
  final ComplaintsRepository complaintRepository;

  UpdateComplaintBloc({required this.complaintRepository})
      : super(UpdateComplaintInitial()) {
    on<SubmitUpdateComplaintEvent>(_onSubmitUpdateComplaint);
  }

  Future<void> _onSubmitUpdateComplaint(
      SubmitUpdateComplaintEvent event, Emitter<UpdateComplaintState> emit) async {
    emit(UpdateComplaintLoading());
    try {
      final success = await complaintRepository.updateComplaint(event.updateComplaint);
      if (success) {
        emit(UpdateComplaintSuccess());
      } else {
        emit(UpdateComplaintError(message: "Failed to update complaint"));
      }
    } catch (error) {
      emit(UpdateComplaintError(message: error.toString()));
    }
  }
}