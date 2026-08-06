import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final _storage = FlutterSecureStorage();
  static const String _tokenKey = 'token';

  Future<void> saveToken(String token) async {
    return await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<void> saveOnBoarding() async {
    await _storage.write(key: 'onboarding', value: 'true');
  }

  Future<bool> firstLogged() async {
    final value = await _storage.read(key: 'onboarding');

    return value == null;
  }
}
