import 'dart:convert';
import 'package:bo_complaints/data/models/add_complait_model.dart';
import 'package:bo_complaints/data/models/long_complaint_model.dart';
import 'package:bo_complaints/data/models/update_complaint_model.dart';
import 'package:http/http.dart' as http;

class ComplaintsProvider {

  final String baseUrl = 'https://brownonions-002-site2.ftempurl.com/api/Complaint';

  Future<List<Map<String, dynamic>>> fetchComplaints() async {
    final response = await http.get(Uri.parse('$baseUrl/GetComplaints?ComplaintId=-1&ChefId=3&UserId=-1&StatusId=-1&ComplaintTypeId=-1&FromComplaint=chef'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data['data']);
    } else {
      throw Exception('Failed to load complaints');
    }
  }

  Future<bool> updateComplaint(UpdateComplaint updateComplaint) async {
    Map<String, dynamic> queryParams = {
        'ComplaintId': updateComplaint.id.toString(),
        'StatusId': updateComplaint.status.toString(),
        'Comment': updateComplaint.comment,
      };
    try {
      Uri uri = Uri.parse('$baseUrl/UpdateComplaint').replace(queryParameters: queryParams);
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        return true; // Success
      } else {
        throw Exception('Failed to update complaint: ${response.body}');
      }
    } catch (e) {
      print(e);
      
      throw Exception('Error updating complaint: $e');
    }
  }

  // Add complaint
  Future<bool> addComplaint(Data addComplaintModel) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/complaints'),
        body: json.encode(addComplaintModel.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      return response.statusCode == 200;
    } catch (e) {
      print("Error adding complaint: $e");
      return false;
    }
  }
}