import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/constants/app_images.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppStatisticsWidget extends StatelessWidget {
  const AppStatisticsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          childAspectRatio: 5 / 1.3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const AppStatisticsItem(
              iconPath: AppImages.icLine,
              text: '350',
              description: 'Novas vendas',
            );
          }

          if (index == 1) {
            return const AppStatisticsItem(
              iconPath: AppImages.icPie,
              text: '170',
              description: 'Novos cadastros',
            );
          }
          if (index == 2) {
            return const AppStatisticsItem(
              iconPath: AppImages.icBar,
              text: '220',
              description: 'Avaliações positivas',
            );
          }
          if (index == 3) {
            return const AppStatisticsItem(
              iconPath: AppImages.icLine,
              text: '110',
              description: 'Solicitações',
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class AppStatisticsItem extends StatelessWidget {
  const AppStatisticsItem({
    Key? key,
    required this.iconPath,
    required this.text,
    required this.description,
  }) : super(key: key);

  final String iconPath;
  final String text;
  final String description;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      height: deviceSize.height * .07,
      decoration: BoxDecoration(
        color: AppColors.darkWhite,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: deviceSize.height * .05,
            width: deviceSize.width * .05,
            child: Image.asset(
              iconPath,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: text,
                fontColor: Colors.black,
                fontSize: 25,
              ),
              const SizedBox(width: 10),
              AppText(
                text: description,
                fontColor: Colors.black.withOpacity(.5),
                fontSize: 15,
              ),
            ],
          ),
          Container(
            height: deviceSize.height * .03,
            width: deviceSize.width * .02,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(30)),
            child: const Center(
              child: AppText(
                text: '25%',
                fontColor: AppColors.darkWhite,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
