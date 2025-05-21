import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/static/static.dart';
import '../../bloc/sign_up/check_box/check_box_cubit.dart';

class AcceptTermsWidget extends StatelessWidget {
  const AcceptTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<CheckBoxCubit, bool>(
          builder: (context, isCheck) {
            return Checkbox(
              value: isCheck,
              onChanged: (value) {
                if (value != null) {
                  context.read<CheckBoxCubit>().changedCheckBoxState(value);
                }
              },
              activeColor: AppColors.blue,
            );
          },
        ),
        const SizedBox(width: 2),
        Expanded(
          child: Text(
            "I_agree-to_the_terms_and_conditions".tr(),
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
