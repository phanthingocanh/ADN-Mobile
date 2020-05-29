import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/screens/information/fill_email_phone.dart';
import 'package:adnproject/screens/information/fill_info.dart';
import 'package:adnproject/screens/information/fill_travel.dart';
import 'package:adnproject/screens/intro/intro.dart';
import 'package:adnproject/screens/select_method/select_method.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routesMap = <String, WidgetBuilder>{
  RouteStrings.home: (BuildContext context) => IntroRoute(),
  RouteStrings.selectMethod: (BuildContext context) => SelectMethodRoute(),
  RouteStrings.fillForm: (BuildContext context) => FillInforRoute(),
  RouteStrings.fillFormEmailPhone: (BuildContext context) =>
      FillEmailPhoneRoute(),
  RouteStrings.fillFormTravel: (BuildContext context) => FillTravelRoute(),
};
