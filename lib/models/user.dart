class User {
  String name;
  String email;
  String phone;
  String date;
  String cpf;
  int cep;
  String street;
  int numberHouse;
  String complement;
  String district;
  String city;
  String state;
  
  Map toJson() => {
        'name': name,
        'email': email,
      };

}