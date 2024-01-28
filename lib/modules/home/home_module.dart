import 'package:dale_poc/constants/routes.dart';
import 'package:dale_poc/modules/home/controller/home_controller.dart';
import 'package:dale_poc/modules/home/home_page.dart';
import 'package:dale_poc/modules/home/repository/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(HomeController.new);
    i.addSingleton(HomeRepository.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.initialRoute,
      child: (context) => const HomePage(),
      children: [],
    );
  }
}
