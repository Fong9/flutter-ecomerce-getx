import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/core/themes/font.dart';
import 'package:flutter_application_1/app/core/widgets/app_button.dart';
import 'package:flutter_application_1/app/core/widgets/app_switch.dart';
import 'package:flutter_application_1/app/core/widgets/app_text_field.dart';
import 'package:flutter_application_1/app/module/auth/controllers/auth_controller.dart';
import 'package:flutter_application_1/app/module/navigations/profile/profile_controller.dart';
import 'package:flutter_application_1/app/module/navigations/profile/widgets/card_list.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 220,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text("Profile", style: Font.h4()),
              actions: [
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.notifications),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 500),
                        tween: Tween(begin: 0, end: 1),
                        builder: (context, value, child) {
                          return Transform.scale(scale: value, child: child);
                        },

                        child: CircleAvatar(
                          radius: 35,

                          backgroundColor: ColorTheme.primary,

                          child: authController.userPhoto.value == null
                              ? const Icon(Icons.person, size: 36)
                              : Obx(
                                  () => ClipOval(
                                    child: Image.network(authController.userPhoto.value!),
                                  ),
                                ),
                        ),
                      ),

                      const SizedBox(height: 12),
                      Obx(() => Text(authController.userName.value ?? "Guest", style: Font.h5())),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },

        body: ListView(
          padding: const EdgeInsets.only(top: 24, bottom: 24),
          children: [
            _section("General", [
              _item(
                Icons.person,
                "Account information",
                "Change your Account information",
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (index) {
                      return Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.95,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: .circular(25),
                          ),
                          child: Column(
                            spacing: 24,
                            children: [
                              SizedBox(
                                width: 30,
                                child: Divider(thickness: 3, radius: .circular(10)),
                              ),
                              Text("Account information", style: Font.h5()),
                              Divider(color: ColorTheme.neutral200),
                              Column(
                                crossAxisAlignment: .start,
                                spacing: 10,
                                children: [
                                  Text(
                                    "Full Name",
                                    style: Font.interSmall(color: ColorTheme.neutral400),
                                  ),
                                  AppTextField(hintText: "Full Name"),
                                ],
                              ),
                              const Divider(),
                              Column(
                                crossAxisAlignment: .start,
                                spacing: 10,
                                children: [
                                  Text(
                                    "Email Address",
                                    style: Font.interSmall(color: ColorTheme.neutral400),
                                  ),
                                  AppTextField(hintText: "Email"),
                                ],
                              ),
                              const Divider(),
                              Column(
                                crossAxisAlignment: .start,
                                spacing: 10,
                                children: [
                                  Text(
                                    "Phone Number",
                                    style: Font.interSmall(color: ColorTheme.neutral400),
                                  ),
                                  AppTextField(hintText: "Phone Number"),
                                ],
                              ),

                              Spacer(),

                              AppButton(
                                height: 50,
                                raduis: 16,
                                child: Center(
                                  child: Text(
                                    "Change settings",
                                    style: Font.interMedium(color: Colors.white),
                                  ),
                                ),
                              ).paddingOnly(bottom: 24),
                            ],
                          ).paddingAll(16),
                        ),
                      );
                    },
                  );
                },
              ),

              _divider(),

              _item(
                Icons.key,
                "Password",
                "Change your Password",
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (index) {
                      return Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.95,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: .circular(25),
                          ),
                          child: Column(
                            spacing: 24,
                            children: [
                              SizedBox(
                                width: 30,
                                child: Divider(thickness: 3, radius: .circular(10)),
                              ),
                              Text("Change Password", style: Font.h5()),
                              Divider(color: ColorTheme.neutral200),
                              Column(
                                crossAxisAlignment: .start,
                                spacing: 10,
                                children: [
                                  Text(
                                    "Password",
                                    style: Font.interSmall(color: ColorTheme.neutral400),
                                  ),
                                  AppTextField(
                                    hintText: "Password",
                                    obscureText: true,
                                    suffixIcon: Icon(Icons.visibility),
                                  ),
                                ],
                              ),
                              const Divider(),
                              Column(
                                crossAxisAlignment: .start,
                                spacing: 10,
                                children: [
                                  Text(
                                    "New Password",
                                    style: Font.interSmall(color: ColorTheme.neutral400),
                                  ),
                                  AppTextField(
                                    hintText: "New Password",
                                    obscureText: true,
                                    suffixIcon: Icon(Icons.visibility),
                                  ),
                                ],
                              ),
                              const Divider(),
                              Column(
                                crossAxisAlignment: .start,
                                spacing: 10,
                                children: [
                                  Text(
                                    "Confirm Password",
                                    style: Font.interSmall(color: ColorTheme.neutral400),
                                  ),
                                  AppTextField(
                                    hintText: "Confirm Password",
                                    obscureText: true,
                                    suffixIcon: Icon(Icons.visibility),
                                  ),
                                ],
                              ),

                              Spacer(),

                              AppButton(
                                height: 50,
                                raduis: 16,
                                child: Center(
                                  child: Text(
                                    "Change settings",
                                    style: Font.interMedium(color: Colors.white),
                                  ),
                                ),
                              ).paddingOnly(bottom: 24),
                            ],
                          ).paddingAll(16),
                        ),
                      );
                    },
                  );
                },
              ),

              _divider(),

              _item(
                Icons.credit_card,
                "Payment Methods",
                "Add your Credit & Debit cards",
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (index) {
                      return Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.95,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: .circular(25),
                          ),
                          child: Column(
                            spacing: 24,
                            children: [
                              SizedBox(
                                width: 30,
                                child: Divider(thickness: 3, radius: .circular(10)),
                              ),
                              Text("Payment Methods", style: Font.h5()),

                              const Divider(color: ColorTheme.neutral200),

                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: ColorTheme.primary.withValues(alpha: 0.1),
                                  borderRadius: .circular(10),
                                ),
                                child: Center(child: Icon(Icons.credit_card)),
                              ),

                              const SizedBox(height: 16),

                              Column(
                                children: [
                                  Text("Don't have any card", style: Font.h4()),
                                  Text(
                                    "It look like you don't have a credit card or debit card\nyet. Plase add your cards.",
                                    textAlign: .center,
                                  ),
                                ],
                              ),

                              AppButton(
                                onTap: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (index) {
                                      return StatefulBuilder(
                                        builder: (context, index) {
                                          return Expanded(
                                            child: Container(
                                              height: MediaQuery.of(context).size.height * 0.95,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: .circular(25),
                                              ),
                                              child: Column(
                                                spacing: 24,
                                                children: [
                                                  SizedBox(
                                                    width: 30,
                                                    child: Divider(
                                                      thickness: 3,
                                                      radius: .circular(10),
                                                    ),
                                                  ),
                                                  Text("Payment Methods", style: Font.h5()),

                                                  const Divider(color: ColorTheme.neutral200),

                                                  Column(
                                                    spacing: 16,
                                                    crossAxisAlignment: .start,
                                                    children: [
                                                      Text("Credit Cards", style: Font.h6()),

                                                      const Divider(color: ColorTheme.neutral200),

                                                      Column(
                                                        spacing: 16,
                                                        children: [
                                                          CardList(
                                                            cardNumber: "408614457708564e5",
                                                            label: "Default Payment",
                                                          ),
                                                          CardList(
                                                            cardNumber: "538614457708564e5",
                                                            label: "Not Default",
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),

                                                  AppButton(
                                                    onTap: () {
                                                      Get.back();
                                                      showModalBottomSheet(
                                                        context: context,
                                                        builder: (context) {
                                                          return Container(
                                                            height:
                                                                MediaQuery.of(context).size.height /
                                                                2,
                                                            decoration: BoxDecoration(
                                                              color: ColorTheme.neutral200,
                                                              borderRadius: .circular(25),
                                                            ),
                                                            child:
                                                                Column(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: 40,
                                                                      child: Divider(
                                                                        color:
                                                                            ColorTheme.neutral400,
                                                                        radius: .circular(10),
                                                                        thickness: 3,
                                                                      ),
                                                                    ),

                                                                    Column(
                                                                      spacing: 10,
                                                                      children: [
                                                                        CardList(
                                                                          cardNumber: "Visa",
                                                                          label:
                                                                              "Enter information on the card",
                                                                          color: ColorTheme
                                                                              .purple500
                                                                              .withValues(
                                                                                alpha: 0.3,
                                                                              ),
                                                                        ),
                                                                        CardList(
                                                                          cardNumber: "MasterCard",
                                                                          label:
                                                                              "Enter information on the card",
                                                                        ),
                                                                        CardList(
                                                                          cardNumber: "Paypal",
                                                                          label:
                                                                              "Enter email Paypal",
                                                                          color: ColorTheme.blue500
                                                                              .withValues(
                                                                                alpha: 0.3,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ).paddingOnly(top: 24),
                                                                  ],
                                                                ).paddingSymmetric(
                                                                  horizontal: 16,
                                                                  vertical: 16,
                                                                ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    height: 50,
                                                    raduis: 16,
                                                    child: Center(
                                                      child: Text(
                                                        "Add Cards",
                                                        style: Font.interMedium(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ).paddingOnly(bottom: 24),
                                                ],
                                              ).paddingAll(16),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                height: 50,
                                raduis: 16,
                                child: Center(
                                  child: Text(
                                    "Add Cards",
                                    style: Font.interMedium(color: Colors.white),
                                  ),
                                ),
                              ).paddingOnly(bottom: 24),
                            ],
                          ).paddingAll(16),
                        ),
                      );
                    },
                  );
                },
              ),

              _divider(),

              _item(Icons.location_on, "Delivery Locations", "Change your Delivery Locations"),

              _divider(),

              _item(Icons.email, "Invite your friends", "Get \$59 for each invitation!"),
            ]),

            const SizedBox(height: 24),

            _section("Notifications", [
              _switchItem(
                Icons.notifications,
                "Notifications",
                "You will receive daily updates",
                controller.notification.value,
                controller.toggleNotification,
              ),

              _divider(),

              _switchItem(
                Icons.notifications,
                "Promotional Notifications",
                "Get notified when promotions",
                controller.promotionNotification.value,
                controller.togglePromotion,
              ),
            ]),

            const SizedBox(height: 24),

            _section("More", [
              _item(Icons.star, "Rate Us", "Give us your feedback"),

              _divider(),

              _item(Icons.book, "Terms & Conditions", "Read our policies"),
            ]),

            const SizedBox(height: 24),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(12),
              ),

              child: Obx(
                () => ListTile(
                  onTap: () {
                    authController.logOut();
                  },

                  leading: Icon(Icons.logout, color: ColorTheme.neutral400),

                  title: Text("Log Out", style: Font.interMedium()),

                  trailing: controller.isLoading.value
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator())
                      : Icon(Icons.arrow_forward_ios, size: 18, color: ColorTheme.neutral400),
                ),
              ),
            ),
          ],
        ).paddingOnly(),
      ),
    );
  }

  Widget _section(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 5, spreadRadius: 0.5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.all(16),

            child: Text(title, style: Font.h6(size: 16)),
          ),

          Divider(color: ColorTheme.neutral100),

          ...children,
        ],
      ),
    );
  }

  Widget _item(IconData icon, String title, String subtitle, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),

        child: Row(
          spacing: 20,

          children: [
            Icon(icon, color: ColorTheme.neutral400),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(title, style: Font.interMedium(weight: .w500)),

                  Text(subtitle, style: Font.interSmall(color: ColorTheme.neutral500)),
                ],
              ),
            ),

            Icon(Icons.arrow_forward_ios, size: 18, color: ColorTheme.neutral400),
          ],
        ),
      ),
    );
  }

  Widget _switchItem(
    dynamic icon,
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),

      child: Row(
        spacing: 20,

        children: [
          Icon(icon, color: ColorTheme.neutral400),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(title),

                Text(subtitle, style: Font.interSmall(color: ColorTheme.neutral500)),
              ],
            ),
          ),

          AppSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(color: ColorTheme.neutral100, height: 1);
  }
}
