import 'package:dale_poc/modules/authentication/domain/user.dart';
import 'package:dale_poc/modules/authentication/repository/authentication_repository.dart';
import 'package:dale_poc/utils/debounce.dart';
import 'package:dale_poc/utils/string_utils.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

enum SignupFormStatus {
  initial,
  invalidForm,
  validForm,
  loading,
  success,
  failure
}

class SignupController = SignupControllerBase with _$SignupController;

abstract class SignupControllerBase with Store {
  final _repository = Modular.get<AuthenticationRepository>();
  final debouncer = Debouncer(delay: const Duration(milliseconds: 400));

  @observable
  SignupFormStatus formStatus = SignupFormStatus.initial;

  @observable
  String name = '';
  @observable
  String nameError = '';

  @observable
  String email = '';
  @observable
  String emailError = '';

  @observable
  String age = '';
  @observable
  String ageError = '';

  @observable
  String password = '';
  @observable
  String passwordError = '';

  @observable
  String repeatPassword = '';
  @observable
  String repPasswordError = '';

  bool get isValidForm => formStatus == SignupFormStatus.validForm;

  @action
  onNameChanged(String name) {
    debouncer.run(
      () {
        if (name.isValidFieldLength(length: 1)) {
          this.name = name;
          nameError = '';
          validateFields();
        } else {
          nameError = 'Preencha o Nome corretamente';
          validateFields();
        }
      },
    );
  }

  @action
  onEmailChanged(String email) {
    debouncer.run(
      () {
        if (email.isValidEmail()) {
          this.email = email;
          emailError = '';
          validateFields();
        } else {
          emailError = 'Preencha o E-mail corretamente';
          validateFields();
        }
      },
    );
  }

  @action
  onAgeChanged(String age) {
    debouncer.run(
      () {
        if (age.isNotEmpty && int.parse(age) > 10) {
          this.age = age;
          ageError = '';
        } else {
          ageError = 'Você deve possuir mais de 10 anos para utilizar o app';
          validateFields();
        }
      },
    );
  }

  @action
  onPasswordChanged(String password) {
    debouncer.run(
      () {
        if (password.isValidPassword()) {
          if (repeatPassword.isNotEmpty) {
            if (password == repeatPassword) {
              this.password = password;
              passwordError = '';
              validateFields();
            } else {
              passwordError = 'As senhas não conferem';
              validateFields();
            }
          } else {
            this.password = password;
            passwordError = '';
            validateFields();
          }
        } else {
          passwordError = 'A senha deve conter 4 caracteres ou mais';
          validateFields();
        }
      },
    );
  }

  @action
  onRepeatPasswordChanged(String repeatPass) {
    debouncer.run(
      () {
        if (password.isNotEmpty) {
          if (repeatPass == password) {
            repeatPassword = repeatPass;
            repPasswordError = '';
            validateFields();
          } else {
            repPasswordError = 'As senhas não conferem';
            validateFields();
          }
        } else {
          repPasswordError = 'A senha repetida deve ser igual a do campo Senha';
          validateFields();
        }
      },
    );
  }

  @action
  void validateFields() {
    if ((name.isNotEmpty && nameError.isEmpty) &&
        (email.isNotEmpty && emailError.isEmpty) &&
        (password.isNotEmpty && passwordError.isEmpty) &&
        (repeatPassword.isNotEmpty && repPasswordError.isEmpty)) {
      formStatus = SignupFormStatus.validForm;
    } else {
      formStatus = SignupFormStatus.invalidForm;
    }
  }

  @action
  Future<String> onRegisterUser({required bool isWeb}) async {
    return await Future.delayed(
      const Duration(seconds: 2),
      () async {
        if (formStatus == SignupFormStatus.validForm) {
          formStatus = SignupFormStatus.loading;
          final user = User(
            name: name,
            email: email,
            age: int.parse(age),
            isAdmin: isWeb,
            password: password,
          );
          final authResult = await _repository.registerNewUser(user);

          if (authResult) {
            formStatus = SignupFormStatus.success;
            return '';
          } else {
            formStatus = SignupFormStatus.failure;
            return 'Ocorreu um erro durante a requisição. Tente novamente mais tarde!';
          }
        } else {
          formStatus = SignupFormStatus.failure;
          return 'Preencha os campos corretamente.';
        }
      },
    );
  }
}
