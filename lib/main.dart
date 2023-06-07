import 'package:appbloc/common/bloc_provider.dart';
import 'package:appbloc/common/routes_helper.dart';
import 'package:appbloc/common/theme/theme_confige.dart';
import 'package:appbloc/pages/application/application_page.dart';

import 'package:appbloc/pages/welcome/welcome.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global.dart';

void main(List<String> args) async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.allBlocProvier,
      child: ScreenUtilInit(
        builder: (context, childe) => MaterialApp(
          routes: routeHelper,
          debugShowCheckedModeBanner: false,
          home: Global.storageService.getIsLoggedIn()
              ? const ApplicationPage()
              : const Welcome(),
          theme: Themes.themeData,
        ),
      ),
    );
  }
}
