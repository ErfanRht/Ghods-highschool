import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/colors.dart';
import 'package:ghods/constants/routes.dart';
import 'package:ghods/screens/admin/sections/show_data/get_who.dart';
import 'package:ghods/screens/admin/sections/show_data/who_did_not_receive.dart';
import 'package:ghods/screens/admin/sections/show_data/who_did_receive.dart';
import 'package:ghods/controllers/statistics_controller.dart';
import 'package:ghods/screens/admin/sections/statistics/statistics.dart';
import 'package:ghods/screens/admin/sections/statistics2/statistics2.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class AdminPanel extends StatelessWidget {
  final StatisticsController statisticsController =
      Get.put(StatisticsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFCFDFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leadingWidth: 100,
          title: Text(
            'سامانه دریافت رمز عبور پادا دبیرستان قدس',
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.logout,
              color: kPrimaryColor,
            ),
            onPressed: () {
              js.context.callMethod('open', ['https://GhodsWeb.GitHub.io']);
            },
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Statistics(),
                MediaQuery.of(context).size.shortestSide > 600
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              getWho(did: false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WhoDidNot()),
                              );
                            },
                            child: Container(
                              width: 450,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Color(0xffff4c52),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25, right: 15),
                                        child: Text(
                                          'کسانی که کارنامه خود را دریافت نکرده اند',
                                          style: TextStyle(
                                              fontSize: 20.5,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Text(
                                        'برای مشاهده اطلاعات بیشتر کلیک کنید',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        statisticsController.whoDidNotReceive
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 27.5,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        ' نفر',
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          InkWell(
                            onTap: () {
                              getWho(did: true);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WhoDid()),
                              );
                            },
                            child: Container(
                              width: 450,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Color(0xff3e8ef7),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25, right: 15),
                                        child: Text(
                                          'کسانی که کارنامه خود را دریافت کرده اند',
                                          style: TextStyle(
                                              fontSize: 20.5,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Text(
                                        'برای مشاهده اطلاعات بیشتر کلیک کنید',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        statisticsController.whoReceived
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 27.5,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        ' نفر',
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              getWho(did: false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WhoDidNot()),
                              );
                            },
                            child: Container(
                              width: 450,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Color(0xffff4c52),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25, right: 15),
                                        child: Text(
                                          'کسانی که کارنامه خود را دریافت نکرده اند',
                                          style: TextStyle(
                                              fontSize: 20.5,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Text(
                                        'برای مشاهده اطلاعات بیشتر کلیک کنید',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        statisticsController.whoDidNotReceive
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 27.5,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        ' نفر',
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          InkWell(
                            onTap: () {
                              getWho(did: true);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WhoDid()),
                              );
                            },
                            child: Container(
                              width: 450,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Color(0xff3e8ef7),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25, right: 15),
                                        child: Text(
                                          'کسانی که کارنامه خود را دریافت کرده اند',
                                          style: TextStyle(
                                              fontSize: 20.5,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Text(
                                        'برای مشاهده اطلاعات بیشتر کلیک کنید',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        statisticsController.whoReceived
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 27.5,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        ' نفر',
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                SizedBox(width: 500, height: 400, child: Statistics2())
              ],
            ),
          ),
        ));
  }
}
