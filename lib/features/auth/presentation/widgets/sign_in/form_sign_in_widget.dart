import 'package:aqar_zone_flutter_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:aqar_zone_flutter_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:aqar_zone_flutter_app/features/auth/presentation/widgets/sign_up/password_text_form_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/static/route_app.dart';
import '../../../../../core/static/static.dart';
import '../../../../../core/widgets/snackbar_message.dart';
import '../../bloc/sign_in/sign_in_bloc.dart';
import '../sign_up/button_sign_up_widget.dart';
import '../sign_up/drop_down_menu_widget.dart';
import '../sign_up/text_form_field_widget.dart';
import 'button_sign_in_widget.dart';

class FormSignInWidget extends StatelessWidget {
  FormSignInWidget({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildImage(),
          _buildTextDescription(),
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
          ButtonSignInWidget(
            onPress: () => _validateForm(context),
          ),
          _buildTextToSignUpPage(context),
          _buildTextToHomePage(context),
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
      'login_to_aqar_zone'.tr(),
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTextToSignUpPage(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SignUpPage(),
        ));
      },
      child: Text(
        'create_an_account_using_mobile'.tr(),
        style: TextStyle(
          color: AppColors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _buildTextToHomePage(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
      },
      icon: Icon(Icons.arrow_back),
      label: Text('skip_and_continue_as_guest'.tr()),
    );
  }

  void _validateForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final request = SignInRequestModel(
        phone: phone.text,
        password: password.text,
      );
      context.read<SignInBloc>().add(SubmitSignInEvent(request: request));
    } else {
      SnackBarMessage().showErrorSnackBar(
          message: "Please_fill_all_fields_correctly", context: context);
      return;
    }
  }
}
