import 'package:aqar_zone_flutter_app/core/static/static.dart';
import 'package:aqar_zone_flutter_app/features/auth/presentation/widgets/sign_in/form_sign_in_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart';
import '../bloc/sign_in/sign_in_bloc.dart';
import '../bloc/sign_up/drop_down_menu/drop_down_menu_cubit.dart';
import '../bloc/sign_up/obscure/obscure_cubit.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<ObscureCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<DropDownMenuCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<SignInBloc>(),
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
      title: Text('sign_in_account'.tr()),
      centerTitle: true,
      backgroundColor: AppColors.blue,
      foregroundColor: AppColors.white,
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: FormSignInWidget(),
      ),
    );
  }
}
