class ApproveClosingMocFormModel {
  int? mocFormId;
  String? notes;

  ApproveClosingMocFormModel({required this.mocFormId, this.notes});

  ApproveClosingMocFormModel.fromJson(Map<String, dynamic> json) {
    mocFormId = json['mocFormId'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mocFormId'] = this.mocFormId;
    data['notes'] = this.notes;

    return data;
  }
}
