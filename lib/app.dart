import 'package:dale_poc/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(Routes.loginModule);
    return MaterialApp.router(
      title: 'Dale POC',
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    );
  }
}
