import 'package:appbloc/common/bloc_provider.dart';
import 'package:appbloc/common/routes_helper.dart';
import 'package:appbloc/common/theme/theme_confige.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global.dart';
import 'pages/welcome/welcome.dart';

void main(List<String> args) async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: AppBlocProvider.allBlocProvier,
      child: ScreenUtilInit(
        // designSize: Size(width, height),
        builder: (context, childe) => MaterialApp(
          routes: routeHelper,
          debugShowCheckedModeBanner: false,
          home: navigatorRoutes(),
          theme: Themes.themeData,
        ),
      ),
    );
  }
}
