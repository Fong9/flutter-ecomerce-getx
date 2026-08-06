import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';

class AppSwitch extends StatefulWidget {
  const AppSwitch({super.key, required bool value, required Function(bool) onChanged});

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  bool isToggle = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isToggle = !isToggle;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        width: 30,
        height: 15,
        decoration: BoxDecoration(
          color: isToggle ? ColorTheme.primary : ColorTheme.neutral400,
          borderRadius: .circular(15)
        ),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 250),
          alignment: isToggle ? .centerRight : .centerLeft,
          child: Icon(Icons.circle, color: Colors.white, size: 14,)),
      ),
    );
  }
}