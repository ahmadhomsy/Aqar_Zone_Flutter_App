import 'package:flutter/material.dart';

import '../static/static.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 30,
          width: MediaQuery.of(context).size.width / 15,
          child: CircularProgressIndicator(
            color: AppColors.blue,
          ),
        ),
      ),
    );
  }
}
