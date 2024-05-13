import 'package:flutter/material.dart';
import 'package:tickets_app/common/colors.dart';
import 'package:tickets_app/common/typography.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key, required this.textController, required this.hintText, required this.callback});

  final TextEditingController textController;
  final String hintText;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: callback,
      controller: textController,
      cursorWidth: 1.0,
      cursorColor: BasicColors.white,
      decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(0, 11, 0, 11),
          hintText: hintText,
          hintStyle: AppTypography(BasicColors.grey6).butonText1),
      style: AppTypography(BasicColors.white).butonText1,
    );
  }
}