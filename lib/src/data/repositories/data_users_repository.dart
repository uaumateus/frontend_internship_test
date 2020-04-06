import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontent_internship_test/src/domain/entities/user.dart';
import 'package:frontent_internship_test/src/domain/repositories/users_repository.dart';
import 'package:localstorage/localstorage.dart';
import 'package:logging/logging.dart';


/// `DataAuthenticationRepository` is the implementation of `AuthenticationRepository` present
/// in the Domain layer. It communicates with the server, making API calls to register, login, logout, and
/// store a `User`.
class DataUsersRepository implements UsersRepository {
  // Members
  /// Singleton object of `DataAuthenticationRepository`
  static DataUsersRepository _instance =
      DataUsersRepository._internal();
  Logger _logger;

  final LocalStorage _storage = new LocalStorage('app');
  LocalStorage get storage => _storage;

  // Constructors
  DataUsersRepository._internal() {
    _logger = Logger('DataUsersRepository');
  }

  factory DataUsersRepository() => _instance;

  Future<void> addUser({@required User user}){
    var items = storage.getItem('users');
    
    if(items == null){
      List<User> save = [user];
      String jsonUsers = jsonEncode(save);
      storage.setItem('users', jsonUsers);
    }else{
      List<dynamic> save = jsonDecode(items);
      save.add(user);
      String jsonUsers = jsonEncode(save);
      storage.setItem('users', jsonUsers);
    }
  }
  Future<User> getUser(User user){
  }
  Future<List<User>> getAllUsers() async {
    var items = storage.getItem('users');
    List<User> users = new List<User>();
    if (items != null) {
      (jsonDecode(items) as List).forEach((item) {
        final todoItem =
            new User(item['name'], item['email'], item['phone'], item['date'], item['cpf'], item['cep'], item['street'], item['numberHouse'], item['complement'], item['district'], item['city'], item['state'], item['color']);
        users.add(todoItem);
      });
    }
    return users;
  }
}