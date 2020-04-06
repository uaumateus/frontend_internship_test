import 'package:frontent_internship_test/src/domain/entities/user.dart';
import 'package:frontent_internship_test/src/domain/repositories/users_repository.dart';
import 'package:frontent_internship_test/src/domain/usecases/add_user_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/foundation.dart';

class AddUserPresenter extends Presenter {

  UsersRepository _usersRepository;
  AddUserCase _addUserCase;

  Function addUserOnNext;
  Function addUserOnComplete;
  Function addUserOnError;

  AddUserPresenter(this._usersRepository) {
    _addUserCase = AddUserCase(_usersRepository);
  }

  void addUser(@required User user) {
    _addUserCase.execute(_AddUserCaseObserver(this), AddUserCaseParams(user));
  }

  @override
  void dispose() {
    _addUserCase.dispose();
  }
}
  
  class _AddUserCaseObserver implements Observer<void> {
    AddUserPresenter _addUserPresenter;

    _AddUserCaseObserver(this._addUserPresenter);

    void onNext(ignore) {
      assert(_addUserPresenter.addUserOnNext != null);
      _addUserPresenter.addUserOnNext();
    }

    void onComplete() {
      assert(_addUserPresenter.addUserOnComplete != null);
      _addUserPresenter.addUserOnComplete();
    }

    void onError(e) {
      assert(_addUserPresenter.addUserOnError != null);
        _addUserPresenter.addUserOnError(e);
    }
}