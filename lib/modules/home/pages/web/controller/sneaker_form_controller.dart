import 'package:dale_poc/modules/home/domain/sneaker.dart';
import 'package:dale_poc/modules/home/repository/home_repository.dart';
import 'package:dale_poc/utils/debounce.dart';
import 'package:dale_poc/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'sneaker_form_controller.g.dart';

enum SneakerFormStatus {
  initial,
  invalidForm,
  validForm,
  loading,
  success,
  failure
}

class SneakerFormController = _SneakerFormControllerBase
    with _$SneakerFormController;

abstract class _SneakerFormControllerBase with Store {
  final _repository = Modular.get<HomeRepository>();
  final debouncer = Debouncer(delay: const Duration(milliseconds: 400));

  @observable
  SneakerFormStatus formStatus = SneakerFormStatus.initial;

  @observable
  String name = '';
  @observable
  String nameError = '';

  @observable
  String url = '';
  @observable
  String urlError = '';

  @observable
  String price = '';
  @observable
  String priceError = '';

  @observable
  String rating = '';
  @observable
  String ratingError = '';

  @observable
  bool hasUpdatedScreen = false;

  @observable
  Sneaker? sneaker;

  TextEditingController nameController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  @action
  onUpdatedFields(Sneaker sneaker) {
    this.sneaker = sneaker;
    nameController.text = sneaker.name;
    urlController.text = sneaker.imgUrl;
    priceController.text = sneaker.price.toString();
    ratingController.text = sneaker.rating.toString();

    name = sneaker.name;
    url = sneaker.imgUrl;
    price = sneaker.price.toString();
    rating = sneaker.rating.toString();
    hasUpdatedScreen = true;

    formStatus = SneakerFormStatus.validForm;
  }

  @action
  onNameChanged(String name) {
    debouncer.run(
      () {
        if (name.isValidFieldLength(length: 1)) {
          this.name = name;
          nameError = '';
          validateFields();
        } else {
          nameError = 'Preencha o Nome corretamente';
          validateFields();
        }
      },
    );
  }

  @action
  onUrlChanged(String url) {
    debouncer.run(
      () {
        if (url.isNotEmpty) {
          this.url = url;
          urlError = '';
          validateFields();
        } else {
          urlError = 'Preencha o campo com uma URL válida.';
          validateFields();
        }
      },
    );
  }

  @action
  onPriceChanged(String price) {
    debouncer.run(
      () {
        if (price.isNotEmpty && int.parse(price) > 100) {
          this.price = price;
          priceError = '';
          validateFields();
        } else {
          priceError = 'O preço do produto deve ser no mínimo \$100,00';
          validateFields();
        }
      },
    );
  }

  @action
  onRatingChanged(String rating) {
    debouncer.run(
      () {
        if (rating.isNotEmpty) {
          if (int.parse(rating) >= 0 && int.parse(rating) < 6) {
            this.rating = rating;
            ratingError = '';
            validateFields();
          }
        } else {
          ratingError = 'Insira uma avaliação entre 0 e 5.';
          validateFields();
        }
      },
    );
  }

  @action
  void validateFields() {
    if ((name.isNotEmpty && nameError.isEmpty) &&
        (url.isNotEmpty && urlError.isEmpty) &&
        (price.isNotEmpty && priceError.isEmpty) &&
        (rating.isNotEmpty && ratingError.isEmpty)) {
      formStatus = SneakerFormStatus.validForm;
    } else {
      formStatus = SneakerFormStatus.invalidForm;
    }
  }

  @action
  Future<String> onRegisterSneaker() async {
    return await Future.delayed(
      const Duration(seconds: 2),
      () async {
        if (formStatus == SneakerFormStatus.validForm) {
          formStatus = SneakerFormStatus.loading;

          final registerResult;

          Sneaker sneaker = Sneaker(
            name: name,
            imgUrl: url,
            price: double.parse(price),
            rating: int.parse(rating),
          );

          if (this.sneaker != null) {
            sneaker = sneaker.copyWith(id: this.sneaker!.id);
            registerResult = await _repository.updatedSneaker(sneaker);
          } else {
            registerResult = await _repository.registerSneaker(sneaker);
          }

          if (registerResult) {
            formStatus = SneakerFormStatus.success;
            return '';
          } else {
            formStatus = SneakerFormStatus.failure;
            validateFields();
            return 'Ocorreu um erro durante a requisição. Tente novamente mais tarde!';
          }
        } else {
          formStatus = SneakerFormStatus.failure;
          return 'Preencha os campos corretamente.';
        }
      },
    );
  }
}
