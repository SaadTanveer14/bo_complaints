import 'package:bo_complaints/bloc/complaints/complaint_event.dart';
import 'package:bo_complaints/bloc/complaints/compliant_state.dart';
import 'package:bo_complaints/data/models/complaint_model.dart';
import 'package:bo_complaints/data/repository/complaints_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintsBloc extends Bloc<ComplaintsEvent, ComplaintsState> {
   final ComplaintsRepository repository;

   List<Complaint> allComplaints = []; // Store the full list of complaints

  ComplaintsBloc(this.repository) : super(ComplaintsInitial()) {
    on<FetchComplaints>((event, emit) async {
      emit(ComplaintsLoading());
      try {
        final complaints = await repository.getComplaints();
        allComplaints = complaints; // Save the full list
        emit(ComplaintsLoaded(complaints));
      } catch (e) {
        emit(ComplaintsError('Failed to load complaints'));
      }
    });

    on<SearchComplaints>((event, emit) {
      if (event.query.isEmpty) {
        emit(ComplaintsLoaded(allComplaints)); // Show all complaints if query is empty
      } else {
        final filteredComplaints = allComplaints.where((complaint) {
          return complaint.customerName.toLowerCase().contains(event.query.toLowerCase()) ||
                 complaint.complaintDescription.toLowerCase().contains(event.query.toLowerCase());
        }).toList();
        emit(ComplaintsLoaded(filteredComplaints));
      }
    });


  //  on<UpdateComplaintEvent>((event, emit) async {
  //     emit(ComplaintsLoading());
  //     try {
  //       // Simulate update operation (replace this with your API call)
  //       final index = allComplaints.indexWhere((c) => c.id == event.updateComplaint.id);
  //       if (index != -1) {
  //         allComplaints[index] = allComplaints[index].copyWith(
  //           status: event.updateComplaint.status,
  //           comment: event.updateComplaint.comment,
  //         );
  //       }
  //       emit(ComplaintsLoaded(allComplaints));
  //     } catch (error) {
  //       emit(ComplaintsError("Failed to update complaint: $error"));
  //     }
  //   });
  
  }
}