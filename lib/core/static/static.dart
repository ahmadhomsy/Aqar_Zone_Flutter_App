import 'package:flutter/material.dart';

class AppColors {
  static const Color blue = Color(0xFF1E3A8A);
  static const Color gray = Color(0xFFE5E7EB);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gold = Color(0xFFF59E0B);
  static const Color black = Color(0xFF000000);
  static const Color green = Color(0xFF10B981);
  static const Color red = Color(0xFFEF4444);
}

const String cachedUserKey = 'CACHED_USER';
const String cachedTokenKey = 'CACHED_TOKEN';
const String isFirstOpenKey = 'CACHED_IS_FIRST_OPEN';
const List<Map<String, String>> onBoardingList = [
  {
    "image": "assets/images/AqarZoneBlue1.png",
    "title": "مرحبا بك في عقار زون",
    "desc": "اكتشف العقارات بسهولة ويسر في منطقتك",
  },
  {
    "image": "assets/images/AqarZoneBlue1.png",
    "title": "سهولة البحث",
    "desc": "ابحث باستخدام الفلاتر الذكية حسب رغبتك",
  },
  {
    "image": "assets/images/AqarZoneBlue1.png",
    "title": "تواصل مباشر",
    "desc": "تواصل مع المالك مباشرة دون وسيط",
  },
];
const List<Map<String, String>> countriesList = [
  {'name': 'سوريا', 'code': '+963'},
  {'name': 'السعودية', 'code': '+966'},
  {'name': 'مصر', 'code': '+20'},
  {'name': 'الإمارات', 'code': '+971'},
  {'name': 'قطر', 'code': '+974'},
];
