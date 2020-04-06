class User {
  String _name;
  String _email;
  String _phone;
  String _date;
  String _cpf;
  String _cep;
  String _street;
  String _numberHouse;
  String _complement;
  String _district;
  String _city;
  String _state;
  String _color;

  get name => _name;
  set name(String name) => _name = name;

  get email => _email;
  set email(String email) => _email = email;

  get phone => _phone;
  set phone(String phone) => _phone = phone;

  get date => _date;
  set date(String date){ this._date = date;}

  get cpf => _cpf;
  set cpf(String cpf) => _cpf = cpf;

  get cep => _cep;
  set cep(String cep) => _cep = cep;

  get street => _street;
  set street(String street) => _street = street;

  get numberHouse => _numberHouse;
  set numberHouse(String numberHouse) => _numberHouse = numberHouse;

  get complement => _complement;
  set complement(String complement) => _complement = complement;

  get district => _district;
  set district(String district) => _district = district;

  get city => _city;
  set city(String city) => _city = city;

  get state => _state;
  set state(String state) => _state = state;

  get color => _color;
  set color(String color) => _color = color;

  User(this._name, this._email, this._phone, this._date, this._cpf, this._cep, this._street, this._numberHouse, this._complement, this._district, this._city, this._state, this._color, {cep});

  Map toJson() => {
    'name': _name,
    'email': _email,
    'phone': _phone,
    'date': _date,
    'cpf': _cpf,
    'cep': _cep,
    'street': _street,
    'numberHouse': _numberHouse,
    'complement': _complement,
    'district': _district,
    'city': _city,
    'state': _state,
    'color': _color
  };
}