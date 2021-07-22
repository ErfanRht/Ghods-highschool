import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/styles.dart';
import 'package:ghods/controllers/card1_controller.dart';

manageButton({@required bool loading}) async {
  if (loading) {
    Get.find<Card1Controller>().updateButton(
        loading: true, showText: false, newWidth: 45, newRadios: 100);
    Get.find<Card1Controller>().updateCard(newConnectionError: false);
  } else if (!loading) {
    Get.find<Card1Controller>().updateButton(
        loading: false, newWidth: defaultButtonWitdh, newRadios: 15);
    await Future.delayed(Duration(milliseconds: 200));
    Get.find<Card1Controller>().updateButton(showText: true);
  }
}
