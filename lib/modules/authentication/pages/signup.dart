import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/constants/routes.dart';
import 'package:dale_poc/modules/authentication/controller/signup/signup_controller.dart';
import 'package:dale_poc/widgets/app_button.dart';
import 'package:dale_poc/widgets/app_loading.dart';
import 'package:dale_poc/widgets/app_social_auth.dart';
import 'package:dale_poc/widgets/app_success_dialog.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:dale_poc/widgets/app_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final controller = Modular.get<SignupController>();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Observer(
      builder: (context) {
        return Material(
          color: AppColors.darkWhite2,
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: SingleChildScrollView(
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
                      text: 'Faça seu cadastro na Plataforma',
                      fontSize: kIsWeb ? 60 : 30,
                      fontColor: AppColors.green,
                      textAlign: TextAlign.center,
                    ),
                    const AppSocialAuth(),
                    AppText(
                      text: 'Ou utilize seu E-mail para o cadastro',
                      fontColor: Colors.grey.withOpacity(.7),
                    ),
                    SizedBox(height: deviceSize.height * .05),
                    AppTextfield(
                      hint: 'Nome',
                      errorText: controller.nameError,
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.grey,
                      ),
                      onChangedCallback: (value) =>
                          controller.onNameChanged(value),
                    ),
                    const SizedBox(height: 10),
                    AppTextfield(
                      hint: 'E-mail',
                      errorText: controller.emailError,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                      onChangedCallback: (value) =>
                          controller.onEmailChanged(value),
                    ),
                    const SizedBox(height: 10),
                    AppTextfield(
                      hint: 'Idade',
                      keyboardType: TextInputType.number,
                      errorText: controller.ageError,
                      prefixIcon: const Icon(
                        Icons.person_add,
                        color: Colors.grey,
                      ),
                      onChangedCallback: (value) =>
                          controller.onAgeChanged(value),
                    ),
                    const SizedBox(height: 10),
                    AppTextfield(
                      hint: 'Senha',
                      keyboardType: TextInputType.visiblePassword,
                      errorText: controller.passwordError,
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ),
                      onChangedCallback: (value) =>
                          controller.onPasswordChanged(value),
                    ),
                    const SizedBox(height: 10),
                    AppTextfield(
                      hint: 'Repita a senha',
                      errorText: controller.repPasswordError,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ),
                      onChangedCallback: (value) =>
                          controller.onRepeatPasswordChanged(value),
                    ),
                    SizedBox(height: deviceSize.height * .04),
                    AppButton(
                      text: 'Cadastrar',
                      width: kIsWeb
                          ? deviceSize.width * .15
                          : deviceSize.width * .9,
                      height: kIsWeb
                          ? deviceSize.height * .06
                          : deviceSize.height * .07,
                      backgroudColor: AppColors.green,
                      enable: controller.isValidForm,
                      onPressedCallback: () async {
                        showAppLoading(context);
                        final result = await controller.onRegisterUser(
                          isWeb: kIsWeb,
                        );
                        if (result.isEmpty) {
                          if (context.mounted) {
                            Modular.to.pop();
                            await showAutoCloseSuccessDialog(
                              context,
                              'Conta cadastrada com sucesso',
                              description:
                                  'Sua conta foi cadastrada com sucesso. Você já pode efetuar login com o E-mail cadastrado',
                            );
                            Modular.to.navigate(Routes.loginModule);
                          }
                        }
                      },
                    ),
                    SizedBox(height: deviceSize.height * .02),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
