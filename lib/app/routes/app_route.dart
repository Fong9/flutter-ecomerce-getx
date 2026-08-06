import 'package:flutter_application_1/app/module/auth/bindings/auth_binding.dart';
import 'package:flutter_application_1/app/module/auth/forgot-password/forgot_password_screen.dart';
import 'package:flutter_application_1/app/module/auth/login/login_screen.dart';
import 'package:flutter_application_1/app/module/auth/otp/otp_screen.dart';
import 'package:flutter_application_1/app/module/auth/register/register_screen.dart';
import 'package:flutter_application_1/app/module/choose-location/choose_location.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/best-partner/subway_detail_screen.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/best-partner/subway_order.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/best-partner/subway_screen.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/category/burger_screen.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/category/pizza_screen.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/category/sandwich_screen.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/home_screen.dart';
import 'package:flutter_application_1/app/module/navigations/delivery-tracking/delivery_screen.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/order/order_screen.dart';
import 'package:flutter_application_1/app/module/navigations/profile/profile_screen.dart';
import 'package:flutter_application_1/app/module/navigations/navbar/navbar_binding.dart';
import 'package:flutter_application_1/app/module/navigations/navbar/navbar_screen.dart';
import 'package:flutter_application_1/app/module/navigations/on-boarding/onboarding_binding.dart';
import 'package:flutter_application_1/app/module/navigations/on-boarding/onboarding_screen.dart';
import 'package:flutter_application_1/app/module/navigations/splash/splash_binding.dart';
import 'package:flutter_application_1/app/module/navigations/splash/splash_screen.dart';
import 'package:flutter_application_1/app/routes/route.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class AppRoute {
  static final page = [
    GetPage(
      name: Routes.splash, 
      page: () => SplashScreen(),
      binding: BindingsBuilder(() {
        AuthBinding().dependencies();
        SplashBinding().dependencies();
      })
    ),
    GetPage(
      name: Routes.onboarding, 
      page: () => OnboardingScreen(),
      binding: OnboardingBinding()
    ),
    GetPage(
      name: Routes.login, 
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.register, 
      page: () => RegisterScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.otp, 
      page: () => OtpScreen(),
    ),
    GetPage(
      name: Routes.forgotPassword, 
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: Routes.chooseLocation, 
      page: () => ChooseLocation(),
    ),
    GetPage(
      name: Routes.home, 
      page: () => HomeScreen(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: Routes.navbar, 
      page: () => NavbarScreen(),
      binding: BindingsBuilder(() {
        AuthBinding().dependencies();
        NavbarBinding().dependencies();
      }),
    ),
    GetPage(
      name: Routes.sandwich, 
      page: () => SandwichScreen(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: Routes.pizza, 
      page: () => PizzaScreen(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: Routes.burger, 
      page: () => BurgerScreen(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: Routes.subway, 
      page: () => SubwayScreen(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: Routes.subwayDetail, 
      page: () => SubwayDetailScreen(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: Routes.subwayOrder, 
      page: () => SubwayOrder(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: Routes.deliveryScreen, 
      page: () => DeliveryScreen(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: Routes.order, 
      page: () => OrderScreen(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: Routes.profile, 
      page: () => ProfileScreen(),
      binding: NavbarBinding(),
    ),
  ];
}