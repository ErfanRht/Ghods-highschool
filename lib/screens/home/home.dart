import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghods/constants/colors.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:ghods/screens/home/card/card.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));
    return Scaffold(
        backgroundColor: Color(0xffFCFDFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'سامانه دریافت رمز عبور پادا دبیرستان قدس',
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Stack(
          children: [
            Center(child: Image.asset('assets/images/bodyBG.png')),
            Center(child: HomeCard()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          html.window
                              .open('https://ErfanRht.GitHub.io', '_blank');
                        },
                        child: Text(
                          ' Erfan Rahmati ',
                          style: GoogleFonts.rubik(
                              color: kPrimaryColor,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Text(
                        'Copyright ©2021 All rights reserved | This site is developed by ',
                        style: GoogleFonts.rubik(
                            color: Colors.grey,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class MobileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));
    return Scaffold(
        backgroundColor: Color(0xffFCFDFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                'دبیرستان دخترانه قدس',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Center(child: Image.asset('assets/images/bodyBG.png')),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: MobileHomeCard(),
                )),
              ],
            ),
          ),
        ));
  }
}
