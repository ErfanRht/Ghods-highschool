import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/colors.dart';
import 'package:ghods/controllers/card1_controller.dart';

class PNInput extends StatelessWidget {
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
            prefixIcon: const Icon(Icons.phone_android),
            errorText: state.input2Error ? state.input2ErrorText : null,
            hintStyle: TextStyle(
                color: state.input2HintColor,
                fontWeight: FontWeight.w700,
                fontSize: 15),
            labelStyle: TextStyle(
                color: state.input2LableColor,
                fontWeight: FontWeight.w700,
                fontSize: 15),
            counterText: '',
            labelText: 'شماره همراه استفاده شده در شاد',
            hintText: 'لطفا شماره ای که در شاد استفاده میکنید را وارد کنید'),
        maxLength: 11,
        onTap: () {
          Get.find<Card1Controller>()
              .updateInput2(newHintColor: kPrimaryColor, newError: false);
        },
        onChanged: (String changedText) {
          Get.find<Card1Controller>().updateInput2(newText: changedText);
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
