import 'package:flutter/material.dart';
import 'package:frontent_internship_test/models/user.dart';
import 'package:frontent_internship_test/src/Home/home_page.dart';
import 'package:localstorage/localstorage.dart';
import 'package:masked_text/masked_text.dart';
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
  final _textCPFController = TextEditingController();

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
                              onSaved: (val) => user.name = val,
                              onChanged: (text) { user.name = text; buttonActive(); setState(() { _isFieldEmptyName = true;});},
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
                              onSaved: (val) => user.email = val,
                              onChanged: (text) { user.email = text; buttonActive(); setState(() { _isFieldEmptyEmail = true;});},
                              )
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: MaskedTextField(
                                maskedTextFieldController: _phoneController,
                                escapeCharacter: '#',
                                mask: "(##) # ####-####",
                                maxLength: 16,
                                keyboardType: TextInputType.phone,
                                inputDecoration: new InputDecoration(
                                  counterText: "",
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
                                onChange: (text) { user.phone = text; buttonActive(); setState(() { _isFieldEmptyPhone = true;});},
                              ),
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
                              child: MaskedTextField(
                                maskedTextFieldController: _cpfController,
                                escapeCharacter: '#',
                                mask: "###.###.###-##",
                                maxLength: 14,
                                keyboardType: TextInputType.number,
                                inputDecoration: new InputDecoration(
                                  labelText: "CPF",
                                  counterText: "",
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
                                onChange: (text) { user.cpf = text; buttonActive(); setState(() { _isFieldEmptyCpf = true;});},
                              ),
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
                              child: MaskedTextField(
                                maskedTextFieldController: _cepController,
                                escapeCharacter: '#',
                                mask: "#####-###",
                                maxLength: 9,
                                keyboardType: TextInputType.number,
                                inputDecoration: new InputDecoration(
                                  labelText: "CEP",
                                  counterText: "",
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
                                onChange: (text) { user.cep = text; buttonActive(); setState(() { _isFieldEmptyCep = true;});},
                              ),
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
                              keyboardType: TextInputType.text,
                              onSaved: (val) => user.street = val,
                              onChanged: (text) { user.street = text; buttonActive(); setState(() { _isFieldEmptyStreet = true;});},)
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
                                    keyboardType: TextInputType.number,
                                    onSaved: (val) => user.numberHouse = val,
                                    onChanged: (text) { user.numberHouse = text; buttonActive(); setState(() { _isFieldEmptyNumber = true;});},)
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
                                    keyboardType: TextInputType.text,
                                    onSaved: (val) => user.complement = val,
                                    onChanged: (text) { user.complement = text; buttonActive(); setState(() { _isFieldEmptyComplement = true;});},)
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
                              keyboardType: TextInputType.text,
                              onSaved: (val) => user.district = val,
                              onChanged: (text) { user.district = text; buttonActive(); setState(() { _isFieldEmptyDistrict = true;});},)
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
                              keyboardType: TextInputType.text,
                              onSaved: (val) => user.city = val,
                              onChanged: (text) { user.city = text; buttonActive(); setState(() { _isFieldEmptyCity = true;});},)
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
                              keyboardType: TextInputType.text,
                              onSaved: (val) => user.state = val,
                              onChanged: (text) { user.state = text; buttonActive(); setState(() { _isFieldEmptyState = true;});},)
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


