import 'package:dale_poc/modules/home/domain/sneaker.dart';
import 'package:dale_poc/modules/home/repository/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'web_controller.g.dart';

class WebController = _WebControllerBase with _$WebController;

abstract class _WebControllerBase with Store {
  final _repository = Modular.get<HomeRepository>();

  @observable
  bool isGridView = true;

  @action
  handleChangeView() {
    isGridView = !isGridView;
  }

  Stream<List<Sneaker>?> sneakersStream() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 1200));
      print('ta chamando??');
      List<Sneaker>? sneakers = await _repository.retrieveSneakerList();
      yield sneakers;
    }
  }
}
