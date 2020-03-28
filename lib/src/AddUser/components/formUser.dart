import 'package:flutter/material.dart';
import 'package:frontent_internship_test/models/user.dart';
import 'package:frontent_internship_test/src/Home/home_page.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

class FormUser extends StatefulWidget {
  @override
  _FormUserState createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final LocalStorage storage = new LocalStorage('app');

  User user = new User();
  bool _active = false;
  bool _validate = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dateController = TextEditingController();
  final _cpfController = TextEditingController();
  final _cepController = TextEditingController();
  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _complementController = TextEditingController();
  final _districtController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();

  bool _isFieldEmptyName = false;
  bool _isFieldEmptyEmail = false;
  bool _isFieldEmptyPhone = false;
  bool _isFieldEmptyDate = false;
  bool _isFieldEmptyCpf = false;
  bool _isFieldEmptyCep = false;
  bool _isFieldEmptyStreet = false;
  bool _isFieldEmptyNumber = false;
  bool _isFieldEmptyComplement = false;
  bool _isFieldEmptyDistrict = false;
  bool _isFieldEmptyCity = false;
  bool _isFieldEmptyState = false;

  void _submitForm() {
    var items = storage.getItem('users');

    setState((){
      //Primary Colors Material Design
      user.color = (["16007990", "15277667", "10233776", "6765239", "4149685", "2201331", "48340", "38536", "5025616", "13491257", "16761095", "16750592", "607D8B"]..shuffle()).first;
    });

    if (!_formKey.currentState.validate()) {
      setState(() {
        _validate = true;
      });
    } else {
      _formKey.currentState.save();
      
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
    if(user.name != null && 
        user.email != null && 
        user.phone != null && 
        user.date != null && 
        user.cpf != null && 
        user.cep != null && 
        user.street != null && 
        user.numberHouse != null &&
        user.district != null &&
        user.city != null &&
        user.state != null)
          setState(() {
            _active = true;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: _validate,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              child: Column(
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
                                suffixIcon: Visibility(
                                  visible: _isFieldEmptyName,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    _isFieldEmptyName = false;
                                    _nameController.clear();
                                  });},),
                                )
                              ),
                              keyboardType: TextInputType.text,
                              validator: (String val){
                                if(val.split(" ").length == 1)
                                  return "Name and surname";
                                else if(val.isEmpty)
                                  return "Required field";
                                else return null;
                              },
                              controller: _nameController,
                              onTap: (){ setState(() { _isFieldEmptyName = true;});},
                              onSaved: (val) => user.name = val,
                              onChanged: (text) { user.name = text; buttonActive(); },
                              )
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: TextFormField(decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(),
                                hintText: "Email",
                                suffixIcon: Visibility(
                                  visible: _isFieldEmptyEmail,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    _isFieldEmptyEmail = false;
                                    _emailController.clear();
                                  });},),
                                )
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (String val){
                                if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val))
                                  return "Email inválido";
                                else if(val.isEmpty)
                                  return "Required field";
                                else return null;
                              },
                              controller: _emailController,
                              onTap: (){ setState(() { _isFieldEmptyEmail = true;});},
                              onSaved: (val) => user.email = val,
                              onChanged: (text) { user.email = text; buttonActive(); },
                              )
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: TextFormField(decoration: InputDecoration(
                                labelText: "Phone",
                                border: OutlineInputBorder(),
                                hintText: "Phone",
                                suffixIcon: Visibility(
                                  visible: _isFieldEmptyPhone,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    _isFieldEmptyPhone = false;
                                    _phoneController.clear();
                                  });},),
                                )
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (String val){
                                if(!RegExp(r'\(\d{2,}\)\d{4,}\-\d{4}').hasMatch(val))
                                  return "Format (00)00000-0000";
                                else return null;
                              },
                              controller: _phoneController,
                              onTap: (){ setState(() { _isFieldEmptyPhone = true;});},
                              onSaved: (val) => user.phone = val,
                              onChanged: (text) { user.phone = text; buttonActive(); },
                              )
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: TextFormField(decoration: InputDecoration(
                                labelText: "Date of Birth",
                                border: OutlineInputBorder(),
                                hintText: "Date of Birth",
                                suffixIcon: Visibility(
                                  visible: _isFieldEmptyDate,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    _isFieldEmptyDate = false;
                                    _dateController.clear();
                                  });},),
                                ),
                              ),
                              keyboardType: TextInputType.datetime,
                              validator: (String val){
                                if(val == "null")
                                  return "Required field";
                                else return null;
                              },
                              controller: _dateController,
                              onTap: () async { 
                                setState(() { _isFieldEmptyDate = true;});
                                DateTime date = DateTime(1900);
                                FocusScope.of(context).requestFocus(new FocusNode());

                                date = await showDatePicker(
                                              context: context, 
                                              initialDate:DateTime.now(),
                                              firstDate:DateTime(1900),
                                              lastDate: DateTime(2100));

                                _dateController.text = date.toString().split(" ")[0];
                                user.date = date.toString().split(" ")[0];
                              },
                              onSaved: (val) => user.date = val,
                              )
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: TextFormField(decoration: InputDecoration(
                                labelText: "CPF",
                                border: OutlineInputBorder(),
                                hintText: "CPF",
                                suffixIcon: Visibility(
                                  visible: _isFieldEmptyCpf,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    _isFieldEmptyCpf = false;
                                    _cpfController.clear();
                                  });},),
                                )
                              ),
                              validator: (String val) {
                                if(!RegExp(r"([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})").hasMatch(val))
                                  return "Format 000.000.000-00";
                                else return null;
                              },
                              controller: _cpfController,
                              onTap: (){ setState(() { _isFieldEmptyCpf = true;});},
                              keyboardType: TextInputType.phone,
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
                                suffixIcon: Visibility(
                                  visible: _isFieldEmptyCep,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    _isFieldEmptyCep = false;
                                    _cepController.clear();
                                  });},),
                                )
                              ),
                              validator: (String val) {
                                if(!RegExp(r'^[0-9]{5}-[0-9]{3}$').hasMatch(val))
                                  return "Format 00000-000";
                                else
                                  return null;
                              },
                              controller: _cepController,
                              onTap: (){ setState(() { _isFieldEmptyCep = true;});},
                              keyboardType: TextInputType.phone,
                              onSaved: (val) => user.cep = val,
                              onChanged: (text) { user.cep = text; buttonActive(); },)
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: TextFormField(decoration: InputDecoration(
                                labelText: "Street",
                                border: OutlineInputBorder(),
                                hintText: "Street",
                                suffixIcon: Visibility(
                                  visible: _isFieldEmptyStreet,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    _isFieldEmptyStreet = false;
                                    _streetController.clear();
                                  });},),
                                )
                              ),
                              validator: (String val) {
                                if(val.isEmpty)
                                  return "Required field";
                                else
                                  return null;
                              },
                              controller: _streetController,
                              onTap: (){ setState(() { _isFieldEmptyStreet = true;});},
                              keyboardType: TextInputType.text,
                              onSaved: (val) => user.street = val,
                              onChanged: (text) { user.street = text; buttonActive(); },)
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 4,
                                  child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                    child: TextFormField(decoration: InputDecoration(
                                      labelText: "Number",
                                      border: OutlineInputBorder(),
                                      hintText: "Number",
                                      suffixIcon: Visibility(
                                        visible: _isFieldEmptyNumber,
                                        child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                          _isFieldEmptyNumber = false;
                                          _numberController.clear();
                                        });},),
                                      )
                                    ),
                                    validator: (String val) {
                                      if(!RegExp(r'(^[0-9]*$)').hasMatch(val))
                                        return "Only numbers";
                                      else
                                        return null;
                                    },
                                    controller: _numberController,
                                    onTap: (){ setState(() { _isFieldEmptyNumber = true;});},
                                    keyboardType: TextInputType.number,
                                    onSaved: (val) => user.numberHouse = val,
                                    onChanged: (text) { user.numberHouse = text; buttonActive(); },)
                                  ),
                                ),
                                Flexible(
                                  flex: 6,
                                  child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                    child: TextFormField(decoration: InputDecoration(
                                      labelText: "Complement",
                                      border: OutlineInputBorder(),
                                      hintText: "Complement",
                                      suffixIcon: Visibility(
                                        visible: _isFieldEmptyComplement,
                                        child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                          _isFieldEmptyComplement = false;
                                          _complementController.clear();
                                        });},),
                                      )
                                    ),
                                    controller: _complementController,
                                    onTap: (){ setState(() { _isFieldEmptyComplement = true;});},
                                    keyboardType: TextInputType.text,
                                    onSaved: (val) => user.complement = val,
                                    onChanged: (text) { user.complement = text; buttonActive(); },)
                                  ),
                                )
                              ],
                            ),
                            
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: TextFormField(decoration: InputDecoration(
                                labelText: "District",
                                border: OutlineInputBorder(),
                                hintText: "District",
                                suffixIcon: Visibility(
                                  visible: _isFieldEmptyDistrict,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    _isFieldEmptyDistrict = false;
                                    _districtController.clear();
                                  });},),
                                )
                              ),
                              validator: (String val) {
                                if(val.isEmpty)
                                  return "Required field";
                                else
                                  return null;
                              },
                              controller: _districtController,
                              onTap: (){ setState(() { _isFieldEmptyDistrict = true;});},
                              keyboardType: TextInputType.text,
                              onSaved: (val) => user.district = val,
                              onChanged: (text) { user.district = text; buttonActive(); },)
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: TextFormField(decoration: InputDecoration(
                                labelText: "City",
                                border: OutlineInputBorder(),
                                hintText: "City",
                                suffixIcon: Visibility(
                                  visible: _isFieldEmptyCity,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    _isFieldEmptyCity = false;
                                    _cityController.clear();
                                  });},),
                                )
                              ),
                              validator: (String val) {
                                if(val.isEmpty)
                                  return "Required field";
                                else
                                  return null;
                              },
                              controller: _cityController,
                              onTap: (){ setState(() { _isFieldEmptyCity = true;});},
                              keyboardType: TextInputType.text,
                              onSaved: (val) => user.city = val,
                              onChanged: (text) { user.city = text; buttonActive(); },)
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: TextFormField(decoration: InputDecoration(
                                labelText: "State",
                                border: OutlineInputBorder(),
                                hintText: "State",
                                suffixIcon: Visibility(
                                  visible: _isFieldEmptyState,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    _isFieldEmptyState = false;
                                    _stateController.clear();
                                  });},),
                                )
                              ),
                              validator: (String val) {
                                if(val.isEmpty)
                                  return "Required field";
                                else
                                  return null;
                              },
                              controller: _stateController,
                              onTap: (){ setState(() { _isFieldEmptyState = true;});},
                              keyboardType: TextInputType.text,
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
          ),
          Expanded(
            flex: 1,
            child: MaterialButton(
              color: Colors.blue,
              padding: EdgeInsets.all(0),
              onPressed:  _active ? _submitForm : () => {},
              textColor: Colors.white,
              child: _active ? 
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


