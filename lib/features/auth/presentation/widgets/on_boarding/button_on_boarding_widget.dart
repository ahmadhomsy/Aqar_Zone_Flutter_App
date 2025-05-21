import 'package:aqar_zone_flutter_app/features/auth/presentation/bloc/onboarding/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/static/route_app.dart';
import '../../../../../core/static/static.dart';

class ButtonOnBoardingWidget extends StatelessWidget {
  final PageController controller;

  const ButtonOnBoardingWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildElevatedButton(context),
        SizedBox(
          width: 100.w,
        ),
        _buildTextButton(context),
      ],
    );
  }

  Widget _buildTextButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await context.read<OnBoardingCubit>().finishPage();
        Navigator.of(context).pushReplacementNamed(AppRoutes.signUpPage);
      },
      child: const Text(
        "تخطي",
        style: TextStyle(fontSize: 16, color: AppColors.gold),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, int>(
      builder: (context, currentPage) {
        return ElevatedButton(
          onPressed: () async {
            if (currentPage < onBoardingList.length - 1) {
              final indexPage = currentPage + 1;
              controller.animateToPage(
                indexPage,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              context.read<OnBoardingCubit>().changePage(indexPage);
            } else {
              await context.read<OnBoardingCubit>().finishPage();
              Navigator.of(context).pushReplacementNamed(AppRoutes.signUpPage);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            currentPage == onBoardingList.length - 1 ? "ابدأ الآن" : "التالي",
            style: const TextStyle(fontSize: 16, color: AppColors.gold),
          ),
        );
      },
    );
  }
}
