// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobileController on _MobileControllerBase, Store {
  late final _$isGridViewAtom =
      Atom(name: '_MobileControllerBase.isGridView', context: context);

  @override
  bool get isGridView {
    _$isGridViewAtom.reportRead();
    return super.isGridView;
  }

  @override
  set isGridView(bool value) {
    _$isGridViewAtom.reportWrite(value, super.isGridView, () {
      super.isGridView = value;
    });
  }

  late final _$sneakersListAtom =
      Atom(name: '_MobileControllerBase.sneakersList', context: context);

  @override
  ObservableList<Sneaker> get sneakersList {
    _$sneakersListAtom.reportRead();
    return super.sneakersList;
  }

  @override
  set sneakersList(ObservableList<Sneaker> value) {
    _$sneakersListAtom.reportWrite(value, super.sneakersList, () {
      super.sneakersList = value;
    });
  }

  late final _$filterSneakerListAtom =
      Atom(name: '_MobileControllerBase.filterSneakerList', context: context);

  @override
  ObservableList<Sneaker> get filterSneakerList {
    _$filterSneakerListAtom.reportRead();
    return super.filterSneakerList;
  }

  @override
  set filterSneakerList(ObservableList<Sneaker> value) {
    _$filterSneakerListAtom.reportWrite(value, super.filterSneakerList, () {
      super.filterSneakerList = value;
    });
  }

  late final _$fetchSneakersAsyncAction =
      AsyncAction('_MobileControllerBase.fetchSneakers', context: context);

  @override
  Future fetchSneakers() {
    return _$fetchSneakersAsyncAction.run(() => super.fetchSneakers());
  }

  late final _$_MobileControllerBaseActionController =
      ActionController(name: '_MobileControllerBase', context: context);

  @override
  dynamic handleChangeView() {
    final _$actionInfo = _$_MobileControllerBaseActionController.startAction(
        name: '_MobileControllerBase.handleChangeView');
    try {
      return super.handleChangeView();
    } finally {
      _$_MobileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic searchFilteredSneaker(String filter) {
    final _$actionInfo = _$_MobileControllerBaseActionController.startAction(
        name: '_MobileControllerBase.searchFilteredSneaker');
    try {
      return super.searchFilteredSneaker(filter);
    } finally {
      _$_MobileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isGridView: ${isGridView},
sneakersList: ${sneakersList},
filterSneakerList: ${filterSneakerList}
    ''';
  }
}
