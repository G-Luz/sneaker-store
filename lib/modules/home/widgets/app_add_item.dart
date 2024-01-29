import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppAddGridItem extends StatelessWidget {
  const AppAddGridItem({
    Key? key,
    required this.onTapCallback,
  }) : super(key: key);

  final VoidCallback onTapCallback;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onTapCallback(),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.darkWhite,
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: NetworkImage(
                'https://img.lovepik.com/free-png/20211206/lovepik-vector-sneakers-png-image_401350356_wh1200.png',
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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.darkWhite,
                ),
                SizedBox(height: 10),
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
  const AppAddListItem({
    Key? key,
    required this.onTapCallback,
  }) : super(key: key);

  final VoidCallback onTapCallback;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onTapCallback(),
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
                'https://img.lovepik.com/free-png/20211206/lovepik-vector-sneakers-png-image_401350356_wh1200.png',
              ),
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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.darkWhite,
                ),
                SizedBox(height: 10),
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
