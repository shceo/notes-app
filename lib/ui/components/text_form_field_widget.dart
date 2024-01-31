import 'package:flutter/material.dart';
import 'package:notes_app/ui/theme/app_colors.dart';
import 'package:notes_app/ui/theme/app_style.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.textEditingController,
  });

  final String labelText, hintText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: AppColors.textGrey,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: AppColors.textGrey,
          ),
        ),
        labelText: labelText,
        labelStyle: AppStyle.fontStyle.copyWith(
          fontSize: 12,
          color: AppColors.textGrey,
        ),
        hintText: hintText,
        hintStyle: AppStyle.fontStyle.copyWith(
          fontSize: 12,
          color: AppColors.textGrey,
        ),
      ),
    );
  }
}
