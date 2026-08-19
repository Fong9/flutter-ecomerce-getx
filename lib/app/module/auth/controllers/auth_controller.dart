import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/auth/services/facebook_auth_service.dart';
import 'package:flutter_application_1/app/core/auth/services/google_auth_service.dart';
import 'package:flutter_application_1/app/core/storage/token_storage.dart';
import 'package:flutter_application_1/app/module/auth/data/models/user_model.dart';
import 'package:flutter_application_1/app/module/auth/data/repository/auth_repo.dart';
import 'package:flutter_application_1/app/routes/route.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo _authRepo;
  final TokenStorage _tokenStorage;
  final GoogleAuthService _googleAuthService;
  final FacebookAuthService _facebookAuthService;

  AuthController({
    required AuthRepo authRepo,
    required TokenStorage tokenStorage,
    required GoogleAuthService googleAuthService,
    required FacebookAuthService facebookAuthService,
  }) : _authRepo = authRepo,
       _tokenStorage = tokenStorage,
       _googleAuthService = googleAuthService,
       _facebookAuthService = facebookAuthService;

  final RxBool isLoading = false.obs;
  final RxBool isGoogleLoading = false.obs;
  final RxBool isLogOut = false.obs;
  final RxBool isFacebookLoading = false.obs;

  // Get info in google sing in
  final userName = RxnString();
  final userEmail = RxnString();
  final userPhoto = RxnString();
  final currentUser = Rxn<UserModel>();

  // Live textfield errors
  final RxnString emailError = RxnString();
  final RxnString usernameError = RxnString();
  final RxnString passwordError = RxnString();

  void validateEmail(String controller) {
    if (controller.trim().isEmpty) {
      emailError.value = "Email is required";
    } else if (!GetUtils.isEmail(controller.trim())) {
      emailError.value = "Plase enter a valid email";
    } else {
      emailError.value = null;
    }
  }

  void validateUsername(String controller) {
    if (controller.trim().isEmpty) {
      usernameError.value = "Username is required";
    } else if (controller.length < 3) {
      usernameError.value = "Username must be at least 3 characters.";
    } else {
      usernameError.value = null;
    }
  }

  void validatePassword(String controller) {
    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');

    if (controller.trim().isEmpty) {
      passwordError.value = "Password is required";
    } else if (!passwordRegex.hasMatch(controller)) {
      passwordError.value =
          "Password must contains 6+ characters with uppercase, lowercase, and number.";
    } else {
      passwordError.value = null;
    }
  }

  bool validateLogin({required String email, required String password}) {
    validateEmail(email);
    validatePassword(password);

    return emailError.value == null && passwordError.value == null;
  }

  bool validateRegister({
    required String username,
    required String email,
    required String password,
  }) {
    validateUsername(username);
    validateEmail(email);
    validatePassword(password);

    return emailError.value == null && passwordError.value == null && usernameError.value == null;
  }

  Future<void> loadSession() async {
    final user = await _authRepo.session();

    userName.value = user.name;
    userEmail.value = user.email;
    userPhoto.value = user.avatar;
  }

  Future<void> login({required String email, required String password}) async {
    if (!validateLogin(email: email, password: password)) {
      return;
    }

    try {
      isLoading.value = true;

      final res = await _authRepo.login(email: email, password: password);

      // After await the requirement from repository
      // We will save token here after creating LoginResponse
      await _tokenStorage.saveToken(res.token!);

      Get.snackbar('Success', res.message);

      Get.offAllNamed(Routes.navbar);
    } on DioException catch (e) {
      _handleApiError(e);
    } catch (e) {
      Get.snackbar(
        "Login Failed",
        e.toString(),
        backgroundColor: Colors.red.withValues(alpha: 0.3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logOut() async {
    try {
      isLogOut.value = true;

      await _tokenStorage.deleteToken();

      Get.offAllNamed(Routes.login);
      Get.snackbar('Logout', "Logout successful");
    } catch (e) {
      Get.snackbar("Logout Failed", e.toString());
    } finally {
      isLogOut.value = false;
    }
  }

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    if (!validateRegister(username: username, email: email, password: password)) {
      return;
    }

    try {
      isLoading.value = true;

      await _authRepo.register(username: username, email: email, password: password);

      Get.snackbar("Success", "Register successful");

      Get.offAllNamed(Routes.navbar);
    } on DioException catch (e) {
      _handleApiError(e);
    } catch (e) {
      Get.snackbar(
        "Login Failed",
        e.toString(),
        backgroundColor: Colors.red.withValues(alpha: 0.3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void _handleApiError(DioException e) {
    final data = e.response?.data;

    if (data is! Map<String, dynamic>) {
      Get.snackbar(
        "Error",
        "Something went wrong.",
        backgroundColor: Colors.red.withValues(alpha: 0.3),
      );
      return;
    }

    final errors = data['errors'];

    if (errors is Map) {
      final apiEmailErrors = errors['email'];
      final apiUsernameErrors = errors['name'];
      final apiPasswordErrors = errors['password'];

      if (apiEmailErrors is List && apiEmailErrors.isNotEmpty) {
        emailError.value = apiEmailErrors.first.toString();
      }

      if (apiUsernameErrors is List && apiUsernameErrors.isNotEmpty) {
        usernameError.value = apiUsernameErrors.first.toString();
      }

      if (apiPasswordErrors is List && apiPasswordErrors.isNotEmpty) {
        passwordError.value = apiPasswordErrors.first.toString();
      }

      return;
    }

    final message = data['message']?.toString() ?? "Something went wrong.";

    Get.snackbar("Request Failed", message, backgroundColor: Colors.red.withValues(alpha: 0.3));
  }

  Future<void> googleSignIn() async {
    try {
      isGoogleLoading.value = true;

      final credential = await _googleAuthService.signInWithGoogle();
      final user = credential?.user;

      if (user == null || user.email == null) {
        Get.snackbar("Google Login", "Login failed");
        return;
      }

      final res = await _authRepo.oAuthLogin(
        email: user.email!,
        name: user.displayName ?? "",
        provider: "google",
        providerId: user.uid,
        avatar: user.photoURL!,
      );

      await _tokenStorage.saveToken(res.token!);

      userName.value = res.user?.name;
      userEmail.value = res.user?.email;
      userPhoto.value = res.user?.avatar;

      Get.snackbar("Success", "Welcome ${res.user?.name ?? user.displayName}");

      Get.offAllNamed(Routes.navbar);
    } on FirebaseException catch (e) {
      Get.snackbar("Google Login", e.message ?? "Authentication failed");
    } catch (e) {
      if (e.toString().contains('canceled')) {
        Get.snackbar("Google Login", "Canceled");
      } else {
        Get.snackbar("Google Login", e.toString());
      }
    } finally {
      isGoogleLoading.value = false;
    }
  }

  Future<void> facebookSignIn() async {
    try {
      isFacebookLoading.value = true;

      final data = await _facebookAuthService.signIn();

      if (data == null) {
        Get.snackbar("Facebook", "Login cancelled or failed");
        return;
      }

      final res = await _authRepo.oAuthLogin(
        email: data['email'] ?? data.isEmpty,
        name: data['name'],
        provider: "facebook",
        providerId: data['id'],
        avatar: data['picture']['data']['url'],
      );

      await _tokenStorage.saveToken(res.token!);

      userName.value = res.user?.name;
      userEmail.value = res.user?.email;
      userPhoto.value = res.user?.avatar;

      Get.offAllNamed(Routes.navbar);
    } catch (e) {
      Get.snackbar("Facebook Login", e.toString());
    } finally {
      isFacebookLoading.value = false;
    }
  }
}
