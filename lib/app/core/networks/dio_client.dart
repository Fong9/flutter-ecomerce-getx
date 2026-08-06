import 'package:dio/dio.dart';
import 'package:flutter_application_1/app/core/storage/token_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  late Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: dotenv.env['BASE_URL'] ?? '',
          headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
        ),
      ) {
    dio.interceptors.add(
      PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:(options, handler) async {
          final token = await Get.find<TokenStorage>().getToken();

          if(token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
      )
    );
  }
}
