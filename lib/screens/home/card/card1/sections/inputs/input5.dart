import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/colors.dart';
import 'package:ghods/controllers/card1_controller.dart';
import 'package:ghods/models/managment/manage_button.dart';
import 'package:ghods/models/validators/validate_card1.dart';

class PassInput extends StatelessWidget {
  final Card1Controller card1Controller = Get.put(Card1Controller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Card1Controller>(
      builder: (state) => TextField(
        obscureText: true,
        enabled: state.step == 2,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(15.0),
              ),
            ),
            prefixIcon: const Icon(Icons.lock),
            errorText: state.input5Error ? state.input5ErrorText : null,
            hintStyle: TextStyle(
                color: state.input5HintColor,
                fontWeight: FontWeight.w700,
                fontSize: 15),
            labelStyle: TextStyle(
                color: state.input5LableColor,
                fontWeight: FontWeight.w700,
                fontSize: 15),
            counterText: '',
            labelText: 'رمز عبور',
            hintText: 'لطفا رمز عبور را وارد کنید'),
        maxLength: 12,
        onTap: () {
          Get.find<Card1Controller>()
              .updateInput5(newHintColor: kPrimaryColor, newError: false);
        },
        onChanged: (String changedText) {
          Get.find<Card1Controller>().updateInput5(newText: changedText);
        },
        onSubmitted: (String submittedText) async {
          manageButton(loading: true);
          await Future.delayed(Duration(milliseconds: 500));
          validateCard1(context);
        },
        style: TextStyle(
            color: kPrimaryColor, fontWeight: FontWeight.w700, fontSize: 15),
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }
}
