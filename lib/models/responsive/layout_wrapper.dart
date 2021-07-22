import 'package:flutter/material.dart';
import 'package:ghods/screens/home/home.dart';
import 'package:ghods/models/responsive/screen_type_layout.dart';

class LayoutWrapper extends StatefulWidget {
  @override
  _LayoutWrapperState createState() => _LayoutWrapperState();
}

class _LayoutWrapperState extends State<LayoutWrapper> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(mobile: MobileHomePage(), tablet: HomePage());
  }
}
