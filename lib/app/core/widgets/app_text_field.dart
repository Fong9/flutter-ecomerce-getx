import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/core/themes/font.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;

  const AppTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
    final _focusNode = FocusNode();
    bool _hasFocus = false;

    @override
    void initState() {
        super.initState();

        _focusNode.addListener(() {
            setState(() {
              _hasFocus = _focusNode.hasFocus;
            });
        });
    }

    @override
    void dispose() {
        _focusNode.dispose();
        super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      cursorColor: ColorTheme.primary,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hint: Text(widget.hintText, style: Font.interMedium(color: ColorTheme.neutral400),),
        filled: true,
        fillColor: ColorTheme.neutral200,

        prefixIcon: widget.prefixIcon,
        suffixIcon: _hasFocus ? widget.suffixIcon : null,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: ColorTheme.primary,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}