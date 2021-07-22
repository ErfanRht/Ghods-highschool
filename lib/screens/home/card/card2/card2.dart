import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:ghods/constants/colors.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:ghods/controllers/user_controller.dart';

class Card2 extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        builder: (user) => Container(
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
                              color: Color(0xff4ED964),
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
                                  color: Color(0xff4ED964),
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
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'اطلاعات شما تایید شد',
                                      style: TextStyle(
                                          color: Color(0xff4ED964),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        height: 150,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kPrimaryColor),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text('رمز عبور پادای شما :',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Tooltip(
                                        message: 'کپی کردن متن',
                                        textStyle:
                                            TextStyle(color: Colors.white),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[700],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        showDuration:
                                            Duration(milliseconds: 2000),
                                        child: IconButton(
                                            icon: Icon(Icons.copy),
                                            onPressed: () {
                                              Clipboard.setData(ClipboardData(
                                                  text: user.passCode));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: const Text(
                                                      'رمزعبور پادا کپی شد'),
                                                  action: SnackBarAction(
                                                    label: 'باشه',
                                                    onPressed: () {
                                                      // Code to execute.
                                                    },
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: SelectableText(
                                        user.passCode,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 75,
                      ),
                      InkWell(
                        onTap: () {
                          html.window.open(
                              'https://pada.medu.ir/#/login/karnameh',
                              '_blank');
                        },
                        child: Container(
                          width: 250,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(blurRadius: 5, color: Colors.grey),
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0xffffffff),
                                ),
                              ],
                              color: Color(0xff01C1B2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                'دریافت کارنامه از سامانه پادا',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ));
  }
}
