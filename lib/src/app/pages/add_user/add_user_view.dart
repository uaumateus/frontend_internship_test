import 'package:frontent_internship_test/src/app/pages/list_users/list_users_view.dart';
import 'package:frontent_internship_test/src/app/widgets/form_user.dart';
import 'package:frontent_internship_test/src/data/repositories/data_users_repository.dart';
import './add_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddUserPage extends View {
  AddUserPage({Key key}) : super(key: key);

  @override
  _AddUserPageState createState() =>
      _AddUserPageState();
}

class _AddUserPageState extends ViewState<AddUserPage, AddUserController> {

  _AddUserPageState() : super(AddUserController(DataUsersRepository()));

  @override
  Widget buildPage() {
    return Scaffold(
      key:
        globalKey,
      appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.navigate_before, size: 30.0, color: Colors.deepPurple), 
          onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListUsersPage()),
          ); }),
          title: Text("Register New User", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
          elevation: 0,
          centerTitle: true,
      ),
      body: FormUser(),
    );
  }
}