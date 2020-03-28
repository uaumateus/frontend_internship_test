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
  String color;

  User({String name, String email, String phone, String date, String cpf, String cep, String street, String numberHouse, String complement, String district, String city, String state, String color}){
    this.name = name;
    this.email = email;
    this.phone = phone;
    this.date = date;
    this.cpf = cpf;
    this.cep = cep;
    this.street = email;
    this.numberHouse = numberHouse;
    this.complement = complement;
    this.district = district;
    this.city = city;
    this.state = state;
    this.color = color;
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