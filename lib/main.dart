import 'package:adnproject/constants/routes.dart';
import 'package:flutter/material.dart';

import 'constants/strings.dart';
import 'constants/themes.dart';

void main() {
  runApp(ADNApp());
}

class ADNApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      initialRoute: RouteStrings.home,
      routes: routesMap,
      theme: AppThemes.lightTheme(),
    );
  }
}
