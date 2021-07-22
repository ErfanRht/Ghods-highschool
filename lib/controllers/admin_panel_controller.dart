import 'package:get/get.dart';

class AdminPanelController extends GetxController {
  List whoDidReceive;
  List whoDidNotReceive;
  String whoDidNotNameAll;
  String whoDidNotName10;
  String whoDidNotName11;
  String whoDidNotName12;
  void updateWho(
      {List newWhoDidReceive,
      List newWhoDidNotReceive,
      String newWhoDidNotAll,
      String newWhoDidNot10,
      String newWhoDidNot11,
      String newWhoDidNot12}) {
    whoDidReceive = newWhoDidReceive != null ? newWhoDidReceive : whoDidReceive;
    whoDidNotReceive =
        newWhoDidNotReceive != null ? newWhoDidNotReceive : whoDidNotReceive;
    whoDidNotNameAll =
        newWhoDidNotAll != null ? newWhoDidNotAll : whoDidNotNameAll;
    whoDidNotName10 = newWhoDidNot10 != null ? newWhoDidNot10 : whoDidNotName10;
    whoDidNotName11 = newWhoDidNot11 != null ? newWhoDidNot11 : whoDidNotName11;
    whoDidNotName12 = newWhoDidNot12 != null ? newWhoDidNot12 : whoDidNotName12;
    update();
  }
}
