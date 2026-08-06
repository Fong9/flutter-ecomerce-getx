import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/widgets/app_button.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/core/themes/font.dart';
import 'package:flutter_application_1/app/core/themes/image.dart';
import 'package:flutter_application_1/app/module/auth/otp/widgets/otp_box.dart';
import 'package:flutter_application_1/app/routes/route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                  Text("Verify phone number", style: Font.interLarge(weight: .bold, size: 24)),
                  Text("We have just sent a code to +0123456789", style: Font.interSmall(color: ColorTheme.neutral500)),
                ],
              ),

              SizedBox(height: 24),
              Column(
                spacing: 16,
                children: [
                  OtpBox(),
                  AppButton(
                    onTap: () {
                      
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
                  AppButton(
                    onTap: () {
                      
                    },
                    height: 50,
                    raduis: 16,
                    color: ColorTheme.neutral200,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.otp),
                        child: Text(
                          'Send again',
                          style: Font.interMedium(weight: .w600),
                        ),
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      Text('By signing up you agree to', style: Font.interSmall(color: ColorTheme.neutral500),),
                      Text('our term of service and privacy policy', style: Font.interSmall(color: ColorTheme.primary),)
                    ],
                  )
                ],
              ),

              SizedBox(height: 24),
            ],
          ),
        ],
      ).paddingOnly(left: 24, right: 24, top: 102),
    );
  }
}
