import 'dart:convert';

TokenLogin tokenLoginFromMap(String str) => TokenLogin.fromMap(json.decode(str));

String tokenLoginToMap(TokenLogin data) => json.encode(data.toMap());

class TokenLogin {
  String accessToken;
  String refreshToken;

  TokenLogin({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenLogin.fromMap(Map<String, dynamic> json) => TokenLogin(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toMap() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}
