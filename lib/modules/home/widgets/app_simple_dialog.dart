import 'dart:async';

import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/modules/home/domain/sneaker.dart';
import 'package:dale_poc/modules/home/pages/web/controller/sneaker_form_controller.dart';
import 'package:dale_poc/widgets/app_base_dialog.dart';
import 'package:dale_poc/widgets/app_button.dart';
import 'package:dale_poc/widgets/app_loading.dart';
import 'package:dale_poc/widgets/app_success_dialog.dart';
import 'package:dale_poc/widgets/app_text.dart';
import 'package:dale_poc/widgets/app_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future showSimpleDialog({
  required BuildContext context,
  Sneaker? sneaker,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return SimpleDialog(
        sneaker: sneaker,
      );
    },
  );
}

class CloseDialog extends StatelessWidget {
  const CloseDialog({
    Key? key,
    required this.hasHeightLimit,
    this.backgroundColor,
    this.dialogWidth,
    this.dialogHeight,
    required this.child,
  }) : super(key: key);

  final bool hasHeightLimit;
  final Color? backgroundColor;
  final double? dialogWidth;
  final double? dialogHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return BaseDialog(
      hasHeightLimit: hasHeightLimit,
      height: dialogHeight ?? deviceHeight * .55,
      width: dialogWidth ?? deviceWidth * .4,
      backgroundColor: backgroundColor,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topRight,
        children: [
          child,
          IconButton(
            icon: const Icon(
              Icons.close,
              size: 24,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class SimpleDialog extends StatelessWidget {
  SimpleDialog({
    Key? key,
    this.sneaker,
  }) : super(key: key);

  final Sneaker? sneaker;
  final controller = Modular.get<SneakerFormController>();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    if (sneaker != null) {
      if (!controller.hasUpdatedScreen) {
        controller.onUpdatedFields(sneaker!);
      }
    }

    return CloseDialog(
      backgroundColor: AppColors.backgroundGray,
      hasHeightLimit: true,
      child: Observer(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: sneaker == null
                    ? 'Cadastrar novo Tênis '
                    : 'Editar informações do Tênis',
                fontColor: AppColors.green,
                fontSize: 25,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: kIsWeb
                                  ? EdgeInsets.zero
                                  : const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppTextfield(
                                    controller: controller.urlController,
                                    hint: 'Url da foto',
                                    // initialValue: sneaker?.imgUrl,
                                    keyboardType: TextInputType.text,
                                    errorText: controller.urlError,
                                    prefixIcon: const Icon(
                                      Icons.link,
                                      color: Colors.grey,
                                    ),
                                    onChangedCallback: (value) =>
                                        controller.onUrlChanged(value),
                                  ),
                                  const SizedBox(height: 10),
                                  AppTextfield(
                                    controller: controller.nameController,
                                    hint: 'Nome',
                                    // initialValue: sneaker?.name,
                                    keyboardType: TextInputType.text,
                                    errorText: controller.nameError,
                                    prefixIcon: const Icon(
                                      Icons.web,
                                      color: Colors.grey,
                                    ),
                                    onChangedCallback: (value) =>
                                        controller.onNameChanged(value),
                                  ),
                                  const SizedBox(height: 10),
                                  AppTextfield(
                                    controller: controller.priceController,
                                    hint: 'Preço',
                                    // initialValue: sneaker?.price.toString(),
                                    keyboardType: TextInputType.number,
                                    errorText: controller.priceError,
                                    prefixIcon: const Icon(
                                      Icons.attach_money,
                                      color: Colors.grey,
                                    ),
                                    onChangedCallback: (value) =>
                                        controller.onPriceChanged(value),
                                  ),
                                  const SizedBox(height: 10),
                                  AppTextfield(
                                    controller: controller.ratingController,
                                    hint: 'Avaliações',
                                    // initialValue: sneaker?.rating.toString(),
                                    keyboardType: TextInputType.text,
                                    errorText: controller.ratingError,
                                    prefixIcon: const Icon(
                                      Icons.text_fields,
                                      color: Colors.grey,
                                    ),
                                    onChangedCallback: (value) =>
                                        controller.onRatingChanged(value),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        const AppText(
                          text: 'Pré-visualização da imagem',
                          fontColor: AppColors.green,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: deviceSize.height * .15,
                          width: deviceSize.width * .1,
                          child: Image.network(controller.url),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              AppButton(
                text: sneaker != null ? 'Atualizar' : 'Cadastrar',
                width: kIsWeb ? deviceSize.width * .15 : deviceSize.width * .9,
                height:
                    kIsWeb ? deviceSize.height * .06 : deviceSize.height * .07,
                backgroudColor: AppColors.green,
                enable: true,
                onPressedCallback: () async {
                  showAppLoading(context);
                  final result = await controller.onRegisterSneaker();

                  if (result.isEmpty) {
                    if (context.mounted) {
                      Modular.to.pop();
                      await showAutoCloseSuccessDialog(
                        context,
                        sneaker != null
                            ? 'Informações atualizadas com sucesso'
                            : 'Tênis cadastrado com sucesso!',
                      );
                      Modular.to.pop(true);
                    }
                  } else {
                    if (context.mounted) {
                      Modular.to.pop();
                      await showAutoCloseSuccessDialog(
                        context,
                        result,
                      );
                    }
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
