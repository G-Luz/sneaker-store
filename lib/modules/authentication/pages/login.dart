import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/modules/authentication/controller/login/login_controller.dart';
import 'package:dale_poc/widgets/app_button.dart';
import 'package:dale_poc/widgets/app_social_auth.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:dale_poc/widgets/app_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = Modular.get<LoginController>();
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Material(
      color: AppColors.darkWhite2,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: kIsWeb
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(
                horizontal: 20,
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppText(
              text: 'Faça login na Plataforma',
              fontSize: kIsWeb ? 60 : 30,
              fontColor: AppColors.green,
              textAlign: TextAlign.center,
            ),
            const AppSocialAuth(),
            AppText(
              text: 'Ou utilize sua conta com E-mail',
              fontColor: Colors.grey.withOpacity(.7),
            ),
            SizedBox(height: deviceSize.height * .05),
            AppTextfield(
              hint: 'E-mail',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: Colors.grey,
              ),
              onChangedCallback: (value) => controller.onEmailChanged(value),
            ),
            const SizedBox(height: 20),
            AppTextfield(
              hint: 'Senha',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Colors.grey,
              ),
              onChangedCallback: (value) => controller.onPasswordChanged(value),
            ),
            SizedBox(height: deviceSize.height * .02),
            AppText(
              text: 'Esqueceu sua senha?',
              fontColor: Colors.grey.withOpacity(.7),
              fontSize: 18,
              textDecoration: TextDecoration.underline,
              decorationThickness: .5,
            ),
            SizedBox(height: deviceSize.height * .04),
            AppButton(
              text: 'Entrar',
              width: kIsWeb ? deviceSize.width * .15 : deviceSize.width * .9,
              height:
                  kIsWeb ? deviceSize.height * .06 : deviceSize.height * .07,
              backgroudColor: AppColors.green,
              onPressedCallback: () => controller.onSubmittedForm(),
            )
          ],
        ),
      ),
    );
  }
}
