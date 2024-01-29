import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/modules/home/domain/sneaker.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppListItem extends StatelessWidget {
  const AppListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
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
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: Icon(
              Icons.favorite_outline_rounded,
              color: Colors.red,
            ),
          ),
          Container(
            height: 60,
            width: 65,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage('https://picsum.photos/200'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Row(
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
                      width: 150,
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
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

class AppWebListItem extends StatelessWidget {
  const AppWebListItem({
    Key? key,
    required this.sneaker,
  }) : super(key: key);

  final Sneaker sneaker;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 60,
            width: 65,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage('https://picsum.photos/200'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: 150,
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
              ),
            ],
          ),
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: AppColors.green,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: AppColors.darkWhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
