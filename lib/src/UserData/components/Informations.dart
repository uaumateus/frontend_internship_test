import 'package:flutter/material.dart';

class Informations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PersonalData()
      ],
    );
  }
}

class PersonalData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
          child: Text("PERSONAL DATA", style: TextStyle(color: Colors.black26),)
        ),
        Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 2.0),
                color: Colors.white,
                child: Padding(padding: const EdgeInsets.all(16.0),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 4,
                          child: Text("Email:", style: TextStyle(fontSize: 16))
                        ),
                        Expanded(flex: 6,
                          child: Text("mateus@gmail.com", textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                        ),
                      ],
                    ),
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2.0),
                color: Colors.white,
                child: Padding(padding: const EdgeInsets.all(16.0),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 4,
                          child: Text("Email:", style: TextStyle(fontSize: 16))
                        ),
                        Expanded(flex: 6,
                          child: Text("mateus@gmail.com", textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                        ),
                      ],
                    ),
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2.0),
                color: Colors.white,
                child: Padding(padding: const EdgeInsets.all(16.0),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 4,
                          child: Text("Email:", style: TextStyle(fontSize: 16))
                        ),
                        Expanded(flex: 6,
                          child: Text("mateus@gmail.com", textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                        ),
                      ],
                    ),
                  )
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}