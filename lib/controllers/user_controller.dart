import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/types.dart';

class UserController extends GetxController {
  String name = '';
  String passCode = '';
  UserType userType = UserType.USER;

  void updateUserData(
      {String newName, String newPassCode, UserType newUserType}) {
    name = newName != null ? newName : name;
    passCode = newPassCode != null ? newPassCode : passCode;
    userType = newUserType != null ? newUserType : userType;
    update();
  }
}
