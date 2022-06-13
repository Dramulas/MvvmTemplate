import 'category_dd_model.dart';

class FindingModel {
  CategoryDDModel? findingCategory;
  int? findingType;
  String? findingTypeStr;
  List<int>? categoryIds;
  String? categoryNames;
  String? observations;
  String? actionsTakenRightInTheField;
  String? actionsShouldBeTaken;
  String? fieldResponsibleExplanation;
  int? id;
  int? tourId;

  FindingModel(
      {this.findingCategory,
      this.findingType,
      this.findingTypeStr,
      this.categoryIds,
      this.categoryNames,
      this.observations,
      this.actionsTakenRightInTheField,
      this.actionsShouldBeTaken,
      this.fieldResponsibleExplanation,
      this.id,
      this.tourId});

  FindingModel.fromJson(Map<String, dynamic> json) {
    findingType = json['findingType'];
    findingTypeStr = json['findingTypeStr'];
    categoryIds = json['categoryIds'].cast<int>();
    categoryNames = json['categoryNames'];
    observations = json['observations'];
    actionsTakenRightInTheField = json['actionsTakenRightInTheField'];
    actionsShouldBeTaken = json['actionsShouldBeTaken'];
    fieldResponsibleExplanation = json['fieldResponsibleExplanation'];
    id = json['id'];
    tourId = json['tourId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['findingType'] = this.findingType;
    data['findingTypeStr'] = this.findingTypeStr;
    data['categoryIds'] = this.categoryIds;
    data['categoryNames'] = this.categoryNames;
    data['observations'] = this.observations;
    data['actionsTakenRightInTheField'] = this.actionsTakenRightInTheField;
    data['actionsShouldBeTaken'] = this.actionsShouldBeTaken;
    data['fieldResponsibleExplanation'] = this.fieldResponsibleExplanation;
    data['id'] = this.id;
    data['tourId'] = this.tourId;
    return data;
  }
}
