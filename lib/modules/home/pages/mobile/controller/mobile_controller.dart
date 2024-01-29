import 'package:mobx/mobx.dart';
part 'mobile_controller.g.dart';

class MobileController = _MobileControllerBase with _$MobileController;

abstract class _MobileControllerBase with Store {
  @observable
  bool isGridView = true;

  @action
  handleChangeView() {
    isGridView = !isGridView;
  }
}
