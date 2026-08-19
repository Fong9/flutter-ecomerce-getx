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
                                    child: Image.network(
                                      authController.userPhoto.value!,
                                    ),
                                  ),
                                ),
                        ),
                      ),

                      const SizedBox(height: 12),
                      Obx(
                        () => Text(
                          authController.userName.value ?? "Guest",
                          style: Font.h5(),
                        ),
                      ),

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
                onTap: () => _showAccountInformation(context, authController),
              ),

              _divider(),

              _item(
                Icons.key,
                "Password",
                "Change your Password",
                onTap: () => Get.to(() => const _PasswordPage()),
              ),

              _divider(),

              _item(
                Icons.credit_card,
                "Payment Methods",
                "Add your Credit & Debit cards",
                onTap: () => Get.to(() => const _PaymentMethodsPage()),
              ),

              _divider(),
              _item(
                Icons.location_on,
                "Delivery Locations",
                "Change your Delivery Locations",
              ),

              _divider(),

              _item(
                Icons.email,
                "Invite your friends",
                "Get \$59 for each invitation!",
              ),
            ]),

            const SizedBox(height: 24),

            Obx(
              () => _section("Notifications", [
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
            ),

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

              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                clipBehavior: Clip.antiAlias,
                child: Obx(
                  () => ListTile(
                    onTap: authController.logOut,

                    leading: Icon(Icons.logout, color: ColorTheme.neutral400),

                    title: Text("Log Out", style: Font.interMedium()),

                    trailing: controller.isLoading.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(),
                          )
                        : Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: ColorTheme.neutral400,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ).paddingOnly(),
      ),
    );
  }

  Future<void> _showAccountInformation(
    BuildContext context,
    AuthController authController,
  ) async {
    final result = await Get.to<List<String>>(
      () => _AccountInformationPage(
        initialName: authController.userName.value ?? '',
        initialEmail: authController.userEmail.value ?? '',
      ),
    );

    if (result != null && context.mounted) {
      authController.userName.value = result[0];
      authController.userEmail.value = result[1];
    }
  }

  Widget _section(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 5,
            spreadRadius: 0.5,
          ),
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

  Widget _item(
    IconData icon,
    String title,
    String subtitle, {
    VoidCallback? onTap,
  }) {
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

                  Text(
                    subtitle,
                    style: Font.interSmall(color: ColorTheme.neutral500),
                  ),
                ],
              ),
            ),

            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: ColorTheme.neutral400,
            ),
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

                Text(
                  subtitle,
                  style: Font.interSmall(color: ColorTheme.neutral500),
                ),
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

class _AccountInformationPage extends StatefulWidget {
  final String initialName;
  final String initialEmail;

  const _AccountInformationPage({
    required this.initialName,
    required this.initialEmail,
  });

  @override
  State<_AccountInformationPage> createState() =>
      _AccountInformationPageState();
}

class _AccountInformationPageState extends State<_AccountInformationPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _emailController = TextEditingController(text: widget.initialEmail);
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.neutral50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Account information', style: Font.h5()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _field('Full Name', 'Full Name', _nameController),
          const SizedBox(height: 18),
          _field(
            'Email Address',
            'Email',
            _emailController,
            TextInputType.emailAddress,
          ),
          const SizedBox(height: 18),
          _field(
            'Phone Number',
            'Phone Number',
            _phoneController,
            TextInputType.phone,
          ),
          const SizedBox(height: 32),
          AppButton(
            height: 50,
            raduis: 16,
            onTap: () => Navigator.of(
              context,
            ).pop([_nameController.text.trim(), _emailController.text.trim()]),
            child: Center(
              child: Text(
                'Save changes',
                style: Font.interMedium(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _field(
    String label,
    String hint,
    TextEditingController controller, [
    TextInputType keyboardType = TextInputType.text,
  ]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Font.interSmall(color: ColorTheme.neutral400)),
        const SizedBox(height: 10),
        AppTextField(
          controller: controller,
          hintText: hint,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}

class _PasswordPage extends StatefulWidget {
  const _PasswordPage();

  @override
  State<_PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<_PasswordPage> {
  final _current = TextEditingController();
  final _newPassword = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _current.dispose();
    _newPassword.dispose();
    _confirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.neutral50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Change Password', style: Font.h5()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _field('Current Password', 'Password', _current),
          const SizedBox(height: 18),
          _field('New Password', 'New Password', _newPassword),
          const SizedBox(height: 18),
          _field('Confirm Password', 'Confirm Password', _confirm),
          const SizedBox(height: 32),
          AppButton(
            height: 50,
            raduis: 16,
            onTap: () => Get.back(),
            child: Center(
              child: Text(
                'Change settings',
                style: Font.interMedium(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _field(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Font.interSmall(color: ColorTheme.neutral400)),
        const SizedBox(height: 10),
        AppTextField(
          controller: controller,
          hintText: hint,
          obscureText: true,
          suffixIcon: const Icon(Icons.visibility),
        ),
      ],
    );
  }
}

class _PaymentMethodsPage extends StatelessWidget {
  const _PaymentMethodsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.neutral50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Payment Methods', style: Font.h5()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CardList(
            cardNumber: 'Visa',
            label: 'Add a card to pay faster',
            color: ColorTheme.purple500.withValues(alpha: 0.3),
            onTap: () => Get.to(() => const _AddCardPage()),
          ),
          const SizedBox(height: 16),
          CardList(
            cardNumber: 'MasterCard',
            label: 'Secure card payments',
            color: ColorTheme.blue500.withValues(alpha: 0.3),
            onTap: () => Get.to(() => const _AddCardPage()),
          ),
          const SizedBox(height: 28),
          Center(
            child: Text(
              "Don't have any card yet?",
              style: Font.interMedium(color: ColorTheme.neutral500),
            ),
          ),
          const SizedBox(height: 16),
          AppButton(
            height: 50,
            raduis: 16,
            onTap: () => Get.to(() => const _AddCardPage()),
            child: Center(
              child: Text(
                'Add Card',
                style: Font.interMedium(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddCardPage extends StatelessWidget {
  const _AddCardPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.neutral50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Add Card', style: Font.h5()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AppTextField(hintText: 'Cardholder name'),
          const SizedBox(height: 16),
          AppTextField(
            hintText: 'Card number',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Expanded(child: AppTextField(hintText: 'MM / YY')),
              const SizedBox(width: 12),
              const Expanded(
                child: AppTextField(
                  hintText: 'CVV',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          AppButton(
            height: 50,
            raduis: 16,
            onTap: () => Get.back(),
            child: Center(
              child: Text(
                'Save card',
                style: Font.interMedium(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
