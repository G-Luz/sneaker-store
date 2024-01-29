import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/modules/home/domain/sneaker.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppGridItem extends StatelessWidget {
  const AppGridItem({
    Key? key,
    required this.isWebView,
    this.sneaker,
  }) : super(key: key);

  final bool isWebView;
  final Sneaker? sneaker;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kIsWeb
              ? const Spacer()
              : Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.red,
                    ),
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage('https://picsum.photos/200'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: deviceSize.width * .08,
                      child: AppText(
                        text: 'Nome do produto',
                        fontColor: Colors.black.withOpacity(.3),
                        fontSize: 15,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AppText(
                      text: '\$580',
                      fontColor: Colors.black,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.yellow[600],
                          size: 15,
                        ),
                        AppText(
                          text: '4.3',
                          fontColor: Colors.grey.withOpacity(.4),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    isWebView ? Icons.edit : Icons.add,
                    color: AppColors.darkWhite,
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
