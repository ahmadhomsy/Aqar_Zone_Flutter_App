import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/static/static.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController textEditingController;
  final TextInputType keyboard;
  const TextFormFieldWidget(
      {super.key,
      required this.textEditingController,
      required this.text,
      required this.keyboard});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: keyboard,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        letterSpacing: 1,
      ),
      decoration: InputDecoration(
        hintText: text.tr(),
        hintStyle: TextStyle(color: AppColors.gray),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'empty_field_error'.tr();
        }
        return null;
      },
    );
  }
}
