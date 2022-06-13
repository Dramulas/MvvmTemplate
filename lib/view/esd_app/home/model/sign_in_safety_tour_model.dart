class SignInModel {
  String? userNameOrEmailAddress;
  bool? rememberClient;

  SignInModel({this.userNameOrEmailAddress, this.rememberClient});

  SignInModel.fromJson(Map<String, dynamic> json) {
    userNameOrEmailAddress = json['userNameOrEmailAddress'];
    rememberClient = json['rememberClient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userNameOrEmailAddress'] = this.userNameOrEmailAddress;
    data['rememberClient'] = this.rememberClient;
    return data;
  }
}
