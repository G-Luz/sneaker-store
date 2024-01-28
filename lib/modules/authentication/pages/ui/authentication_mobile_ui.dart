import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/modules/authentication/pages/login.dart';
import 'package:dale_poc/modules/authentication/pages/signup.dart';
import 'package:dale_poc/widgets/app_button.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AuthenticationMobileUi extends StatelessWidget {
  const AuthenticationMobileUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.green,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppText(
                text: 'Bem vindo!',
                fontFamily: 'Poppins',
                fontSize: 60,
                textAlign: TextAlign.center,
              ),
              const AppText(
                text:
                    'Selecione uma das opções disponíveis para continuar. Realize o Login caso já possua uma conta ou Registre uma nova conta',
                fontFamily: 'Poppins',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w100,
                fontSize: 17,
              ),
              const SizedBox(height: 80),
              AppButton(
                text: 'SIGN-IN',
                height: 50,
                width: deviceSize.width * .8,
                onPressedCallback: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const AppText(text: 'OU'),
              const SizedBox(height: 20),
              AppButton(
                text: 'SIGN-UP',
                height: 50,
                width: deviceSize.width * .8,
                enable: true,
                onPressedCallback: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Signup(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
