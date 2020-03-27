import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontent_internship_test/src/UserData/userData_page.dart';

class ListUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(child: Text("MS"), radius: 25.0, foregroundColor: Colors.white, backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],),
            title: Text("User1"),
            subtitle: Text("mateus@gmail.com"),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserData()),
              )
            },
          ),
        ],
      ),
    );
  }
}