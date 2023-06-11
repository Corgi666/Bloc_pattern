import 'package:appbloc/global.dart';
import 'package:appbloc/pages/application/application_page.dart';
import 'package:appbloc/pages/profile/setting/setting_page.dart';
import 'package:appbloc/pages/welcome/welcome.dart';

import '../pages/register/register.dart';
import '../pages/sigin/sigin.dart';
import 'package:flutter/material.dart';

final routeHelper = {
  'sigin': (context) => const SigIn(),
  'register': (context) => const Register(),
  'application': (context) => const ApplicationPage(),
  'setting': (context) => const SettingScreen()
};

Widget navigatorRoutes() {
  // final bool isFirstTime = Global.storageService.getDeviceFirstOpen();

  final bool isLogin = Global.storageService.getIsLoggedIn();

  if (isLogin) {
    return const ApplicationPage();
  } else {
    return const Welcome();
  }
}
