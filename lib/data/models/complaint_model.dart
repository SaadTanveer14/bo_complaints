class Complaint {
  final int complaintId;
  final String complaintNo;
  final String customerName;
  final String complaintDescription;
  final String status;
  final String restaurantName;
  final String createdDateString;

  Complaint({
    required this.complaintId,
    required this.complaintNo,
    required this.customerName,
    required this.complaintDescription,
    required this.status,
    required this.restaurantName,
    required this.createdDateString,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      complaintId: json['complaintId'],
      complaintNo: json['complaintNo'],
      customerName: json['customerName'] == null ? "N/A" : json['customerName'],
      complaintDescription: json['complaintDescription'],
      status: json['status'],
      restaurantName: json['restaurantName'],
      createdDateString: json['createdDateString'],
    );
  }
}