import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/admin.dart';
import 'package:ghods/constants/errorsText.dart';
import 'package:ghods/constants/server.dart';
import 'package:ghods/constants/types.dart';
import 'package:ghods/controllers/global_controller.dart';
import 'package:ghods/controllers/user_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:ghods/controllers/card1_controller.dart';
import 'package:ghods/models/managment/manage_button.dart';

validateNC() {
  final Card1Controller card1Controller = Get.put(Card1Controller());

  String inputEntredText = card1Controller.inputEntredText;

  if (inputEntredText.isEmpty) {
    Get.find<Card1Controller>().updateInput(
        newHintColor: Colors.grey, newErrorText: errorText1, newError: true);
    manageButton(loading: false);
  } else if (inputEntredText.length < 8) {
    Get.find<Card1Controller>().updateInput(
        newHintColor: Colors.grey, newErrorText: errorText2, newError: true);
    manageButton(loading: false);
  } else {
    if (inputEntredText == adminUsername) {
      Get.find<UserController>().updateUserData(newUserType: UserType.ADMIN);
      Get.find<Card1Controller>().nextStep();
      manageButton(loading: false);
    } else {
      inputEntredText = inputEntredText
          .replaceAll(RegExp(r'^(00)n*'), '')
          .replaceAll(RegExp(r'^(0)n*'), '');
      Get.find<Card1Controller>().updateInput(newText: inputEntredText);
      Get.find<Card1Controller>()
          .updateInput(newHintColor: Colors.grey, newError: false);
      register().then((response) {});
    }
  }
}

Future<bool> register() async {
  final Card1Controller card1Controller = Get.put(Card1Controller());
  final GlobalController globalController = Get.put(GlobalController());
  var url = Uri.parse(
      '${serverURL}register?national_code=${card1Controller.inputEntredText}');
  var response;
  try {
    response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 302) {
      var jsonResponse = convert.jsonDecode(response.body);
      String studentPass = jsonResponse['password'];
      bool needToPause =
          jsonResponse['need_to_pause'] == 'False' ? false : true;
      Get.find<UserController>().updateUserData(
          newName: card1Controller.inputEntredText, newPassCode: studentPass);
      if (needToPause) {
        print('user needs to pause');
        Get.find<Card1Controller>().nextStep();
        manageButton(loading: false);
      } else {
        print('user doesn\'t need to pause');
        globalController.cardKey.currentState.toggleCard();
        Clipboard.setData(ClipboardData(text: studentPass));
      }
      return true;
    } else if (response.statusCode == 404) {
      print('not found');
      Get.find<Card1Controller>().updateInput(
          newHintColor: Colors.grey, newErrorText: '', newError: true);
      Get.find<Card1Controller>().updateCard(
        newShowError: true,
        newErrorText: errorText3,
      );
      manageButton(loading: false);
      return false;
    } else {
      print('connection error!');
      manageButton(loading: false);
      Get.find<Card1Controller>().updateCard(newConnectionError: true);
      return false;
    }
  } catch (e) {
    print('connection error: $e');
    manageButton(loading: false);
    Get.find<Card1Controller>().updateCard(newConnectionError: true);
    return false;
  }
}
