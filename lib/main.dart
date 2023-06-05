import 'package:appbloc/common/bloc_provider.dart';
import 'package:appbloc/common/theme/theme_confige.dart';
import 'package:appbloc/firebase_options.dart';
import 'package:appbloc/pages/register/register.dart';
import 'package:appbloc/pages/sigin/sigin.dart';
import 'package:appbloc/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.AllBlocProvier,
      child: ScreenUtilInit(
        builder: (context, childe) => MaterialApp(
          routes: {
            'sigin': (context) => const SigIn(),
            'register': (context) => const Register(),
          },
          debugShowCheckedModeBanner: false,
          home: const Welcome(),
          theme: Themes.themeData,
        ),
      ),
    );
  }
}
