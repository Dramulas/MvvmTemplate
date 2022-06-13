class SignInResponseMoc {
  String? accessToken;
  String? encryptedAccessToken;
  int? expireInSeconds;
  int? userId;

  SignInResponseMoc(
      {this.accessToken,
      this.encryptedAccessToken,
      this.expireInSeconds,
      this.userId});

  SignInResponseMoc.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    encryptedAccessToken = json['encryptedAccessToken'];
    expireInSeconds = json['expireInSeconds'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccessToken'] = this.accessToken;
    data['EncryptedAccessToken'] = this.encryptedAccessToken;
    data['ExpireInSeconds'] = this.expireInSeconds;
    data['UserId'] = this.userId;
    return data;
  }
}
