import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog(
      {Key? key,
      this.hasHeightLimit = true,
      required this.height,
      required this.width,
      required this.child,
      this.backgroundColor = AppColors.darkWhite})
      : super(key: key);

  final bool hasHeightLimit;
  final double height;
  final double width;
  final Color? backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 80),
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: width,
          height: hasHeightLimit ? height : null,
        ),
        child: child,
      ),
    );
  }
}

class DialogText extends StatelessWidget {
  const DialogText({
    Key? key,
    required this.title,
    this.titleColor = AppColors.darkWhite,
    this.fontSize = 25,
    this.description,
  }) : super(key: key);

  final String title;
  final Color titleColor;
  final double fontSize;
  final String? description;

  static const double _sidePadding = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: _sidePadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: title,
            fontColor: titleColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          if (description != null)
            Column(
              children: [
                const SizedBox(height: 15),
                Container(
                  constraints: BoxConstraints.loose(
                    const Size.fromWidth(300),
                  ),
                  child: AppText(
                    text: description!,
                    fontSize: 15,
                    fontColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
