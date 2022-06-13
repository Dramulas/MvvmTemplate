class ClosingMocFormModel {
  int? mocFormId;
  String? companyName;
  String? unitName;
  String? date;
  String? mocNo;
  String? mocTopic;
  String? notes;
  int? mocFormStatus;
  String? changeRequestExplanation;
  // Bool? IsApprovalUsers;
  String? status;
  String? biifNo;
  String? erNo;

  ClosingMocFormModel({
    this.mocFormId,
    this.companyName,
    this.unitName,
    this.date,
    this.mocFormStatus,
    this.mocNo,
    this.mocTopic,
    this.notes,
    this.changeRequestExplanation,
    // this.isCompleted,
    this.status,
    this.biifNo,
  });

  ClosingMocFormModel.fromJson(Map<String, dynamic> json) {
    mocFormId = json['mocFormId'];
    companyName = json['companyName'];
    unitName = json['unitName'];
    date = json['date'];
    mocFormId = json['mocFormId'];
    mocNo = json['mocNo'];
    mocTopic = json['mocTopic'];
    notes = json['notes'];
    mocFormStatus = json['mocFormStatus'];
    changeRequestExplanation = json['changeRequestExplanation'];
    // isCompleted = json['isCompleted'];
    status = json['status'];
    biifNo = json['biifNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mocFormId'] = this.mocFormId;
    data['companyName'] = this.companyName;
    data['unitName'] = this.unitName;
    data['date'] = this.date;
    data['mocForm'] = this.mocNo;
    data['mocFormId'] = this.mocFormId;
    data['mocTopic'] = this.mocTopic;
    data['notes'] = this.notes;
    data['mocFormStatus'] = this.mocFormStatus;
    data['changeRequestExplanation'] = this.changeRequestExplanation;
    // data['isCompleted'] = this.isCompleted;
    data['status'] = this.status;
    data['biifNo'] = this.biifNo;

    return data;
  }
}
