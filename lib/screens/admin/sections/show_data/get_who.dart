import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/server.dart';
import 'package:ghods/controllers/admin_panel_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<bool> getWho({@required bool did}) async {
  final AdminPanelController adminPanelController =
      Get.put(AdminPanelController());
  var response;
  var url = did
      ? Uri.parse(
          '${serverURL}get_students_info?mode=who_did&access_username=Admin@Erfan!&access_pass=@Nn11571847!')
      : Uri.parse(
          '${serverURL}get_students_info?mode=who_did_not&access_username=Admin@Erfan!&access_pass=@Nn11571847!');
  try {
    response = await http.get(
      url,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      if (did) {
        Get.find<AdminPanelController>().updateWho(
          newWhoDidReceive: jsonResponse['who_did'],
        );
      } else {
        Get.find<AdminPanelController>().updateWho(
          newWhoDidNotReceive: jsonResponse['who_did_not'],
          newWhoDidNotAll: jsonResponse['who_did_not_name_all'],
          newWhoDidNot10: jsonResponse['who_did_not_name10'],
          newWhoDidNot11: jsonResponse['who_did_not_name11'],
          newWhoDidNot12: jsonResponse['who_did_not_name12'],
        );
      }
      return true;
    } else {
      print('connection error!');
      // manageButton(loading: false);
      // Get.find<Card1Controller>().updateCard(newConnectionError: true);
      return false;
    }
  } catch (e) {
    print('connection error: $e');
    // manageButton(loading: false);
    // Get.find<Card1Controller>().updateCard(newConnectionError: true);
    return false;
  }
}
