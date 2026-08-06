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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final controller = Get.find<AuthController>();

  bool isHide = true;

  @override
  void dispose() {
    username;
    email;
    password;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipOval(child: Image.asset(Images.mypic, width: 200,)),
            SizedBox(height: 20),
            Column(
              children: [
                Column(
                  spacing: 8,
                  children: [
                    Text("Hello! Create Account", style: Font.interLarge(weight: .bold, size: 24)),
                    Row(
                      mainAxisAlignment: .center,
                      spacing: 5,
                      children: [
                        Text("Already have an account?", style: Font.interSmall()),
                        GestureDetector(
                          onTap: () {
                            Get.offAllNamed(Routes.login);
                          },
                          child: Text(
                            "Sign in",
                            style: Font.interSmall(color: ColorTheme.primary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            
                SizedBox(height: 16),
                Column(
                  spacing: 12,
                  children: [
                    Obx(
                      () => Column(
                        crossAxisAlignment: .start,
                        spacing: 5,
                        children: [
                          AppTextField(
                            controller: username,
                            onChanged: controller.validateUsername,
                            hintText: 'Username',
                          ),
                          
                          if(controller.usernameError.value != null)
                            Text(controller.usernameError.value!, style: Font.inter(color: Colors.red),)
                          ],
                      ),
                    ),
                    Obx(
                      () => Column(
                        crossAxisAlignment: .start,
                        spacing: 5,
                        children: [
                          AppTextField(
                            controller: email,
                            onChanged: controller.validateEmail,
                            hintText: 'Email',
                            suffixIcon: Icon(Icons.verified_user_rounded, color: ColorTheme.neutral400),
                          ),
                          if(controller.emailError.value != null)
                            Text(controller.emailError.value!, style: Font.inter(color: Colors.red),)
                        ],
                      ),
                    ),
                    Obx(
                      () => Column(
                        crossAxisAlignment: .start,
                        spacing: 5,
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
                                  
                          if(controller.passwordError.value != null)
                            Text(controller.passwordError.value!, style: Font.inter(color: Colors.red),)
                        ],
                      ),
                    ),
                    Obx(
                      () => AppButton(
                        onTap: () {
                          controller.register(username: username.text, email: email.text, password: password.text);
                        },
                        height: 50,
                        raduis: 16,
                        child: Center(
                          child: controller.isLoading.value 
                          ? SizedBox(height: 25, width: 25, child: CircularProgressIndicator(strokeWidth: 2,))
                          : Text(
                              'Sign up',
                              style: Font.interMedium(color: Colors.white, weight: .w600),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
            
                SizedBox(height: 12),
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
        
            SizedBox(height: 12),
        
            AppButton(
              height: 50,
              raduis: 16,
              color: ColorTheme.neutral200,
              child: Row(
                children: [
                  SizedBox(width: 12),
                  SvgPicture.asset(IconsTheme.facebook, width: 32),
                  Expanded(
                    child: Center(
                      child: Text("Connect with Facebook", style: Font.interMedium(weight: .w500)),
                    ),
                  ),
                ],
              ),
            ),
        
            SizedBox(height: 12),
        
            AppButton(
              height: 50,
              raduis: 16,
              color: ColorTheme.neutral200,
              child: Row(
                children: [
                  SizedBox(width: 12),
                  SvgPicture.asset(IconsTheme.google, width: 32),
                  Expanded(
                    child: Center(
                      child: Text("Connect with Google", style: Font.interMedium(weight: .w500)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).paddingOnly(left: 24, right: 24, top: 102),
      ),
    );
  }
}
