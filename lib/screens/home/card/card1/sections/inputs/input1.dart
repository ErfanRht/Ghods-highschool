import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/colors.dart';
import 'package:ghods/controllers/card1_controller.dart';
import 'package:ghods/models/managment/manage_button.dart';
import 'package:ghods/models/validators/validate_nc.dart';

class NCInput extends StatelessWidget {
  final Card1Controller card1Controller = Get.put(Card1Controller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Card1Controller>(
      builder: (state) => TextField(
        readOnly: state.step == 1 ? false : true,
        enabled: state.step == 1 ? true : false,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(15.0),
              ),
            ),
            prefixIcon: const Icon(Icons.person),
            errorText: state.inputError ? state.inputErrorText : null,
            hintStyle: TextStyle(
                color: state.inputHintColor,
                fontWeight: FontWeight.w700,
                fontSize: 15),
            labelStyle: TextStyle(
                color: state.inputLableColor,
                fontWeight: FontWeight.w700,
                fontSize: 15),
            counterText: '',
            labelText: 'کدملی',
            hintText: 'لطفا کدملی خود را وارد کنید'),
        maxLength: 11,
        onTap: () {
          Get.find<Card1Controller>().updateInput(
              newHintColor: kPrimaryColor,
              newLableColor: kPrimaryColor,
              newError: false);
          Get.find<Card1Controller>().updateCard(newShowError: false);
        },
        onSubmitted: (String submittedText) async {
          manageButton(loading: true);
          await Future.delayed(Duration(milliseconds: 500));
          validateNC();
        },
        onEditingComplete: () {
          Get.find<Card1Controller>().updateInput(
            newHintColor: Colors.grey,
            newLableColor: Colors.grey,
          );
        },
        onChanged: (String changedText) {
          Get.find<Card1Controller>().updateInput(newText: changedText);
          Get.find<Card1Controller>().updateInput(
              newHintColor: kPrimaryColor,
              newLableColor: kPrimaryColor,
              newError: false);
          Get.find<Card1Controller>().updateCard(newShowError: false);
        },
        style: TextStyle(
            color: kPrimaryColor, fontWeight: FontWeight.w700, fontSize: 15),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
