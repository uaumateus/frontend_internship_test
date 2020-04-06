// import './home_presenter.dart';
import 'package:frontent_internship_test/src/app/pages/add_user/add_user_view.dart';
import 'package:frontent_internship_test/src/app/pages/list_users/list_users_presenter.dart';
import 'package:localstorage/localstorage.dart';

import '../../../domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ListUsersController extends Controller {
  ListUsersPresenter _listUsersPresenter;
  List<User> users = new List<User>();
  final LocalStorage storage = new LocalStorage('app');
  bool initialized;
  List<User> _getAllUsers;
  List<User> get getAllUsers => _getAllUsers;

  ListUsersController(authRepo)
      : _listUsersPresenter = ListUsersPresenter(authRepo) {
    _getAllUsers = List<User>();
    initialized = false;
    retrieveData();
    initListeners();
  }

  void initListeners() {
    _listUsersPresenter.getAllUsersOnNext =
        (List<User> allUsers) {
      _getAllUsers = allUsers;
      refreshUI();
    };
    _listUsersPresenter.getAllUsersOnComplete = () {
      refreshUI();
    };
    _listUsersPresenter.getAllUsersOnError = (e) {
      ScaffoldState state = getState();
      state.showSnackBar(SnackBar(content: Text(e.message)));
      refreshUI();
    };
  }

  @override
  void dispose() {
    _listUsersPresenter.dispose();
    super.dispose();
  }

  void retrieveData() {
    _listUsersPresenter.getAllUsers();
  }

  void floatingButtonPressed(context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddUserPage()),
    );
  }
}