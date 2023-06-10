import 'package:appbloc/pages/application/bloc/app_bloc.dart';
import 'package:appbloc/pages/home/bloc/homepage_bloc.dart';
import 'package:appbloc/pages/register/bloc/registering_bloc.dart';
import 'package:appbloc/pages/sigin/bloc/signin_bloc.dart';
import 'package:appbloc/pages/welcome/bloc/welcom_bloc.dart';
// import 'package:appbloc/testbloc/app_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProvider {
  static get allBlocProvier => [
        // BlocProvider(create: (context) => AppBlocs()),
        BlocProvider(lazy: true, create: (context) => WelcomBloc()),
        BlocProvider(lazy: true, create: (context) => SignInBloc()),
        BlocProvider(lazy: true, create: (context) => RegisteringBloc()),
        BlocProvider(lazy: false, create: (context) => AppBloc()),
        BlocProvider(
          create: (context) => HomepageBloc(),
        )
      ];
}
