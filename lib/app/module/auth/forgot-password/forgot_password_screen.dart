import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/widgets/app_button.dart';
import 'package:flutter_application_1/app/core/widgets/app_text_field.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/core/themes/font.dart';
import 'package:flutter_application_1/app/core/themes/image.dart';
import 'package:flutter_application_1/app/routes/route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset(Images.logo),
          SizedBox(height: 30),
          Column(
            children: [
              Column(
                spacing: 8,
                children: [
                  Text("Password Recovery", style: Font.interLarge(weight: .bold, size: 24)),
                  Text("Enter your email to recover your password", style: Font.interSmall(color: ColorTheme.neutral500)),
                ],
              ),

              SizedBox(height: 24),
              Column(
                spacing: 16,
                children: [
                  AppTextField(
                    hintText: 'Email',
                    suffixIcon: Icon(Icons.verified_user_rounded, color: ColorTheme.neutral400),
                  ),
                  AppButton(
                    onTap: () {
                      Get.toNamed(Routes.forgotPassword);
                    },
                    height: 50,
                    raduis: 16,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.otp),
                        child: Text(
                          'Next',
                          style: Font.interMedium(color: Colors.white, weight: .w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ],
      ).paddingOnly(left: 24, right: 24, top: 102),
    );
  }
}
