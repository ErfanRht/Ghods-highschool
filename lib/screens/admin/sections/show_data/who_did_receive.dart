import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghods/constants/colors.dart';
import 'package:ghods/controllers/admin_panel_controller.dart';

class WhoDid extends StatelessWidget {
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
          'مشخصات کسانی که کارنامه خود را دریافت کرده اند',
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
        builder: (state) => state.whoDidReceive != null
            ? Scrollbar(
                isAlwaysShown: true,
                child: ListView.builder(
                  itemCount: state.whoDidReceive.length + 1,
                  itemBuilder: (context, index) {
                    return item(context, index);
                  },
                ),
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
                        : adminPanelController.whoDidReceive[index - 1]['name']
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
                        : adminPanelController.whoDidReceive[index - 1]
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
                        : adminPanelController.whoDidReceive[index - 1]
                                ['class_number']
                            .toString(),
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  )
                ],
              ),
            ),
            Padding(
              padding: index == 0
                  ? EdgeInsets.only(top: 15)
                  : EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: index == 0 ? 675 : 650,
                  ),
                  SelectableText(
                    index == 0
                        ? 'شماره تلفن'
                        : adminPanelController.whoDidReceive[index - 1]['phone']
                            .toString(),
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ),
                  index != 0
                      ? IconButton(
                          icon: Icon(
                            Icons.copy,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                                text: adminPanelController
                                    .whoDidReceive[index - 1]['phone']));
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
                          })
                      : Text(''),
                ],
              ),
            ),
            Padding(
              padding: index == 0
                  ? EdgeInsets.only(top: 15)
                  : EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: index == 0 ? 900 : 875,
                  ),
                  SelectableText(
                    index == 0
                        ? 'کدپستی'
                        : adminPanelController.whoDidReceive[index - 1]
                                ['postal_code']
                            .toString(),
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ),
                  index != 0
                      ? IconButton(
                          icon: Icon(
                            Icons.copy,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                                text: adminPanelController
                                    .whoDidReceive[index - 1]['postal_code']));
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
                          })
                      : Text(''),
                ],
              ),
            ),
            Padding(
              padding: index == 0
                  ? EdgeInsets.only(top: 15)
                  : EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: 1100,
                  ),
                  SelectableText(
                    index == 0
                        ? 'آدرس محل سکونت'
                        : adminPanelController.whoDidReceive[index - 1]
                                ['address']
                            .toString(),
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ),
                  index != 0
                      ? IconButton(
                          icon: Icon(
                            Icons.copy,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                                text: adminPanelController
                                    .whoDidReceive[index - 1]['address']));
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
                          })
                      : Text(''),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}
