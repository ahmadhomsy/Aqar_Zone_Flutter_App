import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/static/static.dart';
import '../../bloc/sign_up/drop_down_menu/drop_down_menu_cubit.dart';

class DropDownMenuWidget extends StatelessWidget {
  const DropDownMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropDownMenuCubit, String>(
      builder: (context, selectCode) {
        return Container(
          width: 100,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: selectCode,
            underline: const SizedBox(),
            isExpanded: true,
            items: countriesList.map(
              (country) {
                return DropdownMenuItem<String>(
                  value: country['code'],
                  child: Text('${country['name']} (${country['code']})'),
                );
              },
            ).toList(),
            onChanged: (value) {
              if (value != null) {
                context.read<DropDownMenuCubit>().selectCountryCode(value);
              }
            },
          ),
        );
      },
    );
  }
}
