class GiveTechnicalOAModel {
  int? techOAId;
  String? techOAComment;

  GiveTechnicalOAModel({required this.techOAId, required this.techOAComment});

  GiveTechnicalOAModel.fromJson(Map<String, dynamic> json) {
    techOAId = json['techOAId'];
    techOAComment = json['techOAComment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['techOAId'] = this.techOAId;
    data['techOAComment'] = this.techOAComment;

    return data;
  }
}
