import 'package:dale_poc/modules/authentication/repository/authentication_repository.dart';
import 'package:dale_poc/utils/debounce.dart';
import 'package:dale_poc/utils/string_utils.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

enum LoginFormStatus { initial, invalid, valid, loading, success, failure }

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final debouncer = Debouncer(delay: const Duration(milliseconds: 400));

  final _repository = Modular.get<AuthenticationRepository>();

  @observable
  LoginFormStatus formStatus = LoginFormStatus.initial;

  @observable
  String email = '';
  @observable
  String emailError = '';

  @observable
  String password = '';
  @observable
  String passwordError = '';

  @observable
  bool isObscureText = true;

  @action
  onEmailChanged(String email) {
    debouncer.run(
      () {
        if (email.isValidEmail()) {
          this.email = email;
          emailError = '';
          validateFields();
        } else {
          this.email = '';
          emailError = 'Insira um e-mail válido.';
        }
      },
    );
  }

  @action
  onPasswordChanged(String password) {
    debouncer.run(
      () {
        if (password.isValidPassword()) {
          this.password = password;
          passwordError = '';
          validateFields();
        } else {
          this.password = '';
          passwordError = 'Senha muito curta. Insira a senha correta!';
          validateFields();
        }
      },
    );
  }

  @action
  validateFields() {
    if ((email.isNotEmpty && emailError.isEmpty) &&
        (password.isNotEmpty && passwordError.isEmpty)) {
      formStatus = LoginFormStatus.valid;
    } else {
      formStatus = LoginFormStatus.invalid;
    }
  }

  @action
  Future<dynamic> onSubmittedForm() async {
    return await Future.delayed(
      const Duration(seconds: 2),
      () async {
        if (formStatus == LoginFormStatus.valid) {
          try {
            formStatus = LoginFormStatus.loading;
            final loginResult = await _repository.findUserByEmailAndPassword(
              email: email,
              password: password,
            );
            if (loginResult != null) {
              formStatus = LoginFormStatus.success;
              return loginResult;
            } else {
              formStatus = LoginFormStatus.failure;
              validateFields();
              return null;
            }
          } on Exception catch (e) {
            print('Error: $e');
            formStatus = LoginFormStatus.failure;
          }
        } else {
          formStatus = LoginFormStatus.failure;
          return 'Verifique os campos e tente novamente.';
        }
      },
    );
  }
}
