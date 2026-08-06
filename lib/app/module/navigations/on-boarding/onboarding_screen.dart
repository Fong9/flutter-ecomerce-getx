import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/widgets/app_button.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/core/themes/font.dart';
import 'package:flutter_application_1/app/module/navigations/on-boarding/onboarding_controller.dart';
import 'package:flutter_application_1/app/module/navigations/on-boarding/onboarding_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onChange,
              itemCount: onBoarding.length,
              itemBuilder: (context, index) {
                final board = onBoarding[index];
                return Column(
                  mainAxisAlignment: .center,
                  children: [
                    SvgPicture.asset(board['image']),
                    SizedBox(height: 50),
                    Column(
                      children: [
                        Text(board["heading"], style: Font.h4()),
                        SizedBox(height: 16),
                        Text(board["body"], textAlign: .center),
                      ],
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 46,
              left: 0,
              right: 0,
              child: Obx(
                () => Column(
                  spacing: 24,
                  children: [
                    Row(
                      spacing: 8,
                      mainAxisAlignment: .center,
                      children: List.generate(onBoarding.length, (index) {
                        final scroll = controller.currentIndex.value == index;
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          width: scroll ? 48 : 18,
                          height: 8,
                          decoration: BoxDecoration(
                            color: scroll ? ColorTheme.primary : ColorTheme.neutral300,
                            borderRadius: .circular(25),
                          ),
                        );
                      }),
                    ),
                    AppButton(
                      onTap: () async {
                        if (controller.currentIndex.value < onBoarding.length - 1) {
                          controller.pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          controller.finishOnboarding();
                        }
                      },
                      raduis: 12,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Text('Get started', style: Font.h6(size: 14, color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
