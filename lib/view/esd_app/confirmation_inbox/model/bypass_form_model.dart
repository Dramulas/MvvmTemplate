class ByPassFormModel {
  int? id;
  int? byPassFormTimelineItemId;
  String? userCreatedFormName;
  int? userCreatedFormId;
  String? refineryName;
  int? refineryId;
  String? unitName;
  int? unitId;
  String? sectionName;
  int? sectionId;
  String? safetySystemTypeName;
  int? safetySystemTypeId;
  String? safetySystemSubTypeName;
  int? safetySystemSubTypeId;
  String? tripParameterTagNo;
  String? boundEquipmentTypeName;
  String? boundEquipmentName;
  int? boundEquipmentId;
  String? measurementToolName;
  int? measurementToolId;
  String? alarmSet;
  String? tripSet;
  String? safetySystemExplanation;
  String? mosByPassSwitchTagNo;
  String? posByPassSwitchTagNo;
  String? voting;
  int? silLevel;
  String? function;
  String? potentialDangerAndOutcome;
  String? parametersToBeFollowed;
  String? actionPlan;
  String? byPassStartDate;
  String? biifNo;
  int? estimatedByPassTime;
  String? byPassCause;
  String? explanationsOpinions;
  String? verballyInformedPeopleNames;
  List<int>? verballyInformedPeopleIds;
  String? peopleDoByPassNames;
  List<int>? peopleDoByPassIds;
  String? unitsToBeEffectedInUrgentSituationsNames;
  List<int>? unitsToBeEffectedInUrgentSituationsIds;
  String? byPassFormStatus;
  String? byPassFormCreatedDate;
  String? byPassCompletedDate;
  String? byPassSystemCompletedDate;
  // List<int>? peopleCompletedByPassIds;
  // String? peopleCompletedByPassNames;
  String? byPassFormTimePassed;
  // List<String>? filesNames;
  TripParameterTagNoObject? tripParameterTagNoObject;
  String? order;
  String? onCallChiefName;
  String? onCallResponsibleName;

  ByPassFormModel(
      {this.id,
      this.userCreatedFormName,
      this.userCreatedFormId,
      this.refineryName,
      this.refineryId,
      this.unitName,
      this.unitId,
      this.sectionName,
      this.sectionId,
      this.safetySystemTypeName,
      this.safetySystemTypeId,
      this.safetySystemSubTypeName,
      this.safetySystemSubTypeId,
      this.tripParameterTagNo,
      this.boundEquipmentTypeName,
      this.boundEquipmentName,
      this.boundEquipmentId,
      this.measurementToolName,
      this.measurementToolId,
      this.alarmSet,
      this.tripSet,
      this.safetySystemExplanation,
      this.mosByPassSwitchTagNo,
      this.posByPassSwitchTagNo,
      this.voting,
      this.silLevel,
      this.function,
      this.potentialDangerAndOutcome,
      this.parametersToBeFollowed,
      this.actionPlan,
      this.byPassStartDate,
      this.biifNo,
      this.estimatedByPassTime,
      this.byPassCause,
      this.explanationsOpinions,
      this.verballyInformedPeopleNames,
      this.verballyInformedPeopleIds,
      this.peopleDoByPassNames,
      this.peopleDoByPassIds,
      this.unitsToBeEffectedInUrgentSituationsNames,
      this.unitsToBeEffectedInUrgentSituationsIds,
      this.byPassFormStatus,
      this.byPassFormCreatedDate,
      this.byPassCompletedDate,
      this.byPassSystemCompletedDate,
      // this.peopleCompletedByPassIds,
      // this.peopleCompletedByPassNames,
      this.byPassFormTimePassed,
      // this.filesNames,
      this.tripParameterTagNoObject,
      this.order,
      this.onCallChiefName,
      this.onCallResponsibleName});

  ByPassFormModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    byPassFormTimelineItemId = json['byPassFormTimelineItemId'];
    userCreatedFormName = json['userCreatedFormName'];
    userCreatedFormId = json['userCreatedFormId'];
    refineryName = json['refineryName'];
    refineryId = json['refineryId'];
    unitName = json['unitName'];
    unitId = json['unitId'];
    sectionName = json['sectionName'];
    sectionId = json['sectionId'];
    safetySystemTypeName = json['safetySystemTypeName'];
    safetySystemTypeId = json['safetySystemTypeId'];
    safetySystemSubTypeName = json['safetySystemSubTypeName'];
    safetySystemSubTypeId = json['safetySystemSubTypeId'];
    tripParameterTagNo = json['tripParameterTagNo'];
    boundEquipmentTypeName = json['boundEquipmentTypeName'];
    boundEquipmentName = json['boundEquipmentName'];
    boundEquipmentId = json['boundEquipmentId'];
    measurementToolName = json['measurementToolName'];
    measurementToolId = json['measurementToolId'];
    alarmSet = json['alarmSet'];
    tripSet = json['tripSet'];
    safetySystemExplanation = json['safetySystemExplanation'];
    mosByPassSwitchTagNo = json['mosByPassSwitchTagNo'];
    posByPassSwitchTagNo = json['posByPassSwitchTagNo'];
    voting = json['voting'];
    silLevel = json['silLevel'];
    function = json['function'];
    potentialDangerAndOutcome = json['potentialDangerAndOutcome'];
    parametersToBeFollowed = json['parametersToBeFollowed'];
    actionPlan = json['actionPlan'];
    byPassStartDate = json['byPassStartDate'];
    biifNo = json['biifNo'];
    estimatedByPassTime = json['estimatedByPassTime'];
    byPassCause = json['byPassCause'];
    explanationsOpinions = json['explanationsOpinions'];
    verballyInformedPeopleNames = json['verballyInformedPeopleNames'];
    //verballyInformedPeopleIds = json['verballyInformedPeopleIds'].cast<int>();
    peopleDoByPassNames = json['peopleDoByPassNames'];
    //peopleDoByPassIds = json['peopleDoByPassIds'].cast<int>();
    unitsToBeEffectedInUrgentSituationsNames =
        json['unitsToBeEffectedInUrgentSituationsNames'];
    //unitsToBeEffectedInUrgentSituationsIds = json['unitsToBeEffectedInUrgentSituationsIds'].cast<int>();
    byPassFormStatus = json['byPassFormStatus'];
    byPassFormCreatedDate = json['byPassFormCreatedDate'];
    byPassCompletedDate = json['byPassCompletedDate'];
    byPassSystemCompletedDate = json['byPassSystemCompletedDate'];
    // peopleCompletedByPassIds = json['peopleCompletedByPassIds'].cast<int>();
    // peopleCompletedByPassNames = json['peopleCompletedByPassNames'];
    byPassFormTimePassed = json['byPassFormTimePassed'];
    // filesNames = json['filesNames'].cast<String>();
    tripParameterTagNoObject = json['tripParameterTagNoObject'] != null
        ? new TripParameterTagNoObject.fromJson(
            json['tripParameterTagNoObject'])
        : null;
    order = json['order'];
    onCallChiefName = json['onCallChiefName'];
    onCallResponsibleName = json['onCallResponsibleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['byPassFormTimelineItemId'] = this.byPassFormTimelineItemId;
    data['userCreatedFormName'] = this.userCreatedFormName;
    data['userCreatedFormId'] = this.userCreatedFormId;
    data['refineryName'] = this.refineryName;
    data['refineryId'] = this.refineryId;
    data['unitName'] = this.unitName;
    data['unitId'] = this.unitId;
    data['sectionName'] = this.sectionName;
    data['sectionId'] = this.sectionId;
    data['safetySystemTypeName'] = this.safetySystemTypeName;
    data['safetySystemTypeId'] = this.safetySystemTypeId;
    data['safetySystemSubTypeName'] = this.safetySystemSubTypeName;
    data['safetySystemSubTypeId'] = this.safetySystemSubTypeId;
    data['tripParameterTagNo'] = this.tripParameterTagNo;
    data['boundEquipmentTypeName'] = this.boundEquipmentTypeName;
    data['boundEquipmentName'] = this.boundEquipmentName;
    data['boundEquipmentId'] = this.boundEquipmentId;
    data['measurementToolName'] = this.measurementToolName;
    data['measurementToolId'] = this.measurementToolId;
    data['alarmSet'] = this.alarmSet;
    data['tripSet'] = this.tripSet;
    data['safetySystemExplanation'] = this.safetySystemExplanation;
    data['mosByPassSwitchTagNo'] = this.mosByPassSwitchTagNo;
    data['posByPassSwitchTagNo'] = this.posByPassSwitchTagNo;
    data['voting'] = this.voting;
    data['silLevel'] = this.silLevel;
    data['function'] = this.function;
    data['potentialDangerAndOutcome'] = this.potentialDangerAndOutcome;
    data['parametersToBeFollowed'] = this.parametersToBeFollowed;
    data['actionPlan'] = this.actionPlan;
    data['byPassStartDate'] = this.byPassStartDate;
    data['biifNo'] = this.biifNo;
    data['estimatedByPassTime'] = this.estimatedByPassTime;
    data['byPassCause'] = this.byPassCause;
    data['explanationsOpinions'] = this.explanationsOpinions;
    data['verballyInformedPeopleNames'] = this.verballyInformedPeopleNames;
    data['verballyInformedPeopleIds'] = this.verballyInformedPeopleIds;
    data['peopleDoByPassNames'] = this.peopleDoByPassNames;
    data['peopleDoByPassIds'] = this.peopleDoByPassIds;
    data['unitsToBeEffectedInUrgentSituationsNames'] =
        this.unitsToBeEffectedInUrgentSituationsNames;
    data['unitsToBeEffectedInUrgentSituationsIds'] =
        this.unitsToBeEffectedInUrgentSituationsIds;
    data['byPassFormStatus'] = this.byPassFormStatus;
    data['byPassFormCreatedDate'] = this.byPassFormCreatedDate;
    data['byPassCompletedDate'] = this.byPassCompletedDate;
    data['byPassSystemCompletedDate'] = this.byPassSystemCompletedDate;
    // data['peopleCompletedByPassIds'] = this.peopleCompletedByPassIds;
    // data['peopleCompletedByPassNames'] = this.peopleCompletedByPassNames;
    data['byPassFormTimePassed'] = this.byPassFormTimePassed;
    // data['filesNames'] = this.filesNames;
    if (this.tripParameterTagNoObject != null) {
      data['tripParameterTagNoObject'] =
          this.tripParameterTagNoObject?.toJson();
    }
    data['order'] = this.order;
    data['onCallChiefName'] = this.onCallChiefName;
    data['onCallResponsibleName'] = this.onCallResponsibleName;

    return data;
  }
}

