import 'package:aqar_zone_flutter_app/core/static/static.dart';
import 'package:aqar_zone_flutter_app/features/auth/presentation/bloc/onboarding/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, int>(
      builder: (context, currentPage) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(onBoardingList.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentPage == index ? 24.w : 10.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: currentPage == index ? AppColors.blue : AppColors.gold,
                borderRadius: BorderRadius.circular(8),
              ),
            );
          }),
        );
      },
    );
  }
}
