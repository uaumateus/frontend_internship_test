import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:frontent_internship_test/src/domain/entities/user.dart';
import 'package:frontent_internship_test/src/domain/repositories/users_repository.dart';

class GetAllUsersCase extends UseCase<List<User>, void> {
  UsersRepository _usersRepository;
  GetAllUsersCase(this._usersRepository);

  @override
  Future<Stream<List<User>>> buildUseCaseStream(void ignore) async {
    final StreamController<List<User>> controller = StreamController();
    try {
      List<User> users = await _usersRepository.getAllUsers();
      controller.add(users);
      controller.close();
    } catch (e) {
      logger.severe('Get All Users unsuccessful.', e);
      controller.addError(e);
    }
    return controller.stream;
  }
}