import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<Response> login({required String email, required String password}) async {
    return await dio.post('/login', data: {'email': email, 'password': password});
  }

  Future<Response> register({
    required String username,
    required String email,
    required String password,
  }) async {
    return await dio.post(
      '/register',
      data: {"name": username, "email": email, "password": password},
    );
  }

  Future<Response> googleLogin({
    required String email,
    required String name,
    required String provider,
    required String providerId,
    String? avatar,
  }) {
    return dio.post(
      '/auth/social',
      data: {
        'email': email,
        'name': name,
        'provider': provider,
        'provider_id': providerId,
        'avatar': avatar,
      },
    );
  }

  Future<Response> session() {
    return dio.get('/session');
  }
}
