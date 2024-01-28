import 'dart:ui';

import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/constants/app_images.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

showAppLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Dialog(
      backgroundColor: Colors.transparent,
      child: AppLoading(),
    ),
  );
}

class AppLoading extends StatefulWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  State<AppLoading> createState() => _AppLoadingState();
}

class _AppLoadingState extends State<AppLoading> with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final AnimationController rotateAnimationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    animationController.repeat(reverse: true);

    rotateAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    rotateAnimationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    animationController.dispose();
    rotateAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
      child: Container(
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
        child: FadeTransition(
          opacity: animationController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // RotationTransition(
              //   turns: Tween(begin: 0.0, end: 0.0)
              //       .animate(rotateAnimationController),
              //        animation: _controller,
              //   child: SizedBox(
              //     height: 70,
              //     width: 70,
              //     child: Image.asset(AppImages.logo),
              //   ),
              // ),
              AnimatedBuilder(
                animation: rotateAnimationController,
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.asset(AppImages.logo),
                ),
                builder: (_, child) {
                  return Transform.rotate(
                    angle: rotateAnimationController.value * 2 * math.pi,
                    child: child,
                  );
                },
              ),
              const SizedBox(height: 10),
              AppText(
                text: 'Carregando',
                fontColor: AppColors.green,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
