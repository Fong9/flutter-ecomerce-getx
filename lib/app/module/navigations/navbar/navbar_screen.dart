import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/home_screen.dart';
import 'package:flutter_application_1/app/module/navigations/delivery-tracking/delivery_screen.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/order/order_screen.dart';
import 'package:flutter_application_1/app/module/navigations/profile/profile_screen.dart';
import 'package:flutter_application_1/app/module/navigations/navbar/navbar_controller.dart';
import 'package:get/get.dart';

class NavbarScreen extends StatelessWidget {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavbarController>();

    return Scaffold(
      body: Obx(
        () => screens[controller.currentIndex.value],
      ),

      bottomNavigationBar: Obx(
        () => Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _navIcon(
                icon: Icons.home,
                index: 0,
                controller: controller,
              ),

              _navIcon(
                icon: Icons.compass_calibration,
                index: 1,
                controller: controller,
              ),

              _navIcon(
                icon: Icons.receipt,
                index: 2,
                controller: controller,
              ),

              _navIcon(
                icon: Icons.person,
                index: 3,
                controller: controller,
              ),
            ],
          ).paddingSymmetric(horizontal: 36, vertical: 16),
        ),
      ),
    );
  }

  Widget _navIcon({
    required IconData icon,
    required int index,
    required NavbarController controller,
  }) {
    return GestureDetector(
      onTap: () {
        controller.onChange(index);
      },
      child: Icon(
        icon,
        color: controller.currentIndex.value == index
            ? ColorTheme.primary
            : ColorTheme.neutral400,
      ),
    );
  }
}

List<Widget> screens = [
  HomeScreen(),
  DeliveryScreen(),
  OrderScreen(),
  ProfileScreen(),
];