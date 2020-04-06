import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:frontent_internship_test/src/domain/entities/user.dart';
import 'package:frontent_internship_test/src/domain/repositories/users_repository.dart';

class AddUserCase extends CompletableUseCase<AddUserCaseParams> {
  
  UsersRepository _usersRepository;

  AddUserCase(this._usersRepository);

  @override
  Future<Stream<User>> buildUseCaseStream(AddUserCaseParams params) async {
    final StreamController<User> controller = StreamController();
    try {
      await _usersRepository.addUser(
          user: params._user);
      controller.close();
    } catch (e) {
      logger.severe('RegisterUseCase unsuccessful.', e);
      controller.addError(e);
    }
    return controller.stream;
  }
}

class AddUserCaseParams {
  User _user;

  AddUserCaseParams(
      this._user
  );
}