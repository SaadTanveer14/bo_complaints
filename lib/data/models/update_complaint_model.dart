class UpdateComplaint {
  final int id;
  final int status;
  final String comment;

  UpdateComplaint({
    required this.id,
    required this.status,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'comment': comment,
    };
  }
}