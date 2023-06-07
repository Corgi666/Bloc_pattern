import 'package:appbloc/pages/application/application_page.dart';

import '../pages/register/register.dart';
import '../pages/sigin/sigin.dart';

final routeHelper = {
  'sigin': (context) => const SigIn(),
  'register': (context) => const Register(),
  'application': (context) => const ApplicationPage(),
};
