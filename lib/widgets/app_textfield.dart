import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({
    Key? key,
    required this.hint,
    required this.prefixIcon,
    this.errorText = '',
    this.keyboardType = TextInputType.text,
    required this.onChangedCallback,
  }) : super(key: key);

  final String hint;
  final String errorText;

  final Widget prefixIcon;
  final TextInputType keyboardType;
  final Function(String) onChangedCallback;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: kIsWeb ? deviceSize.width * .2 : deviceSize.width,
          decoration: BoxDecoration(
            color: AppColors.lightGrey.withOpacity(.4),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            key: key,
            keyboardType: keyboardType,
            style: const TextStyle(fontSize: 15),
            decoration: InputDecoration(
              hintText: hint,
              // border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText.isNotEmpty ? Colors.red : Colors.transparent,
                  width: 1,
                ),
              ),
              // border: const OutlineInputBorder(
              //     borderSide: BorderSide(color: Colors.red, width: 5)),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.green,
                  width: .5,
                ),
              ),

              prefixIcon: prefixIcon,
            ),
            onChanged: (value) => onChangedCallback(value),
          ),
        ),
        errorText.isNotEmpty
            ? AppText(
                text: errorText,
                fontColor: Colors.red,
                fontWeight: FontWeight.w300,
              )
            : const SizedBox(),
      ],
    );
  }
}
