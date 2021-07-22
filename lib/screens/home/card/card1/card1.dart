import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/colors.dart';
import 'package:ghods/constants/errorsText.dart';
import 'package:ghods/constants/types.dart';
import 'package:ghods/controllers/card1_controller.dart';
import 'package:ghods/controllers/user_controller.dart';
import 'package:ghods/screens/home/card/card1/sections/button/button.dart';
import 'package:ghods/screens/home/card/card1/sections/inputs/input1.dart';
import 'package:ghods/screens/home/card/card1/sections/inputs/input2.dart';
import 'package:ghods/screens/home/card/card1/sections/inputs/input3.dart';
import 'package:ghods/screens/home/card/card1/sections/inputs/input4.dart';
import 'package:ghods/screens/home/card/card1/sections/inputs/input5.dart';

class Card1 extends StatelessWidget {
  final Card1Controller card1Controller = Get.put(Card1Controller());
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Card1Controller>(
      builder: (state) => Container(
        height: 570,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              blurRadius: 25,
              color: Color(0xff808080),
            ),
            BoxShadow(
              blurRadius: 25,
              color: Color(0xffffffff),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: kPrimaryColor,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 50,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Container(
                            height: 45,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff7988ED),
                            ),
                            child: Center(
                              child: Text(
                                'مشخصات خود را وارد کنید',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Center(
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: state.showError ? 1 : 0,
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  padding: EdgeInsets.all(10),
                  width: 300,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kErrorColor,
                  ),
                  child: Text(
                    state.errorText,
                    style: TextStyle(color: Colors.white, fontSize: 16.5),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Center(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: state.step > 1 &&
                            userController.userType == UserType.USER
                        ? 1
                        : 0,
                    child: SizedBox(width: 350, child: PNInput()),
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 1000),
                    opacity: state.step > 1 &&
                            userController.userType == UserType.USER
                        ? 1
                        : 0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: SizedBox(width: 350, child: PCInput()),
                    ),
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 1700),
                    opacity: state.step > 1 &&
                            userController.userType == UserType.USER
                        ? 1
                        : 0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: SizedBox(width: 350, child: AInput()),
                    ),
                  ),
                ),
              ],
            ),
            userController.userType == UserType.ADMIN
                ? Center(
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 700),
                      opacity: state.step > 1 &&
                              userController.userType == UserType.ADMIN
                          ? 1
                          : 0,
                      child: Padding(
                        padding: EdgeInsets.only(top: 150),
                        child: SizedBox(width: 350, child: PassInput()),
                      ),
                    ),
                  )
                : Text(''),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: SizedBox(width: 350, child: NCInput()),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 480),
              child: Column(
                children: [
                  Center(child: Button()),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    state.connectionError ? connectionErrorText : '',
                    style: TextStyle(
                        color: kErrorColor, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileCard1 extends StatelessWidget {
  final Card1Controller card1Controller = Get.put(Card1Controller());
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Card1Controller>(
      builder: (state) => Container(
        height: 570,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              blurRadius: 25,
              color: Color(0xff808080),
            ),
            BoxShadow(
              blurRadius: 25,
              color: Color(0xffffffff),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: kPrimaryColor,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 50,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Container(
                            height: 45,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff7988ED),
                            ),
                            child: Center(
                              child: Text(
                                'مشخصات خود را وارد کنید',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Center(
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: state.showError ? 1 : 0,
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  padding: EdgeInsets.all(10),
                  width: 300,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kErrorColor,
                  ),
                  child: Text(
                    state.errorText,
                    style: TextStyle(color: Colors.white, fontSize: 16.5),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Center(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: state.step > 1 &&
                            userController.userType == UserType.USER
                        ? 1
                        : 0,
                    child: SizedBox(width: 300, child: PNInput()),
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 1000),
                    opacity: state.step > 1 &&
                            userController.userType == UserType.USER
                        ? 1
                        : 0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: SizedBox(width: 300, child: PCInput()),
                    ),
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 1700),
                    opacity: state.step > 1 &&
                            userController.userType == UserType.USER
                        ? 1
                        : 0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: SizedBox(width: 300, child: AInput()),
                    ),
                  ),
                ),
              ],
            ),
            userController.userType == UserType.ADMIN
                ? Center(
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 700),
                      opacity: state.step > 1 &&
                              userController.userType == UserType.ADMIN
                          ? 1
                          : 0,
                      child: Padding(
                        padding: EdgeInsets.only(top: 150),
                        child: SizedBox(width: 300, child: PassInput()),
                      ),
                    ),
                  )
                : Text(''),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: SizedBox(width: 300, child: NCInput()),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 480),
              child: Column(
                children: [
                  Center(child: Button()),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    state.connectionError ? connectionErrorText : '',
                    style: TextStyle(
                        color: kErrorColor, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
