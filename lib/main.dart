import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ghods/models/responsive/layout_wrapper.dart';
import 'package:ghods/constants/colors.dart';
import 'package:ghods/constants/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('fa', '')],
      theme: ThemeData(
          fontFamily: 'Far-Yekan',
          primaryColor: kPrimaryColor,
          indicatorColor: Colors.white),
      debugShowCheckedModeBanner: false,
      initialRoute: home_route,
      routes: {
        home_route: (context) => LayoutWrapper(),
      },
    );
  }
}
