import 'dart:math';

class User {
  String name;
  String email;
  String phone;
  String date;
  String cpf;
  String cep;
  String street;
  String numberHouse;
  String complement;
  String district;
  String city;
  String state;
  String color = (Random().nextDouble() * 0xFFFFFF).toInt().toString();

  User({String name, String email}){
    this.name = name;
    this.email = email;
  }

  Map toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'date': date,
        'cpf': cpf,
        'cep': cep,
        'street': street,
        'numberHouse': numberHouse,
        'complement': complement,
        'district': district,
        'city': city,
        'state': state,
        'color': color
      };
}