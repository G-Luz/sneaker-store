import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/constants/app_images.dart';
import 'package:flutter/material.dart';

class AppSocialAuth extends StatelessWidget {
  const AppSocialAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSocialItem(iconPath: AppImages.icGoogle),
          SizedBox(width: 20),
          AppSocialItem(iconPath: AppImages.icFace),
          SizedBox(width: 20),
          AppSocialItem(iconPath: AppImages.icApple),
        ],
      ),
    );
  }
}

class AppSocialItem extends StatelessWidget {
  const AppSocialItem({
    Key? key,
    required this.iconPath,
  }) : super(key: key);

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.darkWhite2,
        border: Border.all(
          color: Colors.black.withOpacity(.4),
        ),
        shape: BoxShape.circle,
      ),
      child: ImageIcon(
        AssetImage(
          iconPath,
        ),
        size: 20,
      ),
    );
  }
}
