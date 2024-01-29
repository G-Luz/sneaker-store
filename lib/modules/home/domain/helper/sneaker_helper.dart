import 'package:dale_poc/modules/home/domain/sneaker.dart';

class SneakerHelper {
  static List<Sneaker> mapToListSneakers(List<dynamic> responseList) {
    return responseList
        .map((item) => Sneaker.fromJson(item))
        .toList(growable: false);
  }
}
