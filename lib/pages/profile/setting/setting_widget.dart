import 'package:appbloc/common/values/colors.dart';
import 'package:appbloc/pages/application/bloc/app_bloc.dart';
import 'package:appbloc/pages/home/bloc/homepage_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/constant.dart';
import '../../../global.dart';
import '../../sigin/bloc/signin_bloc.dart';
import '../../sigin/bloc/signin_event.dart';
import '../../sigin/bloc/signin_state.dart';

AppBar settingAppBar(BuildContext context) {
  return AppBar(
    leading: GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const Icon(Icons.arrow_back_ios, color: Colors.black),
    ),
    title: const Text(
      'Setting',
      style: TextStyle(color: AppColors.primaryText),
    ),
    centerTitle: true,
  );
}

Widget settingSigout(BuildContext context) {
  return GestureDetector(
    onTap: () => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm logout"),
        content: GestureDetector(
          onTap: () {
            Global.storageService.remove(STORAGE_USER_PROFILE_KEY);
            Navigator.pushNamedAndRemoveUntil(
                context, 'sigin', (route) => false);
          },
          child: const Text(
            "Confirm Logout",
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancle')),
          TextButton(
              onPressed: () {
                Global.storageService.remove(STORAGE_USER_TOKEN_KEY);
                context.read<AppBloc>().add(const TriggerAppEvent(0));
                context.read<SignInBloc>().add(const EmailEvent(''));
                context.read<SignInBloc>().add(const PasswordEvent(''));
                context.read<HomepageBloc>().add(HomePageDot(0));
                Navigator.pushNamedAndRemoveUntil(
                    context, 'sigin', (route) => false);
              },
              child: const Text('Confirm'))
        ],
      ),
    ),
    child: Container(
      height: 70.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/icons/Logout.png'),
              fit: BoxFit.fitHeight)),
    ),
  );
}
