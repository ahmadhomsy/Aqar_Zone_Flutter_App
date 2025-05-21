import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/static/static.dart';
import '../../bloc/sign_up/obscure/obscure_cubit.dart';

class PasswordTextFormFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;

  const PasswordTextFormFieldWidget(
      {super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObscureCubit, bool>(
      builder: (context, obscure) {
        return TextFormField(
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            letterSpacing: 1,
          ),
          obscureText: obscure,
          controller: textEditingController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'password_required'.tr();
            } else if (value.length <= 3) {
              return 'password_too_short'.tr();
            }
            return null;
          },
          decoration: InputDecoration(
            hintStyle: TextStyle(color: AppColors.gray),
            hintText: 'enter_the_password'.tr(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                context.read<ObscureCubit>().toggleObscure();
              },
              icon: Icon(obscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined),
            ),
          ),
        );
      },
    );
  }
}
