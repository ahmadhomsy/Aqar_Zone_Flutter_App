import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/static/route_app.dart';

class RichTextWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  RichTextWidget(
      {required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.text5});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: " ${text1.tr()} ",
        style: const TextStyle(color: Colors.black, fontSize: 16),
        children: [
          TextSpan(
            text: " ${text2.tr()} ",
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.signInPage);
              },
          ),
          TextSpan(
            text: text3.tr(),
          ),
          TextSpan(
            text: " ${text4.tr()} ",
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.signInPage);
              },
          ),
          TextSpan(text: text5.tr(), style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
