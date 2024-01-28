import 'package:dale_poc/app.dart';
import 'package:dale_poc/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ModularApp(module: AppModule(), child: const App()),
  );
}
