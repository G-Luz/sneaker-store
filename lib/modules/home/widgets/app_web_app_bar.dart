import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/constants/app_images.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppWebAppBar extends StatelessWidget {
  const AppWebAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: deviceSize.height * .07,
            child: const AppText(
              text: 'Dashboard',
              fontColor: AppColors.green,
              fontSize: 25,
            ),
          ),
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(.2),
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Badge(
                    backgroundColor: Colors.red,
                    smallSize: 10,
                    child: ImageIcon(
                      AssetImage(
                        AppImages.icNotification,
                      ),
                      color: AppColors.green,
                      size: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(.2),
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Badge(
                    backgroundColor: Colors.transparent,
                    smallSize: 10,
                    child: Icon(
                      Icons.chat_bubble_outline,
                      color: AppColors.green,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
