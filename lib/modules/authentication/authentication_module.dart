import 'package:dale_poc/constants/routes.dart';
import 'package:dale_poc/modules/authentication/authentication_page.dart';
import 'package:dale_poc/modules/authentication/controller/login/login_controller.dart';
import 'package:dale_poc/modules/authentication/controller/signup/signup_controller.dart';
import 'package:dale_poc/modules/authentication/pages/login.dart';
import 'package:dale_poc/modules/authentication/pages/signup.dart';
import 'package:dale_poc/modules/authentication/repository/authentication_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticationModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(LoginController.new);
    i.addSingleton(SignupController.new);
    i.addSingleton(AuthenticationRepository.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Routes.initialRoute,
        child: (context) => const AuthenticationPage(),
        children: [
          ChildRoute(
            Routes.loginModule,
            transition: TransitionType.rightToLeft,
            child: (context) => const Login(),
          ),
          ChildRoute(
            Routes.signupModule,
            transition: TransitionType.leftToRight,
            child: (context) => const Signup(),
          ),
        ]);
    ;
  }
}
