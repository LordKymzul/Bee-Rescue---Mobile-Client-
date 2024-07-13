import 'package:beerescue_mobile/shared/color/custom-color.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constant/size-constant.dart';
import '../../../../shared/style/mytext-style.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController inputController;
  final String inputHint;
  final IconData inputIcon;
  final VoidCallback onPressed;
  final bool isVisible;
  const PasswordInput(
      {super.key,
      required this.inputController,
      required this.inputHint,
      required this.inputIcon,
      required this.onPressed,
      required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return buildPasswordInput(context);
  }

  Widget buildPasswordInput(BuildContext context) {
    return TextField(
      controller: inputController,
      keyboardType: TextInputType.text,
      obscureText: isVisible,
      cursorColor: context.primaryColor,
      style: MyTextStyle.getTitleStyle(
          context, SizeConstant.fontSizeSm, context.onBackgroundColor),
      decoration: InputDecoration(
          hintText: inputHint,
          hintStyle: MyTextStyle.getSubTitleStyle(
              context, SizeConstant.fontSizeSm, context.onBackgroundColor),
          prefixIcon: Icon(
            inputIcon,
            color: context.primaryColor,
          ),
          suffixIcon: IconButton(
              onPressed: onPressed,
              icon: Icon(isVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined)),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: context.primaryColor, width: 2))),
    );
  }
}
