import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/screens/intro/intro.dart';
import 'package:adnproject/screens/information/fill_info.dart';
import 'package:adnproject/screens/select_image/select_image.dart';
import 'package:adnproject/screens/information/fill_email_phone.dart';
import 'package:adnproject/screens/information/fill_travel.dart';
import 'package:adnproject/screens/pop_up/success.dart';


import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routesMap = <String, WidgetBuilder>{
  RouteStrings.home: (BuildContext context) => IntroRoute(),
  RouteStrings.selectImage: (BuildContext context) => SelectImageRoute(),
  RouteStrings.fillForm: (BuildContext context) => FillInforRoute(),
  RouteStrings.fillFormEmailPhone: (BuildContext context) => FillEmailPhoneRoute(),
  RouteStrings.fillFormTravel: (BuildContext context) => FillTravelRoute(),
  RouteStrings.showPopup: (BuildContext context) => PopupDialog(),

};
