import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';

class OtpBox extends StatelessWidget {
  const OtpBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: List.generate(
        4,
        (index) => SizedBox(
          width: 60,
          height: 70,
          child: TextField(
            textAlign: .center,
            keyboardType: .number,
            maxLength: 1,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: ColorTheme.neutral200,
              border: OutlineInputBorder(
                borderRadius: .circular(10),
                borderSide: BorderSide(width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: .circular(10),
                borderSide: BorderSide(color: ColorTheme.primary, width: 2),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < 3) {
                FocusScope.of(context).nextFocus();
              }

              if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
            },
          ),
        ),
      ),
    );
  }
}
