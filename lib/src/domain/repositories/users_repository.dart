 
import 'package:flutter/material.dart';

import '../entities/user.dart';

abstract class UsersRepository {
  Future<void> addUser({
      @required User user
  });
  Future<User> getUser(User user);
  Future<List<User>> getAllUsers();
}