import 'package:bo_complaints/data/models/long_complaint_model.dart';
import 'package:bo_complaints/data/models/update_complaint_model.dart';

import '../models/complaint_model.dart';
import 'complaints_provider.dart';

class ComplaintsRepository {
  final ComplaintsProvider provider;

  ComplaintsRepository(this.provider);

  Future<List<Complaint>> getComplaints() async {
    final rawData = await provider.fetchComplaints();
    return rawData.map((json) => Complaint.fromJson(json)).toList();
  }

  Future<bool> updateComplaint(UpdateComplaint updateComplaint) async {
    return await provider.updateComplaint(updateComplaint);
  }

  // Add complaint
  Future<bool> addComplaint(Data addComplaintModel) async {
    try {
      final response = await provider.addComplaint(addComplaintModel);
      return response != null;
    } catch (e) {
      print("Error adding complaint: $e");
      return false;
    }
  }
}