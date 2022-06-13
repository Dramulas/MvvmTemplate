import 'abstract/ITourModel.dart';
import 'finding_model.dart';
import 'user_dd_model.dart';

class TourModel extends ITourModel {
  int? fieldOrganizationOrderScore;
  int? id;
  String? tourAccompaniers;
  String? observatedSecureCasesPositiveFindings;
  bool? isPlanned;
  bool? isApproved;
  DateTime? tourDate;
  int? fieldId;
  int? locationId;
  String? fieldName;
  String? locationName;
  String? tourTeamMembers;
  List<int>? tourTeamMembersIds;
  List<FindingModel>? findings = <FindingModel>[];
  List<UserDDModel>? tourTeamMemberUsers;

  TourModel(
      {this.id,
      this.fieldOrganizationOrderScore,
      this.tourAccompaniers,
      this.observatedSecureCasesPositiveFindings,
      this.isPlanned,
      this.isApproved,
      this.tourDate,
      this.fieldId,
      this.locationId,
      this.fieldName,
      this.locationName,
      this.tourTeamMembers,
      this.tourTeamMembersIds,
      this.findings,
      this.tourTeamMemberUsers});

  TourModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fieldOrganizationOrderScore = json['fieldOrganizationOrderScore'];
    tourAccompaniers = json['tourAccompaniers'];
    observatedSecureCasesPositiveFindings =
        json['observatedSecureCases_PositiveFindings'];
    isPlanned = json['isPlanned'];
    isApproved = json['isApproved'];
    tourDate = DateTime.parse(json['tourDate']);
    fieldId = json['fieldId'];
    locationId = json['locationId'];
    fieldName = json['fieldName'];
    locationName = json['locationName'];
    tourTeamMembers = json['tourTeamMembers'];
    tourTeamMembersIds = json['tourTeamMembersIds'].cast<int>();
    if (json['findings'] != null) {
      findings = <FindingModel>[];
      json['findings'].forEach((v) {
        findings!.add(new FindingModel.fromJson(v));
      });
    }
    if (json["tourTeamMemberUsers"] != null) {
      tourTeamMemberUsers = <UserDDModel>[];
      json['tourTeamMemberUsers'].forEach((v) {
        tourTeamMemberUsers!.add(new UserDDModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fieldOrganizationOrderScore'] = this.fieldOrganizationOrderScore;
    data['tourAccompaniers'] = this.tourAccompaniers;
    data['observatedSecureCases_PositiveFindings'] =
        this.observatedSecureCasesPositiveFindings;
    data['isPlanned'] = this.isPlanned;
    data['isApproved'] = this.isApproved;
    data['tourDate'] = this.tourDate.toString();
    data['fieldId'] = this.fieldId;
    data['locationId'] = this.locationId;
    data['fieldName'] = this.fieldName;
    data['locationName'] = this.locationName;
    data['tourTeamMembers'] = this.tourTeamMembers;
    data['tourTeamMembersIds'] = this.tourTeamMembersIds;
    if (this.findings != null) {
      data['findings'] = this.findings!.map((v) => v.toJson()).toList();
    }
    if (this.tourTeamMemberUsers != null) {
      data['tourTeamMemberUsers'] =
          this.tourTeamMemberUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
