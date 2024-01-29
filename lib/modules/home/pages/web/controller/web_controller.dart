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

  @observable
  ObservableList<Sneaker> sneakersList = ObservableList<Sneaker>();

  @observable
  ObservableList<Sneaker> filterSneakerList = ObservableList<Sneaker>();

  @action
  handleChangeView() {
    isGridView = !isGridView;
  }

  @action
  searchFilteredSneaker(String filter) {
    filterSneakerList.clear();

    if (sneakersList.isNotEmpty) {
      for (final sneaker in sneakersList) {
        if (sneaker.name.toLowerCase().contains(filter)) {}

        if (sneaker.name.toLowerCase().contains(filter)) {
          filterSneakerList.add(sneaker);
        }
      }
    }
  }

  @action
  fetchSneakers() async {
    final sneakers = await _repository.retrieveSneakerList();
    if (sneakers != null && sneakers.isNotEmpty) {
      sneakersList.clear();
      sneakersList.addAll(sneakers);
    }
  }
}
