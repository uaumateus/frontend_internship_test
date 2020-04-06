import 'package:flutter/material.dart';
import 'package:frontent_internship_test/src/domain/entities/user.dart';

class ContainerUserData extends StatelessWidget {
  final User user;
  ContainerUserData(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CircleAvatar(child: Text(user.name[0].toUpperCase() + user.name.split(" ")[1][0].toUpperCase(), style: TextStyle(fontSize: 50.0),), radius: 60.0, foregroundColor: Colors.white, backgroundColor: Color(int.parse(user.color) << 0).withOpacity(1.0),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(user.name, style: TextStyle(fontSize: 25.0),),
          )
        ],
      ),
    );
  }
}