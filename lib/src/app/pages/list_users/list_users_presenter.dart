import 'package:frontent_internship_test/src/domain/entities/user.dart';
import 'package:frontent_internship_test/src/domain/repositories/users_repository.dart';
import 'package:frontent_internship_test/src/domain/usecases/get_all_users_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ListUsersPresenter extends Presenter {

  UsersRepository _usersRepository;
  GetAllUsersCase _getAllUsersCase;

  Function getAllUsersOnComplete;
  Function getAllUsersOnError;
  Function getAllUsersOnNext;

  ListUsersPresenter(this._usersRepository) {
    _getAllUsersCase = GetAllUsersCase(_usersRepository);
  }

  void getAllUsers()  => _getAllUsersCase.execute(_GetAllUsersCaseObserver(this));
  
  void dispose() {
    _getAllUsersCase.dispose();
  }
}

class _GetAllUsersCaseObserver implements Observer<List<User>> {
  ListUsersPresenter _listUsersPresenter;

  _GetAllUsersCaseObserver(this._listUsersPresenter);

  @override
  void onNext(listUsers) {
    assert(listUsers is List<User>);
    assert(_listUsersPresenter.getAllUsersOnNext != null);
    _listUsersPresenter.getAllUsersOnNext(listUsers);
  }

  @override
  void onComplete() {   
    assert(_listUsersPresenter.getAllUsersOnComplete != null);
    _listUsersPresenter.getAllUsersOnComplete();
  }

  @override
  void onError(e) {    
    assert(_listUsersPresenter.getAllUsersOnError != null);
    _listUsersPresenter.getAllUsersOnNext(e);
  }
}