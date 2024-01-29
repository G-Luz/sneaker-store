import 'package:dale_poc/modules/authentication/domain/user.dart';
import 'package:dale_poc/repositories/client/client_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'authentication_repository.g.dart';

class AuthenticationRepository = AuthenticationRepositoryBase
    with _$AuthenticationRepository;

abstract class AuthenticationRepositoryBase with Store {
  final _client = Modular.get<ClientRepository>();

  Future<bool> registerNewUser(User user) async {
    final result = await _client.post(
      endpoint: '/users',
      bodyMapper: user.toJson(),
    );
    return result != null;
  }

  Future<User?> findUserByEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _client.post(
        endpoint: '/auth/login',
        bodyMapper: {
          'users_email': email,
          'users_password': password,
        },
      );

      if (result != null) {
        if (result.data != null && result.data.length > 0) {
          print('Response: ${result.data}');
          return User.fromJson(result.data.first);
        }
      }
    } on Exception {
      return null;
    }
    return null;
  }
}
