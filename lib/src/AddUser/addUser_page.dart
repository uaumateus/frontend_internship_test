import 'package:flutter/material.dart';
import 'package:frontent_internship_test/src/AddUser/components/formUser.dart';

class AddUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: Colors.black,
        appBarTheme: AppBarTheme(color: Colors.white)
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.navigate_before, size: 30.0, color: Colors.deepPurple), onPressed: () { Navigator.pop(context); }),
          title: Text("Register New User", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
          elevation: 0,
          centerTitle: true,
        ),
        body: FormUser(),
      ),
    );
  }
}