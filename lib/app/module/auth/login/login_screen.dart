import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/widgets/app_button.dart';
import 'package:flutter_application_1/app/core/widgets/app_text_field.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/core/themes/font.dart';
import 'package:flutter_application_1/app/core/themes/icon.dart';
import 'package:flutter_application_1/app/core/themes/image.dart';
import 'package:flutter_application_1/app/module/auth/controllers/auth_controller.dart';
import 'package:flutter_application_1/app/routes/route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  bool isHide = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(Images.logo,),
            SizedBox(height: 20),
            Column(
              children: [
                Column(
                  spacing: 8,
                  children: [
                    Text("Welcome Back", style: Font.interLarge(weight: .bold, size: 24)),
                    Text("Hello, sign in to continue!", style: Font.interSmall()),
                  ],
                ),
                Row(
                  mainAxisAlignment: .center,
                  spacing: 5,
                  children: [
                    Text("Or", style: Font.interSmall()),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.register);
                      },
                      child: Text(
                        "Create new account",
                        style: Font.interSmall(color: ColorTheme.primary),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),
                Column(
                  spacing: 10,
                  children: [
                    Obx(
                      () => Column(
                        crossAxisAlignment: .start,
                        spacing: 10,
                        children: [
                          AppTextField(
                            controller: email,
                            onChanged: controller.validateEmail,
                            hintText: 'Email',
                            suffixIcon: Icon(
                              Icons.verified_user_rounded,
                              color: ColorTheme.neutral400,
                            ),
                          ),

                          if (controller.emailError.value != null)
                            Text(
                              controller.emailError.value!,
                              style: Font.inter(color: Colors.red),
                            ),
                        ],
                      ),
                    ),

                    Obx(
                      () => Column(
                        crossAxisAlignment: .start,
                        spacing: 10,
                        children: [
                          AppTextField(
                            controller: password,
                            onChanged: controller.validatePassword,
                            hintText: 'Password',
                            obscureText: isHide ? true : false,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isHide = !isHide;
                                });
                              },
                              icon: Icon(
                                isHide ? Icons.visibility_off_outlined : Icons.visibility,
                                color: ColorTheme.neutral400,
                              ),
                            ),
                          ),

                          if (controller.passwordError.value != null)
                            Text(
                              controller.passwordError.value!,
                              style: Font.inter(color: Colors.red),
                            ),
                        ],
                      ),
                    ),
                    Obx(
                      () => AppButton(
                        onTap: controller.isLoading.value
                            ? null
                            : () {
                                controller.login(email: email.text, password: password.text);
                              },
                        height: 50,
                        raduis: 16,
                        child: Center(
                          child: controller.isLoading.value
                              ? SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : Text(
                                  'Sign in',
                                  style: Font.interMedium(color: Colors.white, weight: .w600),
                                ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.forgotPassword);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: Font.interSmall(color: ColorTheme.primary, weight: .w600),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),
              ],
            ),
            Row(
              children: [
                const Expanded(child: Divider(thickness: 1)),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text('OR', style: Font.interSmall(color: ColorTheme.neutral500)),
                ),

                const Expanded(child: Divider(thickness: 1)),
              ],
            ),

            SizedBox(height: 16),

            Obx(
              () => AppButton(
                onTap: controller.isFacebookLoading.value
                    ? null
                    : () {
                        controller.facebookSignIn();
                      },
                height: 50,
                raduis: 16,
                color: ColorTheme.neutral200,
                child: Row(
                  children: [
                    SizedBox(width: 12),
                    SvgPicture.asset(IconsTheme.facebook, width: 32),
                    Expanded(
                      child: Center(
                        child: controller.isFacebookLoading.value
                            ? SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(strokeWidth: 3),
                              )
                            : Text("Connect with Facbook", style: Font.interMedium(weight: .w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            Obx(
              () => AppButton(
                onTap: controller.isGoogleLoading.value
                    ? null
                    : () {
                        controller.googleSignIn();
                      },
                height: 50,
                raduis: 16,
                color: ColorTheme.neutral200,
                child: Row(
                  children: [
                    SizedBox(width: 12),
                    SvgPicture.asset(IconsTheme.google, width: 32),
                    Expanded(
                      child: Center(
                        child: controller.isGoogleLoading.value
                            ? SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(strokeWidth: 3),
                              )
                            : Text("Connect with Google", style: Font.interMedium(weight: .w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ).paddingOnly(left: 24, right: 24, top: 102),
      ),
    );
  }
}
