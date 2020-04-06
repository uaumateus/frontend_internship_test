import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:flutter/material.dart';
import 'package:frontent_internship_test/src/app/pages/list_users/list_users_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterCleanArchitecture.debugModeOn();
    return MaterialApp(
      title: 'User List',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.white
        )
      ),
      home: ListUsersPage(),
    );
  }
}