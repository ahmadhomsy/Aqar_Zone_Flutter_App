import 'package:aqar_zone_flutter_app/core/static/static.dart';
import 'package:aqar_zone_flutter_app/features/auth/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/onboarding/on_boarding_cubit.dart';

class PageViewWidget extends StatelessWidget {
  final PageController controller;

  PageViewWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: PageView.builder(
        controller: controller,
        onPageChanged: (index) {
          context.read<OnBoardingCubit>().changePage(index);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (_, index) {
          final data = onBoardingList[index];
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(data["image"]!, height: 250.h),
                SizedBox(height: 40.h),
                Text(
                  data["title"]!,
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Text(
                  data["desc"]!,
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
