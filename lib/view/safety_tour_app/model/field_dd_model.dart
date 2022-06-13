class FieldDDModel {
  int? id;
  int? locationId;
  String? fieldName;

  FieldDDModel({required this.id, required this.fieldName});

  FieldDDModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locationId = json['locationId'];
    fieldName = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['locationId'] = this.locationId;
    data['name'] = this.fieldName;
    return data;
  }
}
