import 'package:aqar_zone_flutter_app/features/auth/presentation/bloc/onboarding/on_boarding_cubit.dart';
import 'package:aqar_zone_flutter_app/features/auth/presentation/widgets/on_boarding/dot_widget.dart';
import 'package:aqar_zone_flutter_app/features/auth/presentation/widgets/on_boarding/page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/static/static.dart';
import '../../../../injection_container.dart';
import '../widgets/on_boarding/button_on_boarding_widget.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();

    return BlocProvider(
      create: (_) => sl<OnBoardingCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _buildBody(_pageController),
      ),
    );
  }

  Widget _buildBody(PageController _pageController) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PageViewWidget(
              controller: _pageController,
            ),
            DotWidget(),
            SizedBox(
              height: 180.h,
            ),
            ButtonOnBoardingWidget(
              controller: _pageController,
            ),
          ],
        ),
      ),
    );
  }
}
