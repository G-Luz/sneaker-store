// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupController on SignupControllerBase, Store {
  late final _$formStatusAtom =
      Atom(name: 'SignupControllerBase.formStatus', context: context);

  @override
  SignupFormStatus get formStatus {
    _$formStatusAtom.reportRead();
    return super.formStatus;
  }

  @override
  set formStatus(SignupFormStatus value) {
    _$formStatusAtom.reportWrite(value, super.formStatus, () {
      super.formStatus = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'SignupControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$nameErrorAtom =
      Atom(name: 'SignupControllerBase.nameError', context: context);

  @override
  String get nameError {
    _$nameErrorAtom.reportRead();
    return super.nameError;
  }

  @override
  set nameError(String value) {
    _$nameErrorAtom.reportWrite(value, super.nameError, () {
      super.nameError = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'SignupControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$emailErrorAtom =
      Atom(name: 'SignupControllerBase.emailError', context: context);

  @override
  String get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(String value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  late final _$ageAtom =
      Atom(name: 'SignupControllerBase.age', context: context);

  @override
  String get age {
    _$ageAtom.reportRead();
    return super.age;
  }

  @override
  set age(String value) {
    _$ageAtom.reportWrite(value, super.age, () {
      super.age = value;
    });
  }

  late final _$ageErrorAtom =
      Atom(name: 'SignupControllerBase.ageError', context: context);

  @override
  String get ageError {
    _$ageErrorAtom.reportRead();
    return super.ageError;
  }

  @override
  set ageError(String value) {
    _$ageErrorAtom.reportWrite(value, super.ageError, () {
      super.ageError = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'SignupControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: 'SignupControllerBase.passwordError', context: context);

  @override
  String get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$repeatPasswordAtom =
      Atom(name: 'SignupControllerBase.repeatPassword', context: context);

  @override
  String get repeatPassword {
    _$repeatPasswordAtom.reportRead();
    return super.repeatPassword;
  }

  @override
  set repeatPassword(String value) {
    _$repeatPasswordAtom.reportWrite(value, super.repeatPassword, () {
      super.repeatPassword = value;
    });
  }

  late final _$repPasswordErrorAtom =
      Atom(name: 'SignupControllerBase.repPasswordError', context: context);

  @override
  String get repPasswordError {
    _$repPasswordErrorAtom.reportRead();
    return super.repPasswordError;
  }

  @override
  set repPasswordError(String value) {
    _$repPasswordErrorAtom.reportWrite(value, super.repPasswordError, () {
      super.repPasswordError = value;
    });
  }

  late final _$onRegisterUserAsyncAction =
      AsyncAction('SignupControllerBase.onRegisterUser', context: context);

  @override
  Future<String> onRegisterUser({required bool isWeb}) {
    return _$onRegisterUserAsyncAction
        .run(() => super.onRegisterUser(isWeb: isWeb));
  }

  late final _$SignupControllerBaseActionController =
      ActionController(name: 'SignupControllerBase', context: context);

  @override
  dynamic onNameChanged(String name) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onNameChanged');
    try {
      return super.onNameChanged(name);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onEmailChanged(String email) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onEmailChanged');
    try {
      return super.onEmailChanged(email);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onAgeChanged(String age) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onAgeChanged');
    try {
      return super.onAgeChanged(age);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPasswordChanged(String password) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onPasswordChanged');
    try {
      return super.onPasswordChanged(password);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onRepeatPasswordChanged(String repeatPass) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onRepeatPasswordChanged');
    try {
      return super.onRepeatPasswordChanged(repeatPass);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFields() {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.validateFields');
    try {
      return super.validateFields();
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formStatus: ${formStatus},
name: ${name},
nameError: ${nameError},
email: ${email},
emailError: ${emailError},
age: ${age},
ageError: ${ageError},
password: ${password},
passwordError: ${passwordError},
repeatPassword: ${repeatPassword},
repPasswordError: ${repPasswordError}
    ''';
  }
}
