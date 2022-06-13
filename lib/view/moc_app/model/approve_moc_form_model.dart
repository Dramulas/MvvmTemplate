class ApproveMocFormModel {
  int? mocFormId;
  int? userIdFromMobile;

  ApproveMocFormModel({required this.mocFormId, this.userIdFromMobile});

  ApproveMocFormModel.fromJson(Map<String, dynamic> json) {
    mocFormId = json['mocFormId'];
    userIdFromMobile = json['userIdFromMobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mocFormId'] = this.mocFormId;
    data['userIdFromMobile'] = this.userIdFromMobile;

    return data;
  }
}
