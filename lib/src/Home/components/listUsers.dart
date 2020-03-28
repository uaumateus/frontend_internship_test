import 'dart:math';
import 'package:flutter/material.dart';
import 'package:frontent_internship_test/models/user.dart';
import 'package:frontent_internship_test/src/UserData/userData_page.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

class ListUsers extends StatefulWidget {
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  List<User> users = new List<User>();
  final LocalStorage storage = new LocalStorage('app');
  bool initialized = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: FutureBuilder(
            future: storage.ready,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!initialized) {
                var items = storage.getItem('users');
                if (jsonDecode(items) != null) {
                  (jsonDecode(items) as List).forEach((item) {
                    final todoItem =
                        new User(name: item['name'], email: item['email']);
                    users.add(todoItem);
                  });
                }

                initialized = true;
              }
              return ListView(
                children: <Widget>[
                  for (var item in users)
                    ListTile(
                      leading: CircleAvatar(child: Text(item.name[0].toUpperCase() + item.name.split(" ")[1][0].toUpperCase()), radius: 25.0, foregroundColor: Colors.white, backgroundColor: Color(int.parse(item.color) << 0).withOpacity(1.0),),
                      title: Text(item.name),
                      subtitle: Text(item.email),
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserData()),
                        )
                      },
                    ),
                ],
              );
            },
          ),
      
    );
  }
}