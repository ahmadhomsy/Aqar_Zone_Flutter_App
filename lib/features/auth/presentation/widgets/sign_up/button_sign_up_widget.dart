import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/static/static.dart';
import '../../../../../core/widgets/snackbar_message.dart';
import '../../../../real_estate/presentation/pages/home_page.dart';
import '../../bloc/sign_up/sign_up/sign_up_bloc.dart';

class ButtonSignUpWidget extends StatelessWidget {
  final void Function() onPress;

  const ButtonSignUpWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SuccessSignUpState) {
          SnackBarMessage()
              .showSuccessSnackBar(message: "successfully", context: context);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const HomePage()),
              (route) => false);
        } else if (state is ErrorSignUpState) {
          SnackBarMessage()
              .showErrorSnackBar(message: state.message, context: context);
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: state is LoadingSignUpState ? null : onPress,
            style: ElevatedButton.styleFrom(
              backgroundColor: state is LoadingSignUpState
                  ? AppColors.gray.withOpacity(0.6)
                  : AppColors.blue,
            ),
            child: state is LoadingSignUpState
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text("register_account".tr()),
          ),
        );
      },
    );
  }
}
