import 'package:flutter/material.dart';

class ContainerTopUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CircleAvatar(child: Text("MS", style: TextStyle(fontSize: 50.0),), radius: 60.0, foregroundColor: Colors.white, backgroundColor: Colors.purple,),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Mateus Santos", style: TextStyle(fontSize: 25.0),),
          )
        ],
      ),
    );
  }
}