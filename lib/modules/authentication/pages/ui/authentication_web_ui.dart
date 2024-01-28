import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/constants/routes.dart';
import 'package:dale_poc/widgets/app_button.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticationWebUi extends StatelessWidget {
  const AuthenticationWebUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(100),
      decoration: BoxDecoration(
        color: AppColors.darkWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: deviceSize.width * .3,
            height: deviceSize.height,
            decoration: const BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  20,
                ),
                bottomLeft: Radius.circular(
                  20,
                ),
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: deviceSize.width * .3,
                      child: const AppText(
                        text: 'Bem vindo!',
                        fontFamily: 'Poppins',
                        fontSize: 60,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: deviceSize.width * .25,
                      child: const AppText(
                        text:
                            'Selecione uma das opções disponíveis para continuar. Realize o Login caso já possua uma conta ou Registre uma nova conta',
                        fontFamily: 'Poppins',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w100,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 80),
                    AppButton(
                      text: 'SIGN-IN',
                      width: kIsWeb
                          ? deviceSize.width * .15
                          : deviceSize.width * .9,
                      height: kIsWeb
                          ? deviceSize.height * .06
                          : deviceSize.height * .07,
                      onPressedCallback: () =>
                          Modular.to.navigate(Routes.loginModule),
                    ),
                    const SizedBox(height: 20),
                    const AppText(text: 'OU'),
                    const SizedBox(height: 20),
                    AppButton(
                      text: 'SIGN-UP',
                      width: kIsWeb
                          ? deviceSize.width * .15
                          : deviceSize.width * .9,
                      height: kIsWeb
                          ? deviceSize.height * .06
                          : deviceSize.height * .07,
                      onPressedCallback: () =>
                          Modular.to.navigate(Routes.signupModule),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: RouterOutlet(),
          ),
        ],
      ),
    );
  }
}
