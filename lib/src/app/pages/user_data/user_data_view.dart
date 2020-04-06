import 'package:flutter/material.dart';
import 'package:frontent_internship_test/src/app/widgets/user_informations.dart';
import 'package:frontent_internship_test/src/domain/entities/user.dart';
import 'package:frontent_internship_test/src/app/widgets/container_user_data.dart';

class UserDataPage extends StatelessWidget {
  final User user;
  UserDataPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.navigate_before, size: 30.0, color: Colors.deepPurple), onPressed: () { Navigator.pop(context); }),
        title: Text("User Data", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ContainerUserData(user),
          UserInformations(user)
        ],
      ),
    );
  }
}