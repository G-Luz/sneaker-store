import 'package:dale_poc/constants/routes.dart';
import 'package:dale_poc/modules/authentication/authentication_module.dart';
import 'package:dale_poc/repositories/client/client_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(ClientRepository.new);
  }

  @override
  void routes(r) {
    r.module(Routes.initialRoute, module: AuthenticationModule());
  }
}
