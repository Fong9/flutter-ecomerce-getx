import 'package:flutter_application_1/app/core/networks/dio_client.dart';
import 'package:flutter_application_1/app/core/storage/token_storage.dart';
import 'package:flutter_application_1/app/module/auth/api/api_endpoint_service.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {

    // Network
    Get.put<DioClient>(
      DioClient(),
      permanent: true,
    );

    Get.put<ApiService>(
      ApiService(
        dio: Get.find<DioClient>().dio,
      ),
      permanent: true,
    );
    
    Get.put<TokenStorage>(
      TokenStorage(),
      permanent: true,
    );
  }
}