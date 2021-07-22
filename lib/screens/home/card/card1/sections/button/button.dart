import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/colors.dart';
import 'package:ghods/constants/types.dart';
import 'package:ghods/controllers/card1_controller.dart';
import 'package:ghods/controllers/user_controller.dart';
import 'package:ghods/models/managment/manage_button.dart';
import 'package:ghods/models/validators/validate_card1.dart';
import 'package:ghods/models/validators/validate_nc.dart';

class Button extends StatelessWidget {
  final Card1Controller card1Controller = Get.put(Card1Controller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Card1Controller>(
      builder: (state) => InkWell(
        onTap: () async {
          if (state.step == 1) {
            if (!state.buttonLoading) {
              manageButton(loading: true);
              await Future.delayed(Duration(milliseconds: 500));
              validateNC();
            }
          } else {
            if (!state.buttonLoading) {
              manageButton(loading: true);
              await Future.delayed(Duration(milliseconds: 500));
              validateCard1(context);
            }
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          width: state.buttonWidth,
          height: state.buttonHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(state.buttonRadios),
              boxShadow: [
                BoxShadow(blurRadius: 5, color: Colors.grey),
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0xffffffff),
                ),
              ],
              color: !state.connectionError ? kPrimaryColor : kErrorColor),
          child: Center(
              child: state.buttonLoading
                  ? SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : state.buttonShowText
                      ? state.step == 1
                          ? Text(
                              'مرحله بعد',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            )
                          : GetBuilder<UserController>(
                              builder: (user) => user.userType == UserType.USER
                                  ? Text(
                                      'دریافت رمز عبور پادا',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    )
                                  : Text(
                                      'ورود به پنل ادمین',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ))
                      : null),
        ),
      ),
    );
  }
}
