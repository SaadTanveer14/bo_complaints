class long_complaint_model {
  int? apiStatusCode;
  String? notifyMessage;
  int? status;
  List<Data>? data;
  Null? decision;
  Null? message;
  Null? apiCallStream;
  Null? apiKey;

  long_complaint_model(
      {this.apiStatusCode,
      this.notifyMessage,
      this.status,
      this.data,
      this.decision,
      this.message,
      this.apiCallStream,
      this.apiKey});

  long_complaint_model.fromJson(Map<String, dynamic> json) {
    apiStatusCode = json['apiStatusCode'];
    notifyMessage = json['notifyMessage'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    decision = json['decision'];
    message = json['message'];
    apiCallStream = json['apiCallStream'];
    apiKey = json['apiKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apiStatusCode'] = this.apiStatusCode;
    data['notifyMessage'] = this.notifyMessage;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['decision'] = this.decision;
    data['message'] = this.message;
    data['apiCallStream'] = this.apiCallStream;
    data['apiKey'] = this.apiKey;
    return data;
  }
}

class Data {
  int? complaintId;
  String? complaintNo;
  String? complaintFrom;
  int? complaintTypeId;
  String? complaintDescription;
  int? statusId;
  int? chefId;
  int? userId;
  String? createdDate;
  String? comments;
  String? modifiedDate;
  List<Images>? images;
  String? status;
  String? restaurantName;
  String? customerName;
  String? complaintType;
  String? createdDateString;

  Data(
      {this.complaintId,
      this.complaintNo,
      this.complaintFrom,
      this.complaintTypeId,
      this.complaintDescription,
      this.statusId,
      this.chefId,
      this.userId,
      this.createdDate,
      this.comments,
      this.modifiedDate,
      this.images,
      this.status,
      this.restaurantName,
      this.customerName,
      this.complaintType,
      this.createdDateString});

  Data.fromJson(Map<String, dynamic> json) {
    complaintId = json['complaintId'];
    complaintNo = json['complaintNo'];
    complaintFrom = json['complaintFrom'];
    complaintTypeId = json['complaintTypeId'];
    complaintDescription = json['complaintDescription'];
    statusId = json['statusId'];
    chefId = json['chefId'];
    userId = json['userId'];
    createdDate = json['createdDate'];
    comments = json['comments'];
    modifiedDate = json['modifiedDate'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    status = json['status'];
    restaurantName = json['restaurantName'];
    customerName = json['customerName'];
    complaintType = json['complaintType'];
    createdDateString = json['createdDateString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['complaintId'] = this.complaintId;
    data['complaintNo'] = this.complaintNo;
    data['complaintFrom'] = this.complaintFrom;
    data['complaintTypeId'] = this.complaintTypeId;
    data['complaintDescription'] = this.complaintDescription;
    data['statusId'] = this.statusId;
    data['chefId'] = this.chefId;
    data['userId'] = this.userId;
    data['createdDate'] = this.createdDate;
    data['comments'] = this.comments;
    data['modifiedDate'] = this.modifiedDate;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['restaurantName'] = this.restaurantName;
    data['customerName'] = this.customerName;
    data['complaintType'] = this.complaintType;
    data['createdDateString'] = this.createdDateString;
    return data;
  }
}

class Images {
  int? imageId;
  int? entityId;
  String? imageName;
  String? ext;
  int? imageTypeId;
  String? imagePath;
  Null? imageBinary;
  bool? isActive;
  String? createdDate;
  Null? sortingOrderId;

  Images(
      {this.imageId,
      this.entityId,
      this.imageName,
      this.ext,
      this.imageTypeId,
      this.imagePath,
      this.imageBinary,
      this.isActive,
      this.createdDate,
      this.sortingOrderId});

  Images.fromJson(Map<String, dynamic> json) {
    imageId = json['imageId'];
    entityId = json['entityId'];
    imageName = json['imageName'];
    ext = json['ext'];
    imageTypeId = json['imageTypeId'];
    imagePath = json['imagePath'];
    imageBinary = json['imageBinary'];
    isActive = json['isActive'];
    createdDate = json['createdDate'];
    sortingOrderId = json['sortingOrderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageId'] = this.imageId;
    data['entityId'] = this.entityId;
    data['imageName'] = this.imageName;
    data['ext'] = this.ext;
    data['imageTypeId'] = this.imageTypeId;
    data['imagePath'] = this.imagePath;
    data['imageBinary'] = this.imageBinary;
    data['isActive'] = this.isActive;
    data['createdDate'] = this.createdDate;
    data['sortingOrderId'] = this.sortingOrderId;
    return data;
  }
}