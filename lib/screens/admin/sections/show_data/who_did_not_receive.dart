import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/colors.dart';
import 'package:ghods/controllers/admin_panel_controller.dart';

class WhoDidNot extends StatelessWidget {
  final AdminPanelController adminPanelController =
      Get.put(AdminPanelController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFDFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'کسانی که کارنامه خود را دریافت نکرده اند',
          style: TextStyle(
              color: kPrimaryColor, fontSize: 25, fontWeight: FontWeight.w700),
        ),
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: Tooltip(
          message: 'بازگشت به صفحه اصلی',
          decoration: BoxDecoration(
              color: Colors.grey[700], borderRadius: BorderRadius.circular(10)),
          showDuration: Duration(milliseconds: 2000),
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 25,
                color: kPrimaryColor,
              ),
              splashColor: kPrimaryColor,
            ),
          ),
        ),
      ),
      body: GetBuilder<AdminPanelController>(
        builder: (state) => state.whoDidNotReceive != null
            ? Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: ListView.builder(
                        itemCount: state.whoDidNotReceive.length + 1,
                        itemBuilder: (context, index) {
                          return item(context, index);
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                                text: adminPanelController.whoDidNotNameAll));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('کپی شد'),
                                action: SnackBarAction(
                                  label: 'باشه',
                                  onPressed: () {
                                    // Code to execute.
                                  },
                                ),
                              ),
                            );
                          },
                          child: Text('کپی کردن همه اسامی'),
                          color: kPrimaryColor,
                          textColor: Colors.white,
                          splashColor: kErrorColor,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        MediaQuery.of(context).size.shortestSide > 600
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(
                                          text: adminPanelController
                                              .whoDidNotName10));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: const Text('کپی شد'),
                                          action: SnackBarAction(
                                            label: 'باشه',
                                            onPressed: () {
                                              // Code to execute.
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text('کپی کردن اسامی دهم'),
                                    color: kPrimaryColor,
                                    textColor: Colors.white,
                                    splashColor: kErrorColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(
                                          text: adminPanelController
                                              .whoDidNotName11));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: const Text('کپی شد'),
                                          action: SnackBarAction(
                                            label: 'باشه',
                                            onPressed: () {
                                              // Code to execute.
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text('کپی کردن اسامی یازدهم'),
                                    color: kPrimaryColor,
                                    splashColor: kErrorColor,
                                    textColor: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(
                                          text: adminPanelController
                                              .whoDidNotName12));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: const Text('کپی شد'),
                                          action: SnackBarAction(
                                            label: 'باشه',
                                            onPressed: () {
                                              // Code to execute.
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text('کپی کردن اسامی دوازدهم'),
                                    color: kPrimaryColor,
                                    textColor: Colors.white,
                                    splashColor: kErrorColor,
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(
                                          text: adminPanelController
                                              .whoDidNotName10));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: const Text('کپی شد'),
                                          action: SnackBarAction(
                                            label: 'باشه',
                                            onPressed: () {
                                              // Code to execute.
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text('کپی کردن اسامی دهم'),
                                    color: kPrimaryColor,
                                    textColor: Colors.white,
                                    splashColor: kErrorColor,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(
                                          text: adminPanelController
                                              .whoDidNotName11));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: const Text('کپی شد'),
                                          action: SnackBarAction(
                                            label: 'باشه',
                                            onPressed: () {
                                              // Code to execute.
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text('کپی کردن اسامی یازدهم'),
                                    color: kPrimaryColor,
                                    splashColor: kErrorColor,
                                    textColor: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(
                                          text: adminPanelController
                                              .whoDidNotName12));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: const Text('کپی شد'),
                                          action: SnackBarAction(
                                            label: 'باشه',
                                            onPressed: () {
                                              // Code to execute.
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text('کپی کردن اسامی دوازدهم'),
                                    color: kPrimaryColor,
                                    textColor: Colors.white,
                                    splashColor: kErrorColor,
                                  ),
                                ],
                              )
                      ],
                    ),
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

Widget item(context, index) {
  final AdminPanelController adminPanelController =
      Get.put(AdminPanelController());
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    color:
        index.isEven ? Theme.of(context).scaffoldBackgroundColor : Colors.white,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SelectableText(
                    index == 0 ? 'شماره' : index.toString(),
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  SizedBox(
                    width: index == 0 ? 150 : 75,
                  ),
                  SelectableText(
                    index == 0
                        ? 'نام'
                        : adminPanelController.whoDidNotReceive[index - 1]
                                ['name']
                            .toString(),
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  SizedBox(
                    width: index == 0 ? 375 : 350,
                  ),
                  SelectableText(
                    index == 0
                        ? 'کدملی'
                        : adminPanelController.whoDidNotReceive[index - 1]
                                ['national_code']
                            .toString(),
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  SizedBox(
                    width: index == 0 ? 525 : 550,
                  ),
                  SelectableText(
                    index == 0
                        ? 'شماره کلاس'
                        : adminPanelController.whoDidNotReceive[index - 1]
                                ['class_number']
                            .toString(),
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
