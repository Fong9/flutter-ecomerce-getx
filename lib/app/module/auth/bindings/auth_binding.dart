import 'package:flutter_application_1/app/core/auth/services/facebook_auth_service.dart';
import 'package:flutter_application_1/app/core/auth/services/google_auth_service.dart';
import 'package:flutter_application_1/app/core/storage/token_storage.dart';
import 'package:flutter_application_1/app/module/auth/data/api/api_endpoint_service.dart';
import 'package:flutter_application_1/app/module/auth/controllers/auth_controller.dart';
import 'package:flutter_application_1/app/module/auth/data/repository/auth_repo.dart';
import 'package:flutter_application_1/app/module/auth/data/repository/auth_repo_imple.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Google
    Get.put<GoogleAuthService>(GoogleAuthService(), permanent: true);

    // Facebook
    Get.put<FacebookAuthService>(FacebookAuthService(), permanent: true);

    // Repository
    Get.put<AuthRepo>(AuthRepoImple(apiService: Get.find<ApiService>()), permanent: true);

    // Controller
    Get.put<AuthController>(
      AuthController(
        authRepo: Get.find<AuthRepo>(),
        tokenStorage: Get.find<TokenStorage>(),
        googleAuthService: Get.find<GoogleAuthService>(),
        facebookAuthService: Get.find<FacebookAuthService>(),
      ),
      permanent: true,
    );
  }
}
