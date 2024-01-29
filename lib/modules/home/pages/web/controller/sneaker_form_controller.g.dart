// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sneaker_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SneakerFormController on _SneakerFormControllerBase, Store {
  late final _$formStatusAtom =
      Atom(name: '_SneakerFormControllerBase.formStatus', context: context);

  @override
  SneakerFormStatus get formStatus {
    _$formStatusAtom.reportRead();
    return super.formStatus;
  }

  @override
  set formStatus(SneakerFormStatus value) {
    _$formStatusAtom.reportWrite(value, super.formStatus, () {
      super.formStatus = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_SneakerFormControllerBase.name', context: context);

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
      Atom(name: '_SneakerFormControllerBase.nameError', context: context);

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

  late final _$urlAtom =
      Atom(name: '_SneakerFormControllerBase.url', context: context);

  @override
  String get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  late final _$urlErrorAtom =
      Atom(name: '_SneakerFormControllerBase.urlError', context: context);

  @override
  String get urlError {
    _$urlErrorAtom.reportRead();
    return super.urlError;
  }

  @override
  set urlError(String value) {
    _$urlErrorAtom.reportWrite(value, super.urlError, () {
      super.urlError = value;
    });
  }

  late final _$priceAtom =
      Atom(name: '_SneakerFormControllerBase.price', context: context);

  @override
  String get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$priceErrorAtom =
      Atom(name: '_SneakerFormControllerBase.priceError', context: context);

  @override
  String get priceError {
    _$priceErrorAtom.reportRead();
    return super.priceError;
  }

  @override
  set priceError(String value) {
    _$priceErrorAtom.reportWrite(value, super.priceError, () {
      super.priceError = value;
    });
  }

  late final _$ratingAtom =
      Atom(name: '_SneakerFormControllerBase.rating', context: context);

  @override
  String get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(String value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  late final _$ratingErrorAtom =
      Atom(name: '_SneakerFormControllerBase.ratingError', context: context);

  @override
  String get ratingError {
    _$ratingErrorAtom.reportRead();
    return super.ratingError;
  }

  @override
  set ratingError(String value) {
    _$ratingErrorAtom.reportWrite(value, super.ratingError, () {
      super.ratingError = value;
    });
  }

  late final _$hasUpdatedScreenAtom = Atom(
      name: '_SneakerFormControllerBase.hasUpdatedScreen', context: context);

  @override
  bool get hasUpdatedScreen {
    _$hasUpdatedScreenAtom.reportRead();
    return super.hasUpdatedScreen;
  }

  @override
  set hasUpdatedScreen(bool value) {
    _$hasUpdatedScreenAtom.reportWrite(value, super.hasUpdatedScreen, () {
      super.hasUpdatedScreen = value;
    });
  }

  late final _$sneakerAtom =
      Atom(name: '_SneakerFormControllerBase.sneaker', context: context);

  @override
  Sneaker? get sneaker {
    _$sneakerAtom.reportRead();
    return super.sneaker;
  }

  @override
  set sneaker(Sneaker? value) {
    _$sneakerAtom.reportWrite(value, super.sneaker, () {
      super.sneaker = value;
    });
  }

  late final _$onRegisterSneakerAsyncAction = AsyncAction(
      '_SneakerFormControllerBase.onRegisterSneaker',
      context: context);

  @override
  Future<String> onRegisterSneaker() {
    return _$onRegisterSneakerAsyncAction.run(() => super.onRegisterSneaker());
  }

  late final _$_SneakerFormControllerBaseActionController =
      ActionController(name: '_SneakerFormControllerBase', context: context);

  @override
  dynamic onUpdatedFields(Sneaker sneaker) {
    final _$actionInfo = _$_SneakerFormControllerBaseActionController
        .startAction(name: '_SneakerFormControllerBase.onUpdatedFields');
    try {
      return super.onUpdatedFields(sneaker);
    } finally {
      _$_SneakerFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onNameChanged(String name) {
    final _$actionInfo = _$_SneakerFormControllerBaseActionController
        .startAction(name: '_SneakerFormControllerBase.onNameChanged');
    try {
      return super.onNameChanged(name);
    } finally {
      _$_SneakerFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onUrlChanged(String url) {
    final _$actionInfo = _$_SneakerFormControllerBaseActionController
        .startAction(name: '_SneakerFormControllerBase.onUrlChanged');
    try {
      return super.onUrlChanged(url);
    } finally {
      _$_SneakerFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPriceChanged(String price) {
    final _$actionInfo = _$_SneakerFormControllerBaseActionController
        .startAction(name: '_SneakerFormControllerBase.onPriceChanged');
    try {
      return super.onPriceChanged(price);
    } finally {
      _$_SneakerFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onRatingChanged(String rating) {
    final _$actionInfo = _$_SneakerFormControllerBaseActionController
        .startAction(name: '_SneakerFormControllerBase.onRatingChanged');
    try {
      return super.onRatingChanged(rating);
    } finally {
      _$_SneakerFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFields() {
    final _$actionInfo = _$_SneakerFormControllerBaseActionController
        .startAction(name: '_SneakerFormControllerBase.validateFields');
    try {
      return super.validateFields();
    } finally {
      _$_SneakerFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formStatus: ${formStatus},
name: ${name},
nameError: ${nameError},
url: ${url},
urlError: ${urlError},
price: ${price},
priceError: ${priceError},
rating: ${rating},
ratingError: ${ratingError},
hasUpdatedScreen: ${hasUpdatedScreen},
sneaker: ${sneaker}
    ''';
  }
}
