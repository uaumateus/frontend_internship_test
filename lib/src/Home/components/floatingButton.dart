import 'package:flutter/material.dart';
import 'package:frontent_internship_test/src/AddUser/addUser_page.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
     onPressed: () {
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddUser()),
      );
     },
     textColor: Colors.white,
     padding: const EdgeInsets.all(0.0),
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
     child: Container(
       decoration: const BoxDecoration(
         gradient: LinearGradient(
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
           colors: <Color>[
             Colors.blue,
             Colors.purple
           ],
         ),
         borderRadius: BorderRadius.all(Radius.circular(80.0))
       ),
       padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
       child: LabelFloating(),
     ),
   );
  }
}

class LabelFloating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      child: Row(
        children: <Widget>[
          Icon(Icons.add),
          Text("Add User")
        ],
      ),
    );
  }
}