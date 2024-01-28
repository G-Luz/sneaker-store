// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  late final _$formStatusAtom =
      Atom(name: 'LoginControllerBase.formStatus', context: context);

  @override
  LoginFormStatus get formStatus {
    _$formStatusAtom.reportRead();
    return super.formStatus;
  }

  @override
  set formStatus(LoginFormStatus value) {
    _$formStatusAtom.reportWrite(value, super.formStatus, () {
      super.formStatus = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'LoginControllerBase.email', context: context);

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
      Atom(name: 'LoginControllerBase.emailError', context: context);

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

  late final _$passwordAtom =
      Atom(name: 'LoginControllerBase.password', context: context);

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
      Atom(name: 'LoginControllerBase.passwordError', context: context);

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

  late final _$isObscureTextAtom =
      Atom(name: 'LoginControllerBase.isObscureText', context: context);

  @override
  bool get isObscureText {
    _$isObscureTextAtom.reportRead();
    return super.isObscureText;
  }

  @override
  set isObscureText(bool value) {
    _$isObscureTextAtom.reportWrite(value, super.isObscureText, () {
      super.isObscureText = value;
    });
  }

  late final _$onSubmittedFormAsyncAction =
      AsyncAction('LoginControllerBase.onSubmittedForm', context: context);

  @override
  Future<dynamic> onSubmittedForm() {
    return _$onSubmittedFormAsyncAction.run(() => super.onSubmittedForm());
  }

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

  @override
  dynamic onEmailChanged(String email) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.onEmailChanged');
    try {
      return super.onEmailChanged(email);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPasswordChanged(String password) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.onPasswordChanged');
    try {
      return super.onPasswordChanged(password);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateFields() {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.validateFields');
    try {
      return super.validateFields();
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formStatus: ${formStatus},
email: ${email},
emailError: ${emailError},
password: ${password},
passwordError: ${passwordError},
isObscureText: ${isObscureText}
    ''';
  }
}
