import 'package:flutter_application_1/app/module/auth/models/auth_model.dart';
import 'package:flutter_application_1/app/module/auth/models/user_model.dart';

abstract class AuthRepo {
  Future<AuthModel> login({
    required String email,
    required String password
  });

  Future<AuthModel> register({
    required String username,
    required String email,
    required String password
  });

  Future<AuthModel> oAuthLogin({
    required String email,
    required String name,
    required String provider,
    required String providerId,
    required String avatar,
  });

  Future<UserModel> session();
}