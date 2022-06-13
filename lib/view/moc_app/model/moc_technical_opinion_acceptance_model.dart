class TechnicalOAModel {
  int? techOAId;
  String? companyName;
  String? unitName;
  String? date;
  String? mocNo;
  int? mocFormId;
  String? mocTopic;
  String? techOAComment;
  String? mocFormStatus;
  String? changeRequestExplanation;
  // Bool? isCompleted;
  String? status;
  String? biifNo;
  TechnicalOAModel({
    this.techOAId,
    this.companyName,
    this.unitName,
    this.date,
    this.mocNo,
    this.mocFormId,
    this.mocTopic,
    this.techOAComment,
    this.mocFormStatus,
    this.changeRequestExplanation,
    // this.isCompleted,
    this.status,
    this.biifNo,
  });

  TechnicalOAModel.fromJson(Map<String, dynamic> json) {
    techOAId = json['techOAId'];
    companyName = json['companyName'];
    unitName = json['unitName'];
    date = json['date'];
    mocFormId = json['mocFormId'];
    mocNo = json['mocNo'];
    mocTopic = json['mocTopic'];
    techOAComment = json['techOAComment'];
    mocFormStatus = json['mocFormStatus'];
    changeRequestExplanation = json['changeRequestExplanation'];
    // isCompleted = json['isCompleted'];
    status = json['status'];
    biifNo = json['biifNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['techOAId'] = this.techOAId;
    data['companyName'] = this.companyName;
    data['unitName'] = this.unitName;
    data['date'] = this.date;
    data['mocNo'] = this.mocNo;
    data['mocFormId'] = this.mocFormId;
    data['mocTopic'] = this.mocTopic;
    data['techOAComment'] = this.techOAComment;
    data['mocFormStatus'] = this.mocFormStatus;
    data['changeRequestExplanation'] = this.changeRequestExplanation;
    // data['isCompleted'] = this.isCompleted;
    data['status'] = this.status;
    data['biifNo'] = this.biifNo;

    return data;
  }
}
