import 'package:aqar_zone_flutter_app/features/auth/presentation/bloc/sign_up/sign_up/sign_up_bloc.dart';
import 'package:aqar_zone_flutter_app/features/auth/presentation/widgets/sign_up/password_text_form_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/snackbar_message.dart';
import '../../../data/models/sign_up_request_model.dart';
import '../../bloc/sign_up/check_box/check_box_cubit.dart';
import 'accept_terms_widget.dart';
import 'button_sign_up_widget.dart';
import 'drop_down_menu_widget.dart';
import 'rich_text_widget.dart';
import 'text_form_field_widget.dart';

class FormSignUpWidget extends StatelessWidget {
  FormSignUpWidget({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildImage(),
          _buildTextDescription(),
          TextFormFieldWidget(
            text: 'enter_user_name',
            keyboard: TextInputType.text,
            textEditingController: userName,
          ),
          TextFormFieldWidget(
            text: 'enter_email',
            keyboard: TextInputType.emailAddress,
            textEditingController: email,
          ),
          Row(
            children: [
              DropDownMenuWidget(),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormFieldWidget(
                  text: 'phone_hint'.tr(),
                  keyboard: TextInputType.phone,
                  textEditingController: phone,
                ),
              ),
            ],
          ),
          PasswordTextFormFieldWidget(
            textEditingController: password,
          ),
          PasswordTextFormFieldWidget(
            textEditingController: confirmPassword,
          ),
          RichTextWidget(
            text1: "By_clicking_'Ok',_you_agree_to_our",
            text2: "Terms",
            text3: "and",
            text4: "Privacy_Policy",
            text5: "to_Aqar_Zone",
          ),
          AcceptTermsWidget(),
          ButtonSignUpWidget(
            onPress: () => _validateForm(context),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      "assets/images/AqarZoneBlue1.png",
      width: 500,
      fit: BoxFit.contain,
    );
  }

  Widget _buildTextDescription() {
    return Text(
      'create_an_account_using_mobile_number'.tr(),
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void _validateForm(BuildContext context) {
    if (password.text != confirmPassword.text) {
      SnackBarMessage().showErrorSnackBar(
          message: "Passwords_do_not_match", context: context);
      return;
    }
    if (!context.read<CheckBoxCubit>().state) {
      SnackBarMessage().showErrorSnackBar(
          message: "Please_accept_the_terms", context: context);
      return;
    }

    if (_formKey.currentState!.validate()) {
      final request = SignUpRequestModel(
        name: userName.text,
        email: email.text,
        phone: phone.text,
        password: password.text,
        confirmPassword: confirmPassword.text,
      );
      context.read<SignUpBloc>().add(SubmitSignUpEvent(request: request));
    } else {
      SnackBarMessage().showErrorSnackBar(
          message: "Please_fill_all_fields_correctly", context: context);
      return;
    }
  }
}
