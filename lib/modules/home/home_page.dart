import 'package:adaptive_screen_flutter/adaptive_screen_flutter.dart';
import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/modules/home/pages/mobile/home_mobile_ui.dart';
import 'package:dale_poc/modules/home/pages/web/home_web_ui.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundGray,
        body: AdaptiveScreen(
          mobile: HomeMobileUi(),
          web: HomeWebUi(),
        ),
      ),
    );
  }
}
