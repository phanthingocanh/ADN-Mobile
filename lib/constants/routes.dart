import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/models/person_info.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:adnproject/screens/animation/slide.dart';
import 'package:adnproject/main.dart';
//final Map<String, WidgetBuilder> routesMap = <String, WidgetBuilder>{
//  RouteStrings.home: (BuildContext context) => IntroRoute(),
//  RouteStrings.selectMethod: (BuildContext context) => SelectMethodRoute(),
//  RouteStrings.fillForm: (BuildContext context) => FillInforRoute(),
//  RouteStrings.fillFormEmailPhone: (BuildContext context) => FillEmailPhoneRoute(),
//  RouteStrings.fillFormTravel: (BuildContext context) => FillTravelRoute(),
//  RouteStrings.fillFormHealth: (BuildContext context) => FillHealthRoute(),
//  RouteStrings.sendInfoForm: (BuildContext context) => SendInfoRoute(),
//  RouteStrings.showPopup: (BuildContext context) => PopupDialog(),
//  RouteStrings.fillFormSymptom: (BuildContext context) => FillSymptomRoute(),
//  RouteStrings.fillFormSchedule: (BuildContext context) => FillScheduleRoute(),
//  RouteStrings.fillFormMedicalHistorical: (BuildContext context) =>
//      FillMedicalHistoricalRoute(),
//};

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
      final PersonInfo args = settings.arguments;
//      print(args);
      return MySlide(
        builder: (context) {
          return FillInforRoute(person: args);
        },
      );
//      page = MySlide(builder: (BuildContext context) => FillInforRoute());
//      break;
    case RouteStrings.fillFormEmailPhone:
      final List args = settings.arguments;
//      print(args);
      return MySlide(
        builder: (context) {
          return FillEmailPhoneRoute(person: args[0], email: args[1], mobile: args[2]);
        },
      );
//      page = MySlide(builder: (BuildContext context) => FillEmailPhoneRoute());
//      break;
    case RouteStrings.fillFormTravel:
      final List args = settings.arguments;
//      print(args);
      return MySlide(
          builder: (context) {
            return FillTravelRoute(person: args[0], countries: args[1], isMoving: args[2], ngayden: args[3], ngaydi: args[4],noiden: args[5],noidi: args[6], phuongtien: args[7]);
          },
      );
//      page = MySlide(builder: (BuildContext context) => FillTravelRoute());
//      break;
    case RouteStrings.fillFormHealth:
      page = MySlide(builder: (BuildContext context) => FillHealthRoute());
      break;
    case RouteStrings.sendInfoForm:
      final List args = settings.arguments;

      // print(args[0]);
      return MySlide(
        builder: (context) {
          return SendInfoRoute(person: args[0], declare: args[1],);
        },
      );
//      page = MySlide(builder: (BuildContext context) => SendInfoRoute());
//      break;
    case RouteStrings.showPopup:
      page = MySlide(builder: (BuildContext context) => PopupDialog());
      break;
    case RouteStrings.fillFormSymptom:
      final List args = settings.arguments;

      // print(args[0]);
      return MySlide(
        builder: (context) {
          return FillSymptomRoute(person: args[0], declare: args[1], sot: args[2], ho: args[3], khoTho: args[4], viemPhoi: args[5], dauHong: args[6], metMoi:args[7]);
        },
      );

//      page = MySlide(builder: (BuildContext context) => FillSymptomRoute());
//      break;
    case RouteStrings.fillFormSchedule:
      final List args = settings.arguments;

      // print(args[0]);
      return MySlide(
        builder: (context) {
          return FillScheduleRoute(person: args[0], declare: args[1],nguoiBenh: args[2], nguoiTuNuocCoBenh: args[3], nguoiCoBieuHien: args[4]);
        },
      );
//      page = MySlide(builder: (BuildContext context) => FillScheduleRoute());
//      break;
    case RouteStrings.fillFormMedicalHistorical:
      final List args = settings.arguments;

      // print(args[0]);
      return MySlide(
        builder: (context) {
          return FillMedicalHistoricalRoute(
            person: args[0], declare: args[1],
            benhMauManTinh:args[2],
            benhPhoiManTinh:args[3],
            benhThanManTinh:args[4],
            benhTimMach:args[5],
            huyetApCao:args[6],
            suyGiamMienDich:args[7],
            ghepTangHoacXuong:args[8],
            tieuDuong:args[9],
            ungThu:args[10],
            mangThai:args[11],
            benhGanManTinh:args[12] ,
          );
        },
      );
//      page = MySlide(builder: (BuildContext context) => FillMedicalHistoricalRoute());
//      break;


  }
  return page;
}

//Route<dynamic> _getRoute(RouteSettings settings) {
//  return _buildRoute(settings, new FillEmailPhoneRoute(settings.arguments));
//  return null;
//}
//MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
//  return new MaterialPageRoute(
//    settings: settings,
//    builder: (context) => builder,
//  );
//}
