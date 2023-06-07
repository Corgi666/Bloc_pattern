import 'package:appbloc/pages/register/bloc/registering_bloc.dart';
import 'package:appbloc/pages/sigin/bloc/signin_bloc.dart';
import 'package:appbloc/pages/welcome/bloc/welcom_bloc.dart';
// import 'package:appbloc/testbloc/app_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProvider {
  static get AllBlocProvier => [
        // BlocProvider(create: (context) => AppBlocs()),
        BlocProvider(lazy: false, create: (context) => WelcomBloc()),
        BlocProvider(lazy: false, create: (context) => SignInBloc()),
        BlocProvider(lazy: false, create: (context) => RegisteringBloc()),
      ];
}
