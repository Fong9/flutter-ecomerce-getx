import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/bindings/init_binding.dart';
import 'package:flutter_application_1/app/routes/app_route.dart';
import 'package:flutter_application_1/app/routes/route.dart';
import 'package:get/route_manager.dart';

class AppInit extends StatelessWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: AppRoute.page,
    );
  }
}