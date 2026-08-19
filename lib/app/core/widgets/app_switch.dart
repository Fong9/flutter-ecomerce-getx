import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';

class AppSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AppSwitch({super.key, required this.value, required this.onChanged});

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 30,
        height: 15,
        decoration: BoxDecoration(
          color: widget.value ? ColorTheme.primary : ColorTheme.neutral400,
          borderRadius: BorderRadius.circular(15),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          alignment: widget.value
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: const Icon(Icons.circle, color: Colors.white, size: 14),
        ),
      ),
    );
  }
}
