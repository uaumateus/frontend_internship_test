import 'package:frontent_internship_test/src/app/pages/add_user/add_user_presenter.dart';
import 'package:frontent_internship_test/src/app/pages/list_users/list_users_view.dart';
import '../../../domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddUserController extends Controller {
  AddUserPresenter _addUserPresenter;

  User user;

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController phoneController;
  TextEditingController dateController;
  TextEditingController cpfController;
  TextEditingController cepController;
  TextEditingController streetController;
  TextEditingController numberController;
  TextEditingController complementController;
  TextEditingController districtController;
  TextEditingController cityController;
  TextEditingController stateController;
  TextEditingController textCPFController;
  String color;

  bool isFieldEmptyName;
  bool isFieldEmptyEmail;
  bool isFieldEmptyPhone;
  bool isFieldEmptyDate;
  bool isFieldEmptyCpf;
  bool isFieldEmptyCep;
  bool isFieldEmptyStreet;
  bool isFieldEmptyNumber;
  bool isFieldEmptyComplement;
  bool isFieldEmptyDistrict;
  bool isFieldEmptyCity;
  bool isFieldEmptyState;

  bool active;
  bool autoValidate;

  AddUserController(authRepo)
      : _addUserPresenter = AddUserPresenter(authRepo) {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    dateController = TextEditingController();
    cpfController = TextEditingController();
    cepController = TextEditingController();
    streetController = TextEditingController();
    numberController = TextEditingController();
    complementController = TextEditingController();
    districtController = TextEditingController();
    cityController = TextEditingController();
    stateController = TextEditingController();

    user = new User(null, null, null, null, null, null, null, null, null, null, null, null, null);

    //Primary Colors Material Design
    color = (["16007990", "15277667", "10233776", "6765239", "4149685", "2201331", "48340", "38536", "5025616", "13491257", "16761095", "16750592"]..shuffle()).first;
    isFieldEmptyName = false; 
    isFieldEmptyEmail = false;
    isFieldEmptyPhone = false;
    isFieldEmptyDate = false;
    isFieldEmptyCpf = false;
    isFieldEmptyCep = false;
    isFieldEmptyStreet = false;
    isFieldEmptyNumber = false;
    isFieldEmptyComplement = false;
    isFieldEmptyDistrict = false;
    isFieldEmptyCity = false;
    isFieldEmptyState = false;
    active = false;
    autoValidate = false;

    initListeners();
  }

  void initListeners() {
    _addUserPresenter.addUserOnNext = () {
      refreshUI(); 
    };

    _addUserPresenter.addUserOnComplete = () {
      logger.finest("Complete: Registration success.");
      refreshUI(); 
      Navigator.push(
        getContext(),
        MaterialPageRoute(builder: (context) => ListUsersPage()),
      );
    };

    _addUserPresenter.addUserOnError = (e) {
      print('Could not add user.');
      ScaffoldState state = getState();
      state.showSnackBar(SnackBar(content: Text(e.message)));
      refreshUI();
    };
  }

  void checkForm(Map<String, dynamic> params) {
    dynamic formKey = params['formKey'];
    dynamic context = params['context'];

    assert(formKey is GlobalKey<FormState>);

    if (!formKey.currentState.validate()) {
      autoValidate = true;
    } else {
      formKey.currentState.save();
      user.color = color;
      register(user);
    }
  }

  void register(User user){
    _addUserPresenter.addUser(user);
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
            active = true;
  }

  @override
  void dispose() {
    _addUserPresenter.dispose();
    super.dispose();
  }
}