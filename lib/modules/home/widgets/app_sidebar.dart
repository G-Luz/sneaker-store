import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/constants/app_images.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      width: deviceSize.width * .1,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(.3),
          ),
        ),
      ),
      // color: Colors.amber,
      child: ListView(
        children: [
          Container(
            height: deviceSize.height * .07,
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(.3),
                ),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage(AppImages.logo),
                  color: AppColors.green,
                ),
                SizedBox(width: 10),
                AppText(
                  text: 'Gabriel Luz',
                  fontColor: AppColors.green,
                ),
              ],
            ),
          ),
          AppSideBarItem(
            icon: Icons.bar_chart_rounded,
            optionTitle: 'Dashboard',
            isSelected: true,
            onTapCallback: () {},
          ),
          AppSideBarItem(
            icon: Icons.group,
            optionTitle: 'Produtos',
            onTapCallback: () {},
          ),
        ],
      ),
    );
  }
}

class AppSideBarItem extends StatelessWidget {
  const AppSideBarItem({
    Key? key,
    required this.icon,
    required this.optionTitle,
    this.isSelected = false,
    required this.onTapCallback,
  }) : super(key: key);

  final IconData icon;
  final String optionTitle;
  final bool isSelected;
  final VoidCallback onTapCallback;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onTapCallback(),
        child: Container(
          height: deviceSize.height * .12,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.green : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.darkWhite2 : Colors.grey,
              ),
              AppText(
                text: optionTitle,
                fontColor: isSelected ? AppColors.darkWhite2 : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
