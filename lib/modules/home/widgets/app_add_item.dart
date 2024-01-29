import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/constants/app_images.dart';
import 'package:dale_poc/modules/home/pages/web/controller/web_controller.dart';
import 'package:dale_poc/modules/home/widgets/app_simple_dialog.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppAddGridItem extends StatelessWidget {
  const AppAddGridItem({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WebController controller;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          showSimpleDialog(
            context: context,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.darkWhite,
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: NetworkImage(
                'https://picsum.photos/200',
              ),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.6),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.darkWhite,
                ),
                const SizedBox(height: 10),
                AppText(
                  text: 'Adicionar novo produto',
                  fontColor: AppColors.darkWhite,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppAddListItem extends StatelessWidget {
  const AppAddListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // showSimpleDialog(context, 'eae', 'opa dnv', AppImages.icApple);
        },
        child: Container(
          height: 80,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: AppColors.darkWhite,
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: NetworkImage(
                'https://picsum.photos/200',
              ),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.6),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.darkWhite,
                ),
                const SizedBox(height: 10),
                AppText(
                  text: 'Adicionar novo produto',
                  fontColor: AppColors.darkWhite,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
