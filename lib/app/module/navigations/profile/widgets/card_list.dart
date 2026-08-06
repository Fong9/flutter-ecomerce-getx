import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/core/themes/font.dart';
import 'package:flutter_application_1/app/core/widgets/app_button.dart';
import 'package:get/get.dart';

class CardList extends StatelessWidget {
  final String cardNumber;
  final bool isDefault;
  final VoidCallback? onTap;
  final Color? color;
  final String label;

  const CardList({
    super.key,
    required this.cardNumber,
    this.isDefault = false,
    this.onTap,
    this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: onTap,
      height: 75,
      color: ColorTheme.neutral100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color ?? ColorTheme.primary.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.card_membership,
                  size: 20,
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardNumber,
                    style: Font.interMedium(
                      weight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    label,
                    style: Font.interSmall(
                      color: ColorTheme.neutral500,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Icon(
            Icons.arrow_forward_ios_outlined,
            color: ColorTheme.neutral400,
            size: 20,
          ),
        ],
      ).paddingAll(12),
    );
  }
}