class TripParameterTagNoObject {
  int? id;
  int? tagTypeId;
  String? value;
  int? refineryId;
  String? refineryName;
  int? unitId;
  String? unitName;
  int? sectionId;
  String? sectionName;
  int? boundEquipmentId;
  String? boundEquipmentName;
  int? measurementToolId;
  String? measurementToolName;
  String? alarmSet;
  String? tripSet;
  String? safetySystemExplanation;
  String? tripParameterTagNo;
  String? mosByPassSwitchTagNo;
  String? posByPassSwitchTagNo;
  String? voting;
  int? silLevel;
  String? function;
  String? potentialDangerAndOutcome;
  String? parametersToBeFollowed;
  String? actionPlan;
  List<int>? unitsToBeEffectedInUrgentSituationsIds;

  TripParameterTagNoObject(
      {this.id,
      this.tagTypeId,
      this.value,
      this.refineryId,
      this.refineryName,
      this.unitId,
      this.unitName,
      this.sectionId,
      this.sectionName,
      this.boundEquipmentId,
      this.boundEquipmentName,
      this.measurementToolId,
      this.measurementToolName,
      this.alarmSet,
      this.tripSet,
      this.safetySystemExplanation,
      this.tripParameterTagNo,
      this.mosByPassSwitchTagNo,
      this.posByPassSwitchTagNo,
      this.voting,
      this.silLevel,
      this.function,
      this.potentialDangerAndOutcome,
      this.parametersToBeFollowed,
      this.actionPlan,
      this.unitsToBeEffectedInUrgentSituationsIds});

  TripParameterTagNoObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagTypeId = json['tagTypeId'];
    value = json['value'];
    refineryId = json['refineryId'];
    refineryName = json['refineryName'];
    unitId = json['unitId'];
    unitName = json['unitName'];
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
    boundEquipmentId = json['boundEquipmentId'];
    boundEquipmentName = json['boundEquipmentName'];
    measurementToolId = json['measurementToolId'];
    measurementToolName = json['measurementToolName'];
    alarmSet = json['alarmSet'];
    tripSet = json['tripSet'];
    safetySystemExplanation = json['safetySystemExplanation'];
    tripParameterTagNo = json['tripParameterTagNo'];
    mosByPassSwitchTagNo = json['mosByPassSwitchTagNo'];
    posByPassSwitchTagNo = json['posByPassSwitchTagNo'];
    voting = json['voting'];
    silLevel = json['silLevel'];
    function = json['function'];
    potentialDangerAndOutcome = json['potentialDangerAndOutcome'];
    parametersToBeFollowed = json['parametersToBeFollowed'];
    actionPlan = json['actionPlan'];
    //unitsToBeEffectedInUrgentSituationsIds = json['unitsToBeEffectedInUrgentSituationsIds'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tagTypeId'] = this.tagTypeId;
    data['value'] = this.value;
    data['refineryId'] = this.refineryId;
    data['refineryName'] = this.refineryName;
    data['unitId'] = this.unitId;
    data['unitName'] = this.unitName;
    data['sectionId'] = this.sectionId;
    data['sectionName'] = this.sectionName;
    data['boundEquipmentId'] = this.boundEquipmentId;
    data['boundEquipmentName'] = this.boundEquipmentName;
    data['measurementToolId'] = this.measurementToolId;
    data['measurementToolName'] = this.measurementToolName;
    data['alarmSet'] = this.alarmSet;
    data['tripSet'] = this.tripSet;
    data['safetySystemExplanation'] = this.safetySystemExplanation;
    data['tripParameterTagNo'] = this.tripParameterTagNo;
    data['mosByPassSwitchTagNo'] = this.mosByPassSwitchTagNo;
    data['posByPassSwitchTagNo'] = this.posByPassSwitchTagNo;
    data['voting'] = this.voting;
    data['silLevel'] = this.silLevel;
    data['function'] = this.function;
    data['potentialDangerAndOutcome'] = this.potentialDangerAndOutcome;
    data['parametersToBeFollowed'] = this.parametersToBeFollowed;
    data['actionPlan'] = this.actionPlan;
    data['unitsToBeEffectedInUrgentSituationsIds'] =
        this.unitsToBeEffectedInUrgentSituationsIds;
    return data;
  }
}
