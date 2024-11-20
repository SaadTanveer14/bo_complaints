import 'package:bo_complaints/data/models/update_complaint_model.dart';

abstract class ComplaintsEvent {}

class FetchComplaints extends ComplaintsEvent {}

class SearchComplaints extends ComplaintsEvent {
  final String query;

  SearchComplaints(this.query);
}

class UpdateComplaintEvent extends ComplaintsEvent {
  final UpdateComplaint updateComplaint;

  UpdateComplaintEvent(this.updateComplaint);

  @override
  List<Object> get props => [updateComplaint];
}