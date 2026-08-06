import 'package:flutter_application_1/app/module/auth/models/user_model.dart';

class AuthModel {
  final String? token;
  final String message;
  final UserModel? user;

  AuthModel({
    required this.token,
    required this.message,
    this.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'] as String?,
      message: json['message'],
      user: json['user'] != null 
          ? UserModel.fromJson(json['user'])
          : null
    );
  }
}