class Complaint {
  final int complaintId;
  final String complaintNo;
  final String customerName;
  final String complaintDescription;
  final int statusId;
  final String status;
  final String restaurantName;
  final String createdDateString;
  final String comments;


  Complaint({
    required this.complaintId,
    required this.complaintNo,
    required this.customerName,
    required this.complaintDescription,
    required this.status,
    required this.statusId,
    required this.restaurantName,
    required this.createdDateString,
    required this.comments,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      complaintId: json['complaintId'],
      complaintNo: json['complaintNo'],
      customerName: json['customerName'] ?? "N/A",
      complaintDescription: json['complaintDescription'],
      status: json['status'],
      statusId: json['statusId'],
      restaurantName: json['restaurantName'],
      createdDateString: json['createdDateString'],
      comments: json['comments'] ?? "N/A",
    );
  }
}