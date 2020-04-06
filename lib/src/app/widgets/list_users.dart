import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:frontent_internship_test/src/app/pages/user_data/user_data_view.dart';
import 'package:frontent_internship_test/src/app/pages/list_users/list_users_controller.dart';

class ListUsers extends StatefulWidget {
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    ListUsersController controller = FlutterCleanArchitecture.getController<ListUsersController>(context);
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: FutureBuilder(
            future: controller.storage.ready,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return controller.getAllUsers.length != 0 ? 
              ListView.builder(
                itemCount: controller.getAllUsers.length,
                itemBuilder: (context, index) {
                  final item = controller.getAllUsers[index];

                  return Material(
                    color: Colors.white,
                        child: InkWell(
                          child: ListTile(
                            leading: CircleAvatar(child: Text(item.name[0].toUpperCase() + item.name.split(" ")[1][0].toUpperCase()), radius: 25.0, foregroundColor: Colors.white, backgroundColor: Color(int.parse(item.color) << 0).withOpacity(1.0),),
                            title: Text(item.name),
                            subtitle: Text(item.email),
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UserDataPage(item)),
                              )
                            },
                          ),
                        ),
                    );
                  },
              )
              :
              Center(child: Text("No registered users"),);
            },
          ),
      
    );
  }

  
}
