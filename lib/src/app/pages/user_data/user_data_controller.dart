// import './home_presenter.dart';
import 'package:frontent_internship_test/src/app/pages/add_user/add_user_view.dart';
import 'package:frontent_internship_test/src/app/pages/list_users/list_users_presenter.dart';
import 'package:frontent_internship_test/src/domain/repositories/users_repository.dart';
import 'package:localstorage/localstorage.dart';

import '../../../domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UserDataController extends Controller {
  // UserDataPresenter _userDataPresenter;

  // UserDataController(authRepo)
  //     : _userDataPresenter = UserDataPresenter(authRepo) {

  // }

  void initListeners() {
  }

  @override
  void dispose() {
    // _userDataPresenter.dispose();
    super.dispose();
  }
}