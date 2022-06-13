class ApproveByPassModel {
  int? byPassFormId;
  int? byPassFormTimeLineItemId;

  ApproveByPassModel(
      {required this.byPassFormId, required this.byPassFormTimeLineItemId});

  ApproveByPassModel.fromJson(Map<String, dynamic> json) {
    byPassFormId = json['byPassFormId'];
    byPassFormTimeLineItemId = json['byPassFormTimeLineItemId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['byPassFormId'] = this.byPassFormId;
    data['byPassFormTimeLineItemId'] = this.byPassFormTimeLineItemId;
    return data;
  }
}
