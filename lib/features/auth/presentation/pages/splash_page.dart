import 'package:aqar_zone_flutter_app/features/auth/presentation/bloc/splash/splash_bloc.dart';
import 'package:aqar_zone_flutter_app/features/auth/presentation/widgets/splash/lottie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/static/route_app.dart';
import '../../../../core/static/static.dart';
import '../../../../injection_container.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SplashBloc>()..add(GetStatusUserEvent()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) async {
        await Future.delayed(const Duration(seconds: 6));
        if (state is SignState) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
        } else if (state is NotSignState) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.signUpPage);
        } else if (state is FirstOpenState) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.onBoardingPage);
        }
      },
      child: LottieWidget(),
    );
  }
}
