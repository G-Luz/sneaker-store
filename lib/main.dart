import 'package:dale_poc/app.dart';
import 'package:dale_poc/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// TODO: REAL TIME ISSUE
// https://community.xano.com/feature-requests/post/realtime-database-PHNvQDOrL9uR1hT

/// SNEAKER IMGS
/// https://hypedfam.com/products/air-jordan-1-high-og-brotherhood


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ModularApp(module: AppModule(), child: const App()),
  );
}
