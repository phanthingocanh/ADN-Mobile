import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/screens/information/fill_email_phone.dart';
import 'package:adnproject/screens/information/fill_health.dart';
import 'package:adnproject/screens/information/fill_info.dart';
import 'package:adnproject/screens/information/fill_medical_historical.dart';
import 'package:adnproject/screens/information/fill_schedule.dart';
import 'package:adnproject/screens/information/fill_symptom.dart';
import 'package:adnproject/screens/information/fill_travel.dart';
import 'package:adnproject/screens/intro/intro.dart';
import 'package:adnproject/screens/pop_up/success.dart';
import 'package:adnproject/screens/select_method/select_method.dart';
import 'package:adnproject/screens/send_info/send_info.dart';
import 'package:flutter/widgets.dart';
import 'package:adnproject/screens/animation/slide.dart';
final Map<String, WidgetBuilder> routesMap = <String, WidgetBuilder>{
  RouteStrings.home: (BuildContext context) => IntroRoute(),
  RouteStrings.selectMethod: (BuildContext context) => SelectMethodRoute(),
  RouteStrings.fillForm: (BuildContext context) => FillInforRoute(),
  RouteStrings.fillFormEmailPhone: (BuildContext context) => FillEmailPhoneRoute(),
  RouteStrings.fillFormTravel: (BuildContext context) => FillTravelRoute(),
  RouteStrings.fillFormHealth: (BuildContext context) => FillHealthRoute(),
  RouteStrings.sendInfoForm: (BuildContext context) => SendInfoRoute(),
  RouteStrings.showPopup: (BuildContext context) => PopupDialog(),
  RouteStrings.fillFormSymptom: (BuildContext context) => FillSymptomRoute(),
  RouteStrings.fillFormSchedule: (BuildContext context) => FillScheduleRoute(),
  RouteStrings.fillFormMedicalHistorical: (BuildContext context) =>
      FillMedicalHistoricalRoute(),
};

Route onGenerateRoute(RouteSettings settings) {
  Route page;
  switch (settings.name) {
    case RouteStrings.home:
      page = MySlide(builder: (BuildContext context) => IntroRoute());
      break;
    case RouteStrings.selectMethod:
      page = MySlide(builder: (BuildContext context) => SelectMethodRoute());
      break;
    case RouteStrings.fillForm:
      page = MySlide(builder: (BuildContext context) => FillInforRoute());
      break;
    case RouteStrings.fillFormEmailPhone:
      page = MySlide(builder: (BuildContext context) => FillEmailPhoneRoute());
      break;
    case RouteStrings.fillFormTravel:
      page = MySlide(builder: (BuildContext context) => FillTravelRoute());
      break;
    case RouteStrings.fillFormHealth:
      page = MySlide(builder: (BuildContext context) => FillHealthRoute());
      break;
    case RouteStrings.sendInfoForm:
      page = MySlide(builder: (BuildContext context) => SendInfoRoute());
      break;
    case RouteStrings.showPopup:
      page = MySlide(builder: (BuildContext context) => PopupDialog());
      break;
    case RouteStrings.fillFormSymptom:
      page = MySlide(builder: (BuildContext context) => FillSymptomRoute());
      break;
    case RouteStrings.fillFormSchedule:
      page = MySlide(builder: (BuildContext context) => FillScheduleRoute());
      break;
    case RouteStrings.fillFormMedicalHistorical:
      page = MySlide(builder: (BuildContext context) => FillMedicalHistoricalRoute());
      break;


  }
  return page;
}
