import 'package:frontent_internship_test/src/app/widgets/floating_button.dart';
import 'package:frontent_internship_test/src/app/widgets/list_users.dart';
import 'package:frontent_internship_test/src/data/repositories/data_users_repository.dart';

import './list_users_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
// import '../../../data/repositories/data_users_repository.dart';

class ListUsersPage extends View {
  ListUsersPage({Key key}) : super(key: key);

  @override
  _ListUsersPageState createState() =>
      // inject dependencies inwards
      _ListUsersPageState();
}

class _ListUsersPageState extends ViewState<ListUsersPage, ListUsersController> {

  _ListUsersPageState() : super(ListUsersController(DataUsersRepository()));

  @override
  Widget buildPage() {
    return Scaffold(
      key:
        globalKey,
      appBar: AppBar(
        title: Text("User List", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingButton(),
      body: ListUsers()
    );
  }
}