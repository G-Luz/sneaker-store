import 'package:adaptive_screen_flutter/adaptive_screen_flutter.dart';
import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/modules/authentication/pages/ui/authentication_mobile_ui.dart';
import 'package:dale_poc/modules/authentication/pages/ui/authentication_web_ui.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: const Scaffold(
        backgroundColor: AppColors.darkWhite,
        body: AdaptiveScreen(
          mobile: AuthenticationMobileUi(),
          web: AuthenticationWebUi(),
        ),
      ),
    );
  }
}
