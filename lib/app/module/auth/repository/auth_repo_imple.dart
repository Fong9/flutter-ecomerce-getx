import 'package:flutter_application_1/app/module/auth/api/api_endpoint_service.dart';
import 'package:flutter_application_1/app/module/auth/models/auth_model.dart';
import 'package:flutter_application_1/app/module/auth/models/user_model.dart';
import 'package:flutter_application_1/app/module/auth/repository/auth_repo.dart';

class AuthRepoImple extends AuthRepo {
  final ApiService _apiService;

  AuthRepoImple({required ApiService apiService}) : _apiService = apiService;

  @override
  Future<AuthModel> login({required String email, required String password}) async {
    final res = await _apiService.login(email: email, password: password);

    return AuthModel.fromJson(res.data);
  }

  @override
  Future<AuthModel> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final res = await _apiService.register(username: username, email: email, password: password);

    return AuthModel.fromJson(res.data);
  }

  @override
  Future<AuthModel> oAuthLogin({
    required String email,
    required String name,
    required String provider,
    required String providerId,
    String? avatar,
  }) async {
    final res = await _apiService.googleLogin(
      email: email,
      name: name,
      provider: provider,
      providerId: providerId,
      avatar: avatar,
    );

    return AuthModel.fromJson(res.data);
  }

  @override
  Future<UserModel> session() async{
    final res = await _apiService.session();

    return UserModel.fromJson(res.data['user']);
  }
}
