import 'package:dale_poc/modules/home/domain/helper/sneaker_helper.dart';
import 'package:dale_poc/modules/home/domain/sneaker.dart';
import 'package:dale_poc/repositories/client/client_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_repository.g.dart';

class HomeRepository = _HomeRepositoryBase with _$HomeRepository;

abstract class _HomeRepositoryBase with Store {
  final _client = Modular.get<ClientRepository>();

  Future<bool> registerSneaker(Sneaker sneaker) async {
    final result = await _client.post(
      endpoint: '/sneakers',
      bodyMapper: sneaker.toJson(),
    );
    return result != null;
  }

  Future<List<Sneaker>?> retrieveSneakerList() async {
    try {
      return await _client.getLists(
        endpoint: '/sneakers',
        listMapper: SneakerHelper.mapToListSneakers,
      );
    } on Exception catch (e) {
      print('algum erro???: $e');
      return null;
    }
  }

  Future<bool> updatedSneaker(Sneaker sneaker) async {
    final result = await _client.patch(
      endpoint: '/sneakers/${sneaker.id}',
      bodyMapper: sneaker.toJson(),
    );
    return result != null;
  }
}
