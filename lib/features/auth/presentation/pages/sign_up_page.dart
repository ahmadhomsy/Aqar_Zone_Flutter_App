import 'package:aqar_zone_flutter_app/core/static/static.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/sign_up/check_box/check_box_cubit.dart';
import '../bloc/sign_up/drop_down_menu/drop_down_menu_cubit.dart';
import '../bloc/sign_up/obscure/obscure_cubit.dart';
import '../bloc/sign_up/sign_up/sign_up_bloc.dart';
import '../widgets/sign_up/form_sign_up_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<CheckBoxCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<ObscureCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<DropDownMenuCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<SignUpBloc>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('create_an_account'.tr()),
      centerTitle: true,
      backgroundColor: AppColors.blue,
      foregroundColor: AppColors.white,
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: FormSignUpWidget(),
      ),
    );
  }
}
