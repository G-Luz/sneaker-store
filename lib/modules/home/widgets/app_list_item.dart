import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/modules/home/domain/sneaker.dart';
import 'package:dale_poc/modules/home/widgets/app_simple_dialog.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppListItem extends StatelessWidget {
  const AppListItem({
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
              image: DecorationImage(
                image: NetworkImage(sneaker.imgUrl),
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
                        text: sneaker.name,
                        fontColor: Colors.black.withOpacity(.3),
                        fontSize: 15,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AppText(
                      text: '\$${sneaker.price}',
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
                          text: '${sneaker.rating}',
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
    final deviceSize = MediaQuery.of(context).size;
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
            width: deviceSize.width * .05,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(sneaker.imgUrl),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: 150,
            child: AppText(
              text: sneaker.name,
              fontColor: Colors.black.withOpacity(.3),
              fontSize: 15,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
          AppText(
            text: '\$${sneaker.price}',
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
                text: '${sneaker.rating}.0',
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
              onPressed: () => showSimpleDialog(
                context: context,
                sneaker: sneaker,
              ),
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
