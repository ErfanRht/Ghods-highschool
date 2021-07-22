import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/admin.dart';
import 'package:ghods/constants/errorsText.dart';
import 'package:ghods/constants/server.dart';
import 'package:ghods/constants/types.dart';
import 'package:ghods/controllers/global_controller.dart';
import 'package:ghods/controllers/statistics_controller.dart';
import 'package:ghods/controllers/user_controller.dart';
import 'package:ghods/screens/admin/admin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:ghods/controllers/card1_controller.dart';
import 'package:ghods/models/managment/manage_button.dart';

validateCard1(BuildContext context) async {
  final Card1Controller card1Controller = Get.put(Card1Controller());
  final UserController userController = Get.put(UserController());
  final GlobalController globalController = Get.put(GlobalController());

  if (userController.userType == UserType.USER) {
    bool input2Validate = false;
    bool input3Validate = false;
    bool input4Validate = false;

    Get.find<Card1Controller>().updateInput(
        newText: card1Controller.inputEntredText
            .replaceAll('!', '')
            .replaceAll('@', '')
            .replaceAll('#', '')
            .replaceAll('\$', '')
            .replaceAll('%', '')
            .replaceAll('&', '')
            .replaceAll('*', ''));
    Get.find<Card1Controller>().updateInput2(
        newText: card1Controller.input2EntredText
            .replaceAll('!', '')
            .replaceAll('@', '')
            .replaceAll('#', '')
            .replaceAll('\$', '')
            .replaceAll('%', '')
            .replaceAll('&', '')
            .replaceAll('*', ''));
    Get.find<Card1Controller>().updateInput3(
        newText: card1Controller.input3EntredText
            .replaceAll('!', '')
            .replaceAll('@', '')
            .replaceAll('#', '')
            .replaceAll('\$', '')
            .replaceAll('%', '')
            .replaceAll('&', '')
            .replaceAll('*', ''));
    Get.find<Card1Controller>().updateInput4(
        newText: card1Controller.input4EntredText
            .replaceAll('!', '')
            .replaceAll('@', '')
            .replaceAll('#', '')
            .replaceAll('\$', '')
            .replaceAll('%', '')
            .replaceAll('&', '')
            .replaceAll('*', ''));

    // input2
    if (card1Controller.input2EntredText.isEmpty) {
      Get.find<Card1Controller>().updateInput2(
          newHintColor: Colors.grey, newErrorText: errorText4, newError: true);
      manageButton(loading: false);
    } else {
      if (card1Controller.input2EntredText.length < 10) {
        Get.find<Card1Controller>().updateInput2(
            newHintColor: Colors.grey,
            newErrorText: errorText7,
            newError: true);
        manageButton(loading: false);
      } else {
        input2Validate = true;
      }
    }

    // input3
    if (card1Controller.input3EntredText.isEmpty) {
      Get.find<Card1Controller>().updateInput3(
          newHintColor: Colors.grey, newErrorText: errorText5, newError: true);
      manageButton(loading: false);
    } else {
      if (card1Controller.input3EntredText.length < 10) {
        Get.find<Card1Controller>().updateInput3(
            newHintColor: Colors.grey,
            newErrorText: errorText8,
            newError: true);
        manageButton(loading: false);
      } else {
        input3Validate = true;
      }
    }
    // input4
    if (card1Controller.input4EntredText.isEmpty) {
      Get.find<Card1Controller>().updateInput4(
          newHintColor: Colors.grey, newErrorText: errorText6, newError: true);
      manageButton(loading: false);
    } else {
      if (card1Controller.input4EntredText.length < 15) {
        Get.find<Card1Controller>().updateInput4(
            newHintColor: Colors.grey,
            newErrorText: errorText9,
            newError: true);
        manageButton(loading: false);
      } else {
        input4Validate = true;
      }
    }

    if (input2Validate && input3Validate && input4Validate) {
      await sendData();
    }
  } else if (userController.userType == UserType.ADMIN) {
    if (card1Controller.input5EntredText.isEmpty) {
      Get.find<Card1Controller>().updateInput5(
          newHintColor: Colors.grey, newErrorText: errorText10, newError: true);
      manageButton(loading: false);
    } else {
      if (card1Controller.input5EntredText == adminPass) {
        await getStatistics().then((value) {
          if (value) {
            print('admin validated');
            manageButton(loading: false);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AdminPanel()),
            );
          }
        });
      } else {
        Get.find<Card1Controller>().updateInput5(
            newHintColor: Colors.grey,
            newErrorText: errorText11,
            newError: true);
        manageButton(loading: false);
      }
    }
  }
}

Future<bool> sendData() async {
  final Card1Controller card1Controller = Get.put(Card1Controller());
  final GlobalController globalController = Get.put(GlobalController());
  final UserController userController = Get.put(UserController());
  var response;
  var url = Uri.parse(
      '${serverURL}update_student?national_code=${card1Controller.inputEntredText}&phone=${card1Controller.input2EntredText}&postal_code=${card1Controller.input3EntredText}&address=${card1Controller.input4EntredText}&access_username=$serverUsername&access_pass=$serverPass');
  try {
    response = await http.put(
      url,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      globalController.cardKey.currentState.toggleCard();
      Clipboard.setData(ClipboardData(text: userController.passCode));
      return true;
    } else if (response.statusCode == 404) {
      print('not found');
      manageButton(loading: false);
      Get.find<Card1Controller>().updateCard(newConnectionError: true);
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

Future getStatistics() async {
  final StatisticsController statisticsController =
      Get.put(StatisticsController());
  var response;
  var url = Uri.parse('${serverURL}get_statistics');
  try {
    response = await http.get(
      url,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      Get.find<StatisticsController>().updatestatistics(
        newWhoReceived: jsonResponse['who_received'],
        newWhoDidNotReceive: jsonResponse['who_did_not_receive'],
        newAll10: jsonResponse['all10'],
        newAll11: jsonResponse['all11'],
        newAll12: jsonResponse['all12'],
        newWho10: jsonResponse['who_received10'],
        newWho11: jsonResponse['who_received11'],
        newWho12: jsonResponse['who_received12'],
        newPercentage10: jsonResponse['percentage10'],
        newPercentage11: jsonResponse['percentage11'],
        newPercentage12: jsonResponse['percentage12'],
        newDidNotReceive: jsonResponse['did_not_receive'],
      );
      return true;
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
