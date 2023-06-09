import 'package:appbloc/common/values/colors.dart';
import 'package:appbloc/pages/home/home_page.dart';
import 'package:appbloc/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final List<BottomNavigationBarItem> bottomItem = [
  BottomNavigationBarItem(
      label: 'home',
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset('assets/icons/home.png'),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/home.png",
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: 'search',
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset('assets/icons/search.png'),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/search.png",
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: 'Course',
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset('assets/icons/play-circle1.png'),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/play-circle1.png",
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: 'chat',
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset('assets/icons/message-circle.png'),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/message-circle.png",
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: 'profile',
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset('assets/icons/person2.png'),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/person2.png",
          color: AppColors.primaryElement,
        ),
      ))
];

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePageScreen(),
    Center(child: Text('Search')),
    Center(child: Text('Course')),
    Center(
      child: Text('Chat'),
    ),
    const ProfileScreen()
  ];

  return _widget[index];
}
