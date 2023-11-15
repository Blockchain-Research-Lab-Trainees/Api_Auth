import 'dart:convert';

Token tokenFromMap(String str) => Token.fromMap(json.decode(str));

String tokenToMap(Token data) => json.encode(data.toMap());

class Token {
  String message;
  String accessToken;
  String refreshToken;

  Token({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Token.fromMap(Map<String, dynamic> json) => Token(
    message: json["message"],
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}
