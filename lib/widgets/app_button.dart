import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    this.backgroudColor = Colors.transparent,
    this.textColor = AppColors.darkWhite,
    this.enable = true,
    required this.onPressedCallback,
    this.height,
    this.width,
  }) : super(key: key);

  final double? height;
  final double? width;
  final String text;
  final Color backgroudColor;
  final Color textColor;
  final bool enable;
  final VoidCallback onPressedCallback;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    if (width == null) {
      deviceSize.width * .15;
    }
    if (height == null) {
      deviceSize.height * .06;
    }

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: enable ? () => onPressedCallback() : null,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(
            enable ? backgroudColor : AppColors.lightGrey,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(
                  color: AppColors.darkWhite,
                  width: .5,
                )),
          ),
        ),
        child: AppText(
          text: text.toUpperCase(),
          fontSize: 15,
          fontColor: textColor,
        ),
      ),
    );
  }
}
