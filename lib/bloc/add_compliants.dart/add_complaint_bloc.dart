import 'package:bloc/bloc.dart';
import 'package:bo_complaints/data/models/long_complaint_model.dart';
import 'package:equatable/equatable.dart';
import 'package:bo_complaints/data/repository/complaints_repository.dart';  // Your complaint repository
import 'package:bo_complaints/data/models/complaint_model.dart';  // Your complaint model

part 'add_complaint_event.dart';
part 'add_complaint_state.dart';

class AddComplaintBloc extends Bloc<AddComplaintEvent, AddComplaintState> {
  final ComplaintsRepository complaintsRepository;

  AddComplaintBloc({required this.complaintsRepository})
      : super(AddComplaintInitial()) {
    on<SubmitAddComplaintEvent>(_onSubmitAddComplaint);
  }

  Future<void> _onSubmitAddComplaint(
      SubmitAddComplaintEvent event, Emitter<AddComplaintState> emit) async {
    emit(AddComplaintLoading());
    try {
      // Fetch the list of existing complaints to find the max complaintId
      final complaints = await complaintsRepository.getComplaints();
      int newComplaintId = 0;

      if (complaints.isNotEmpty) {
        newComplaintId = complaints.map((complaint) => complaint.complaintId).reduce((a, b) => a > b ? a : b) + 1;
      }

      // Create a new complaint object
      final newComplaint = Data(
        complaintId: newComplaintId,
        complaintNo: 'Generated Complaint No',  // Example: Generate a complaint number
        complaintFrom: 'chef',
        complaintTypeId: event.complaintTypeId,
        complaintDescription: event.complaintDescription,
        statusId: 1,
        chefId: 3,  // Example: Static chefId for now
        userId: 0,
        createdDate: DateTime.now().toIso8601String(),
        comments: 'test comment',
        modifiedDate: DateTime.now().toIso8601String(),
        images: [],  // Empty list for now
        status: 'Processing',  // Default status
        restaurantName: 'Test Restaurant',
        customerName: 'Test Customer',
        complaintType: 'Complaint Type',
        createdDateString: DateTime.now().toString(),
      );

      // Add the new complaint
      final success = await complaintsRepository.addComplaint(newComplaint);

      if (success) {
        emit(AddComplaintSuccess());
      } else {
        emit(AddComplaintError(message: "Failed to add complaint"));
      }
    } catch (error) {
      emit(AddComplaintError(message: error.toString()));
    }
  }
}