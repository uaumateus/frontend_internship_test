import 'package:flutter/material.dart';
import 'package:frontent_internship_test/src/Home/components/floatingButton.dart';
import 'package:frontent_internship_test/src/Home/components/listUsers.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("User List"),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingButton(),
        body: ListUsers(),
      ),
    );
  }
}