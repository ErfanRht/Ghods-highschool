import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/types.dart';
import 'package:ghods/controllers/global_controller.dart';
import 'package:ghods/controllers/user_controller.dart';
import 'package:ghods/screens/home/card/card1/card1.dart';
import 'package:ghods/screens/admin/admin.dart';
import 'package:ghods/screens/home/card/card2/card2.dart';

// ignore: must_be_immutable
class HomeCard extends StatelessWidget {
  final GlobalController globalController = Get.put(GlobalController());
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (user) {
        return FlipCard(
            direction: FlipDirection.VERTICAL,
            key: globalController.cardKey,
            flipOnTouch: false,
            front: Card1(),
            back: user.userType == UserType.USER ? Card2() : AdminPanel());
      },
    );
  }
}

class MobileHomeCard extends StatelessWidget {
  final GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return FlipCard(
        direction: FlipDirection.VERTICAL,
        key: globalController.cardKey,
        flipOnTouch: false,
        front: MobileCard1(),
        back: Card2());
  }
}
