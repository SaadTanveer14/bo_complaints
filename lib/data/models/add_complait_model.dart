class AddComplaintModel {
  final String complaintDescription;
  final int complaintTypeId;
  final String comments;

  AddComplaintModel({
    required this.complaintDescription,
    required this.complaintTypeId,
    required this.comments,
  });

  // Convert AddComplaintModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'complaintDescription': complaintDescription,
      'complaintTypeId': complaintTypeId,
      'comments': comments,
    };
  }

  // Create AddComplaintModel from JSON
  factory AddComplaintModel.fromJson(Map<String, dynamic> json) {
    return AddComplaintModel(
      complaintDescription: json['complaintDescription'] ?? '',
      complaintTypeId: json['complaintTypeId'] ?? 0,
      comments: json['comments'] ?? '',
    );
  }
}