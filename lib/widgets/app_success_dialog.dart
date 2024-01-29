import 'dart:async';

import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/widgets/app_base_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future showAutoCloseSuccessDialog(
  BuildContext context,
  String title, {
  String? description,
  Duration closeDuration = const Duration(seconds: 3),
}) {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AppAutoCloseSuccessDialog(
        title: title,
        description: description,
        closeDuration: closeDuration,
      );
    },
  );
}

class AppAutoCloseSuccessDialog extends StatefulWidget {
  const AppAutoCloseSuccessDialog({
    Key? key,
    required this.title,
    this.description,
    required this.closeDuration,
  }) : super(key: key);

  final String title;
  final String? description;
  final Duration closeDuration;

  @override
  State<AppAutoCloseSuccessDialog> createState() =>
      _AppAutoCloseSuccessDialogState();
}

class _AppAutoCloseSuccessDialogState extends State<AppAutoCloseSuccessDialog> {
  late final Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(
      widget.closeDuration,
      () => Modular.to.pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return BaseDialog(
      height: deviceHeight * .2,
      width: deviceWidth * .3,
      backgroundColor: AppColors.green,
      child: Container(
        // color: Colors.yellow,
        child: DialogText(
          title: widget.title,
          description: widget.description,
          fontSize: kIsWeb ? 30 : 17,
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
