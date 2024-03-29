// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WebController on _WebControllerBase, Store {
  late final _$isGridViewAtom =
      Atom(name: '_WebControllerBase.isGridView', context: context);

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
      Atom(name: '_WebControllerBase.sneakersList', context: context);

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
      Atom(name: '_WebControllerBase.filterSneakerList', context: context);

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
      AsyncAction('_WebControllerBase.fetchSneakers', context: context);

  @override
  Future fetchSneakers() {
    return _$fetchSneakersAsyncAction.run(() => super.fetchSneakers());
  }

  late final _$_WebControllerBaseActionController =
      ActionController(name: '_WebControllerBase', context: context);

  @override
  dynamic handleChangeView() {
    final _$actionInfo = _$_WebControllerBaseActionController.startAction(
        name: '_WebControllerBase.handleChangeView');
    try {
      return super.handleChangeView();
    } finally {
      _$_WebControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic searchFilteredSneaker(String filter) {
    final _$actionInfo = _$_WebControllerBaseActionController.startAction(
        name: '_WebControllerBase.searchFilteredSneaker');
    try {
      return super.searchFilteredSneaker(filter);
    } finally {
      _$_WebControllerBaseActionController.endAction(_$actionInfo);
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
