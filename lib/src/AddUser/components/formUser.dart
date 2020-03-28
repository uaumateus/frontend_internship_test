import 'package:flutter/material.dart';
import 'package:frontent_internship_test/models/user.dart';
import 'package:frontent_internship_test/src/Home/home_page.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';
import 'dart:math';

class FormUser extends StatefulWidget {
  FormUser({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FormUserState createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final LocalStorage storage = new LocalStorage('app');
  User user = new User();
  bool active = false;

  void _submitForm() {
    final FormState form = _formKey.currentState;
    
    var items = storage.getItem('users');

    if (!form.validate()) {
      print('Form is not valid!  Please review and correct.');
    } else {
      if(items == null){
        List<User> save = [user];
        String jsonUsers = jsonEncode(save);
        storage.setItem('users', jsonUsers);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }else{
        List<dynamic> save = jsonDecode(items);
        save.add(user);
        String jsonUsers = jsonEncode(save);
        storage.setItem('users', jsonUsers);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    }
  }

  void buttonActive(){
    if(user.name.isNotEmpty && 
    user.email.isNotEmpty && 
    user.phone.isNotEmpty && 
    user.date.isNotEmpty && 
    user.cpf.isNotEmpty && 
    user.cep.toString().isNotEmpty && 
    user.street.isNotEmpty && 
    user.numberHouse.toString().isNotEmpty &&
    user.district.isNotEmpty &&
    user.city.isNotEmpty &&
    user.state.isNotEmpty)
      setState(() {
        active = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
                      child: Text("PERSONAL DATA", style: TextStyle(color: Colors.black26),)
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: TextFormField(decoration: InputDecoration(
                              labelText: "Name",
                              border: OutlineInputBorder(),
                              hintText: "Name",
                            ),
                            onSaved: (val) => user.name = val,
                            onChanged: (text) { user.name = text; buttonActive(); },
                            )
                          ),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: TextFormField(decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(),
                              hintText: "Email",
                            ),
                            onSaved: (val) => user.email = val,
                            onChanged: (text) { user.email = text; buttonActive(); },
                            )
                          ),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: TextFormField(decoration: InputDecoration(
                              labelText: "Phone",
                              border: OutlineInputBorder(),
                              hintText: "Phone",
                            ),
                            onSaved: (val) => user.phone = val,
                            onChanged: (text) { user.phone = text; buttonActive(); },
                            )
                          ),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: TextFormField(decoration: InputDecoration(
                              labelText: "Date of Birth",
                              border: OutlineInputBorder(),
                              hintText: "Date of Birth",
                            ),
                            onSaved: (val) => user.date = val,
                            onChanged: (text) { user.date = text; buttonActive(); },
                            )
                          ),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: TextFormField(decoration: InputDecoration(
                              labelText: "CPF",
                              border: OutlineInputBorder(),
                              hintText: "CPF",
                            ),
                            onSaved: (val) => user.cpf = val,
                            onChanged: (text) { user.cpf = text; buttonActive(); },
                            )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
                      child: Text("ADDRESS DATA", style: TextStyle(color: Colors.black26),)
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: TextFormField(decoration: InputDecoration(
                              labelText: "CEP",
                              border: OutlineInputBorder(),
                              hintText: "CEP",
                            ),
                            onSaved: (val) => user.cep = val,
                            onChanged: (text) { user.cep = text; buttonActive(); },)
                          ),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: TextFormField(decoration: InputDecoration(
                              labelText: "Street",
                              border: OutlineInputBorder(),
                              hintText: "Street",
                            ),
                            onSaved: (val) => user.street = val,
                            onChanged: (text) { user.street = text; buttonActive(); },)
                          ),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: TextFormField(decoration: InputDecoration(
                              labelText: "Number",
                              border: OutlineInputBorder(),
                              hintText: "Number",
                            ),
                            onSaved: (val) => user.numberHouse = val,
                            onChanged: (text) { user.numberHouse = text; buttonActive(); },)
                          ),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: TextFormField(decoration: InputDecoration(
                              labelText: "Complement",
                              border: OutlineInputBorder(),
                              hintText: "Complement",
                            ),
                            onSaved: (val) => user.complement = val,
                            onChanged: (text) { user.complement = text; buttonActive(); },)
                          ),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: TextFormField(decoration: InputDecoration(
                              labelText: "District",
                              border: OutlineInputBorder(),
                              hintText: "District",
                            ),
                            onSaved: (val) => user.district = val,
                            onChanged: (text) { user.district = text; buttonActive(); },)
                          ),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: TextFormField(decoration: InputDecoration(
                              labelText: "City",
                              border: OutlineInputBorder(),
                              hintText: "City",
                            ),
                            onSaved: (val) => user.city = val,
                            onChanged: (text) { user.city = text; buttonActive(); },)
                          ),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: TextFormField(decoration: InputDecoration(
                              labelText: "State",
                              border: OutlineInputBorder(),
                              hintText: "State",
                            ),
                            onSaved: (val) => user.state = val,
                            onChanged: (text) { user.state = text; buttonActive(); },)
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: MaterialButton(
              color: Colors.blue,
              padding: EdgeInsets.all(0),
              onPressed:  active ? _submitForm : () => {},
              textColor: Colors.white,
              child: active ? 
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.greenAccent,
                        Colors.green
                      ],
                    ),
                  ),
                  child: Row(children: <Widget>[
                              Expanded(child: Icon(Icons.check, color: Colors.white,), flex: 1,),
                              Expanded(child: 
                                Text("REGISTER USER", 
                                      textAlign: TextAlign.center, 
                                      textScaleFactor: 1.3,
                                      style: TextStyle(color: Colors.white)), 
                                    flex: 9)
                            ],),
                ) 
                :
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.grey,
                  child: Row(children: <Widget>[
                              Expanded(child: Icon(Icons.check, color: Colors.white,), flex: 1,),
                              Expanded(child: 
                                Text("REGISTER USER", 
                                      textAlign: TextAlign.center, 
                                      textScaleFactor: 1.3,
                                      style: TextStyle(color: Colors.white)), 
                                    flex: 9)
                            ],),
                ) 
            )
            
          )
        ],
      ),
    );
  }
}


