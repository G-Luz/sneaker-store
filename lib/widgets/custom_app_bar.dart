import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: AppColors.green,
        ),
        padding: EdgeInsets.zero,
        onPressed: () {},
      ),
      title: const AppText(
        text: 'Home',
        fontSize: 20,
        fontColor: Colors.black,
      ),
      centerTitle: true,
      actions: <Widget>[
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
                Icons.shopping_cart,
                color: AppColors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
