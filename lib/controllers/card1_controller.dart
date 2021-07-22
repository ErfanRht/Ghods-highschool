import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/styles.dart';

class Card1Controller extends GetxController {
  bool showError = false;
  bool connectionError = false;
  String errorText = '';
  int studentNumber;
  int step = 1;

  void updateCard(
      {bool newShowError, String newErrorText, bool newConnectionError}) {
    showError = newShowError != null ? newShowError : showError;
    errorText = newErrorText != null ? newErrorText : errorText;
    connectionError =
        newConnectionError != null ? newConnectionError : connectionError;
    update();
  }

  void nextStep() {
    step++;
    update();
  }

  void updateStudentNumber({@required int newNumber}) {
    studentNumber = newNumber;
    update();
  }

  double buttonWidth = defaultButtonWitdh;
  double buttonHeight = 45;
  double buttonRadios = 15;
  bool buttonLoading = false;
  bool buttonShowText = true;

  void updateButton(
      {double newWidth,
      double newHeight,
      double newRadios,
      bool loading,
      bool showText}) {
    buttonWidth = newWidth != null ? newWidth : buttonWidth;
    buttonHeight = newHeight != null ? newHeight : buttonHeight;
    buttonRadios = newRadios != null ? newRadios : buttonRadios;
    buttonLoading = loading != null ? loading : buttonLoading;
    buttonShowText = showText != null ? showText : buttonShowText;
    update();
  }

  bool inputError = false;
  bool inputValidate = false;
  String inputErrorText = '';
  Color inputHintColor = Colors.grey;
  Color inputLableColor = Colors.grey;
  String inputEntredText = '';

  void updateInput(
      {bool newValidate,
      bool newError,
      String newErrorText,
      Color newHintColor,
      Color newLableColor,
      String newText}) {
    inputValidate = newValidate != null ? newValidate : inputValidate;
    inputError = newError != null ? newError : inputError;
    inputHintColor = newHintColor != null ? newHintColor : inputHintColor;
    newLableColor = newLableColor != null ? newLableColor : inputLableColor;
    inputErrorText = newErrorText != null ? newErrorText : inputErrorText;
    inputEntredText = newText != null ? newText : inputEntredText;
    update();
  }

  bool input2Error = false;
  String input2ErrorText = '';
  Color input2HintColor = Colors.grey;
  Color input2LableColor = Colors.grey;
  String input2EntredText = '';

  void updateInput2(
      {bool newError,
      String newErrorText,
      Color newHintColor,
      String newText}) {
    input2Error = newError != null ? newError : input2Error;
    input2HintColor = newHintColor != null ? newHintColor : input2HintColor;
    input2ErrorText = newErrorText != null ? newErrorText : input2ErrorText;
    input2EntredText = newText != null ? newText : input2EntredText;
    update();
  }

  bool input3Error = false;
  String input3ErrorText = '';
  Color input3HintColor = Colors.grey;
  Color input3LableColor = Colors.grey;

  String input3EntredText = '';

  void updateInput3(
      {bool newError,
      String newErrorText,
      Color newHintColor,
      String newText}) {
    input3Error = newError != null ? newError : input3Error;
    input3HintColor = newHintColor != null ? newHintColor : input3HintColor;
    input3ErrorText = newErrorText != null ? newErrorText : input3ErrorText;
    input3EntredText = newText != null ? newText : input3EntredText;
    update();
  }

  bool input4Error = false;
  String input4ErrorText = '';
  Color input4HintColor = Colors.grey;
  Color input4LableColor = Colors.grey;

  String input4EntredText = '';

  void updateInput4(
      {bool newError,
      String newErrorText,
      Color newHintColor,
      String newText}) {
    input4Error = newError != null ? newError : input4Error;
    input4HintColor = newHintColor != null ? newHintColor : input4HintColor;
    input4ErrorText = newErrorText != null ? newErrorText : input4ErrorText;
    input4EntredText = newText != null ? newText : input4EntredText;
    update();
  }

  bool input5Error = false;
  String input5ErrorText = '';
  Color input5HintColor = Colors.grey;
  Color input5LableColor = Colors.grey;
  String input5EntredText = '';

  void updateInput5(
      {bool newError,
      String newErrorText,
      Color newHintColor,
      String newText}) {
    input5Error = newError != null ? newError : input5Error;
    input5HintColor = newHintColor != null ? newHintColor : input5HintColor;
    input5ErrorText = newErrorText != null ? newErrorText : input5ErrorText;
    input5EntredText = newText != null ? newText : input5EntredText;
    update();
  }
}
