import 'dart:convert';
import 'package:http/http.dart' as http;

class ComplaintsProvider {
  Future<List<Map<String, dynamic>>> fetchComplaints() async {
    final response = await http.get(Uri.parse('https://brownonions-002-site2.ftempurl.com/api/Complaint/GetComplaints?ComplaintId=-1&ChefId=3&UserId=-1&StatusId=-1&ComplaintTypeId=-1&FromComplaint=chef'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data['data']);
    } else {
      throw Exception('Failed to load complaints');
    }
  }
}