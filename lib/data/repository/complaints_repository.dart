import '../models/complaint_model.dart';
import 'complaints_provider.dart';

class ComplaintsRepository {
  final ComplaintsProvider provider;

  ComplaintsRepository(this.provider);

  Future<List<Complaint>> getComplaints() async {
    final rawData = await provider.fetchComplaints();
    return rawData.map((json) => Complaint.fromJson(json)).toList();
  }
}