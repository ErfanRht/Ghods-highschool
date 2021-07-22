import 'package:get/get.dart';

class StatisticsController extends GetxController {
  int whoReceived;
  int whoDidNotReceive;
  int all10;
  int all11;
  int all12;
  int who_received10;
  int who_received11;
  int who_received12;
  double chart10;
  double chart11;
  double chart12;
  double chartNot10;
  double chartNot11;
  double chartNot12;
  double percentage10;
  double percentage11;
  double percentage12;
  double didNotReceive;

  updatestatistics(
      {int newWhoReceived,
      int newWhoDidNotReceive,
      int newAll10,
      int newAll11,
      int newAll12,
      int newWho10,
      int newWho11,
      int newWho12,
      double newPercentage10,
      double newPercentage11,
      double newPercentage12,
      double newDidNotReceive}) {
    whoReceived = newWhoReceived != null ? newWhoReceived : whoReceived;
    whoDidNotReceive =
        newWhoDidNotReceive != null ? newWhoDidNotReceive : whoDidNotReceive;
    if (newAll10 != null &&
        newAll11 != null &&
        newAll12 != null &&
        newWho10 != null &&
        newWho11 != null &&
        newWho12 != null) {
      all10 = newAll10;
      all11 = newAll11;
      all12 = newAll12;
      who_received10 = newWho10;
      who_received11 = newWho11;
      who_received12 = newWho12;

      chart10 = (who_received10 / 10).toDouble();
      chart11 = (who_received11 / 10).toDouble();
      chart12 = (who_received12 / 10).toDouble();
      chartNot10 = ((all10 - who_received10) / 10).toDouble();
      chartNot11 = ((all11 - who_received11) / 10).toDouble();
      chartNot12 = ((all12 - who_received12) / 10).toDouble();
    }
    percentage10 = newPercentage10 != null ? newPercentage10 : percentage10;
    percentage11 = newPercentage11 != null ? newPercentage11 : percentage11;
    percentage12 = newPercentage12 != null ? newPercentage12 : percentage12;
    didNotReceive = newDidNotReceive != null ? newDidNotReceive : didNotReceive;
    update();
  }
}
