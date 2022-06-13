import 'package:template_mobile/view/moc_app/model/moc_technical_opinion_acceptance_model.dart';

class MocFormModel {
  int? mocFormId;
  int? unitId;
  int? processDangerAnalysisFormType;
  int? monthParameter;
  bool? isChangeRequestUrgent;
  bool? isChangeRequestTemporary;
  String? mocNo;
  String? creationTime;
  String? companyName;
  String? consoleName;
  String? unitName;
  String? erNo;
  String? biifNo;
  String? changeRequestExplanation;
  String? riskExplanation;
  String? operationDetails;
  String? notes;
  String? requestorName;
  String? changeRequestType;
  String? categories;
  String? companyVicePresidentName;
  String? productionDirectorName;
  String? onCallChiefs;
  String? standPoint;
  List<dynamic>? technicalOpinionAndAcceptanceUsersByDisciplineList;
  List<dynamic>? attachments;
  List<dynamic>? standPointFiles;

  MocFormModel({
    this.mocFormId,
    this.creationTime,
    this.companyName,
    this.consoleName,
    this.unitName,
    this.unitId,
    this.erNo,
    this.biifNo,
    this.changeRequestExplanation,
    this.riskExplanation,
    this.operationDetails,
    this.notes,
    this.requestorName,
    this.changeRequestType,
    this.monthParameter,
    this.companyVicePresidentName,
    this.productionDirectorName,
    this.processDangerAnalysisFormType,
    this.categories,
    this.onCallChiefs,
    this.technicalOpinionAndAcceptanceUsersByDisciplineList,
    this.isChangeRequestUrgent,
    this.isChangeRequestTemporary,
    this.mocNo,
    this.standPoint,
    this.attachments,
    this.standPointFiles,
  });

  MocFormModel.fromJson(Map<String, dynamic> json) {
    mocFormId = json['mocFormId'];
    creationTime = json['creationTime'];
    companyName = json['companyName'];
    consoleName = json['consoleName'];
    unitName = json['unitName'];
    unitId = json['unitId'];
    erNo = json['erNo'];
    biifNo = json['biifNo'];
    changeRequestExplanation = json['changeRequestExplanation'];
    riskExplanation = json['riskExplanation'];
    operationDetails = json['operationDetails'];
    notes = json['notes'];
    requestorName = json['requestorName'];
    changeRequestType = json['changeRequestType'];
    monthParameter = json['monthParameter'];
    companyVicePresidentName = json['companyVicePresidentName'];
    productionDirectorName = json['productionDirectorName'];
    processDangerAnalysisFormType = json['processDangerAnalysisFormType'];
    categories = json['categories'];
    onCallChiefs = json['onCallChiefs'];
    technicalOpinionAndAcceptanceUsersByDisciplineList =
        json['technicalOpinionAndAcceptanceUsersByDisciplineList'];
    isChangeRequestUrgent = json['isChangeRequestUrgent'];
    isChangeRequestTemporary = json['isChangeRequestTemporary'];
    mocNo = json['mocNo'];
    standPoint = json['standPoint'];

    attachments = json['attachments'];
    standPointFiles = json['standPointFiles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mocFormId'] = this.mocFormId;
    data['creationTime'] = this.creationTime;
    data['companyName'] = this.companyName;
    data['consoleName'] = this.consoleName;
    data['unitName'] = this.unitName;
    data['unitId'] = this.unitId;
    data['erNo'] = this.erNo;
    data['biifNo'] = this.biifNo;
    data['changeRequestExplanation'] = this.changeRequestExplanation;
    data['riskExplanation'] = this.riskExplanation;
    data['operationDetails'] = this.operationDetails;
    data['notes'] = this.notes;
    data['requestorName'] = this.requestorName;
    data['changeRequestType'] = this.changeRequestType;
    data['monthParameter'] = this.monthParameter;
    data['companyVicePresidentName'] = this.companyVicePresidentName;
    data['productionDirectorName'] = this.productionDirectorName;
    data['processDangerAnalysisFormType'] = this.processDangerAnalysisFormType;
    data['categories'] = this.categories;
    data['onCallChiefs'] = this.onCallChiefs;
    data['technicalOpinionAndAcceptanceUsersByDisciplineList'] =
        this.technicalOpinionAndAcceptanceUsersByDisciplineList;
    data['isChangeRequestUrgent'] = this.isChangeRequestUrgent;
    data['isChangeRequestTemporary'] = this.isChangeRequestTemporary;
    data['mocNo'] = this.mocNo;
    data['standPoint'] = this.standPoint;

    data['attachments'] = this.attachments;
    data['standPointFiles'] = this.standPointFiles;

    return data;
  }
}

class TechnicalOA {
  String? disciplineName;
  List<String>? opinionGiverNames;
  String? acceptorName;
  int? acceptorId;

  TechnicalOA(this.disciplineName, this.opinionGiverNames, this.acceptorName,
      this.acceptorId);
}
