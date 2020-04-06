import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:frontent_internship_test/src/app/pages/add_user/add_user_controller.dart';
import 'package:masked_text/masked_text.dart';
import 'dart:convert';

class FormUser extends StatefulWidget {
  @override
  _FormUserState createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AddUserController controller =
        FlutterCleanArchitecture.getController<AddUserController>(context);
    return Form(
      key: _formKey,
      autovalidate: controller.autoValidate,
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
                                  visible: controller.isFieldEmptyName,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    controller.isFieldEmptyName = false;
                                    controller.nameController.clear();
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
                              controller: controller.nameController,
                              onSaved: (val) => controller.user.name = val,
                              onChanged: (text) { controller.user.name = text; controller.buttonActive(); setState(() { controller.isFieldEmptyName = true;});},
                              )
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: TextFormField(decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(),
                                hintText: "Email",
                                suffixIcon: Visibility(
                                  visible: controller.isFieldEmptyEmail,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    controller.isFieldEmptyEmail = false;
                                    controller.emailController.clear();
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
                              controller: controller.emailController,
                              onSaved: (val) => controller.user.email = val,
                              onChanged: (text) { controller.user.email = text; controller.buttonActive(); setState(() { controller.isFieldEmptyEmail = true;});},
                              )
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: MaskedTextField(
                                maskedTextFieldController: controller.phoneController,
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
                                    visible: controller.isFieldEmptyPhone,
                                    child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                      controller.isFieldEmptyPhone = false;
                                      controller.phoneController.clear();
                                    });},),
                                  )
                                ),
                                onChange: (text) { controller.user.phone = text; controller.buttonActive(); setState(() { controller.isFieldEmptyPhone = true;});},
                              ),
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: TextFormField(decoration: InputDecoration(
                                labelText: "Date of Birth",
                                border: OutlineInputBorder(),
                                hintText: "Date of Birth",
                                suffixIcon: Visibility(
                                  visible: controller.isFieldEmptyDate,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    controller.isFieldEmptyDate = false;
                                    controller.dateController.clear();
                                  });},),
                                ),
                              ),
                              keyboardType: TextInputType.datetime,
                              validator: (String val){
                                if(val == "null")
                                  return "Required field";
                                else return null;
                              },
                              controller: controller.dateController,
                              onTap: () async { 
                                setState(() { controller.isFieldEmptyDate = true;});
                                DateTime date = DateTime(1900);
                                FocusScope.of(context).requestFocus(new FocusNode());

                                date = await showDatePicker(
                                              context: context, 
                                              initialDate:DateTime.now(),
                                              firstDate:DateTime(1900),
                                              lastDate: DateTime(2100));

                                controller.dateController.text = date.toString().split(" ")[0];
                                controller.user.date = date.toString().split(" ")[0];
                              },
                              onSaved: (val) => controller.user.date = val,
                              )
                            ),
                            
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: MaskedTextField(
                                maskedTextFieldController: controller.cpfController,
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
                                    visible: controller.isFieldEmptyCpf,
                                    child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                      controller.isFieldEmptyCpf = false;
                                      controller.cpfController.clear();
                                    });},),
                                  )
                                ),
                                onChange: (text) { controller.user.cpf = text; controller.buttonActive(); setState(() { controller.isFieldEmptyCpf = true;});},
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
                                maskedTextFieldController: controller.cepController,
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
                                    visible: controller.isFieldEmptyCep,
                                    child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                      controller.isFieldEmptyCep = false;
                                      controller.cepController.clear();
                                    });},),
                                  )
                                ),
                                onChange: (text) { controller.user.cep = text; controller.buttonActive(); setState(() { controller.isFieldEmptyCep = true;});},
                              ),
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: TextFormField(decoration: InputDecoration(
                                labelText: "Street",
                                border: OutlineInputBorder(),
                                hintText: "Street",
                                suffixIcon: Visibility(
                                  visible: controller.isFieldEmptyStreet,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    controller.isFieldEmptyStreet = false;
                                    controller.streetController.clear();
                                  });},),
                                )
                              ),
                              validator: (String val) {
                                if(val.isEmpty)
                                  return "Required field";
                                else
                                  return null;
                              },
                              controller: controller.streetController,
                              keyboardType: TextInputType.text,
                              onSaved: (val) => controller.user.street = val,
                              onChanged: (text) { controller.user.street = text; controller.buttonActive(); setState(() { controller.isFieldEmptyStreet = true;});},)
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
                                        visible: controller.isFieldEmptyNumber,
                                        child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                          controller.isFieldEmptyNumber = false;
                                          controller.numberController.clear();
                                        });},),
                                      )
                                    ),
                                    validator: (String val) {
                                      if(!RegExp(r'(^[0-9]*$)').hasMatch(val))
                                        return "Only numbers";
                                      else
                                        return null;
                                    },
                                    controller: controller.numberController,
                                    keyboardType: TextInputType.number,
                                    onSaved: (val) => controller.user.numberHouse = val,
                                    onChanged: (text) { controller.user.numberHouse = text; controller.buttonActive(); setState(() { controller.isFieldEmptyNumber = true;});},)
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
                                        visible: controller.isFieldEmptyComplement,
                                        child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                          controller.isFieldEmptyComplement = false;
                                          controller.complementController.clear();
                                        });},),
                                      )
                                    ),
                                    controller: controller.complementController,
                                    keyboardType: TextInputType.text,
                                    onSaved: (val) => controller.user.complement = val,
                                    onChanged: (text) { controller.user.complement = text; controller.buttonActive(); setState(() { controller.isFieldEmptyComplement = true;});},)
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
                                  visible: controller.isFieldEmptyDistrict,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    controller.isFieldEmptyDistrict = false;
                                    controller.districtController.clear();
                                  });},),
                                )
                              ),
                              validator: (String val) {
                                if(val.isEmpty)
                                  return "Required field";
                                else
                                  return null;
                              },
                              controller: controller.districtController,
                              keyboardType: TextInputType.text,
                              onSaved: (val) => controller.user.district = val,
                              onChanged: (text) { controller.user.district = text; controller.buttonActive(); setState(() { controller.isFieldEmptyDistrict = true;});},)
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: TextFormField(decoration: InputDecoration(
                                labelText: "City",
                                border: OutlineInputBorder(),
                                hintText: "City",
                                suffixIcon: Visibility(
                                  visible: controller.isFieldEmptyCity,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    controller.isFieldEmptyCity = false;
                                    controller.cityController.clear();
                                  });},),
                                )
                              ),
                              validator: (String val) {
                                if(val.isEmpty)
                                  return "Required field";
                                else
                                  return null;
                              },
                              controller: controller.cityController,
                              keyboardType: TextInputType.text,
                              onSaved: (val) => controller.user.city = val,
                              onChanged: (text) { controller.user.city = text; controller.buttonActive(); setState(() { controller.isFieldEmptyCity = true;});},)
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: TextFormField(decoration: InputDecoration(
                                labelText: "State",
                                border: OutlineInputBorder(),
                                hintText: "State",
                                suffixIcon: Visibility(
                                  visible: controller.isFieldEmptyState,
                                  child: IconButton(icon: Icon(Icons.cancel, color: Colors.black), onPressed: (){setState(() {
                                    controller.isFieldEmptyState = false;
                                    controller.stateController.clear();
                                  });},),
                                )
                              ),
                              validator: (String val) {
                                if(val.isEmpty)
                                  return "Required field";
                                else
                                  return null;
                              },
                              controller: controller.stateController,
                              keyboardType: TextInputType.text,
                              onSaved: (val) => controller.user.state = val,
                              onChanged: (text) { controller.user.state = text; controller.buttonActive(); setState(() { controller.isFieldEmptyState = true;});},)
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
              onPressed:  controller.active ? () => controller.checkForm({'context': context, 'formKey': _formKey}) : () => {},
              textColor: Colors.white,
              child: controller.active ? 
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


