import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';

class AppButton extends StatelessWidget {
  final Color? color;
  final double? raduis;
  final Widget child;
  final VoidCallback? onTap;
  final double? width, height;
  const AppButton({super.key, this.color, this.raduis, required this.child, this.onTap, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? ColorTheme.primary,
          borderRadius: .circular(raduis ?? 10),
        ),
        child: child,
      ),
    );
  }
}