import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/colors.dart';
import 'package:ghods/controllers/card1_controller.dart';

class AInput extends StatelessWidget {
  final Card1Controller card1Controller = Get.put(Card1Controller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Card1Controller>(
      builder: (state) => TextField(
        enabled: state.step == 2,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(15.0),
              ),
            ),
            prefixIcon: const Icon(Icons.home),
            errorText: state.input4Error ? state.input4ErrorText : null,
            hintStyle: TextStyle(
                color: state.input4HintColor,
                fontWeight: FontWeight.w700,
                fontSize: 15),
            labelStyle: TextStyle(
                color: state.input4LableColor,
                fontWeight: FontWeight.w700,
                fontSize: 15),
            counterText: '',
            labelText: 'آدرس محل سکونت',
            hintText: 'لطفا آدرس محل سکونت خود را وارد کنید'),
        maxLength: 80,
        onTap: () {
          Get.find<Card1Controller>()
              .updateInput4(newHintColor: kPrimaryColor, newError: false);
        },
        onChanged: (String changedText) {
          Get.find<Card1Controller>().updateInput4(newText: changedText);
        },
        style: TextStyle(
            color: kPrimaryColor, fontWeight: FontWeight.w700, fontSize: 15),
        keyboardType: TextInputType.streetAddress,
      ),
    );
  }
}
