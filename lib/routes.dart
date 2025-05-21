import 'package:aqar_zone_flutter_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'core/static/route_app.dart';
import 'features/auth/presentation/pages/onboarding_page.dart';
import 'features/auth/presentation/pages/sign_up_page.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'features/real_estate/presentation/pages/home_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.splashPage: (context) => const SplashPage(),
  AppRoutes.signInPage: (context) => const SignInPage(),
  AppRoutes.signUpPage: (context) => const SignUpPage(),
  AppRoutes.onBoardingPage: (context) => OnBoardingPage(),
  AppRoutes.homePage: (context) => const HomePage(),
};
