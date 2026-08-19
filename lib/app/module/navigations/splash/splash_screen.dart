import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/themes/image.dart';
import 'package:flutter_application_1/app/module/navigations/splash/splash_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            SvgPicture.asset(Images.logo, width: 200,),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}