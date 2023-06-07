import 'package:appbloc/common/values/colors.dart';
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

final List<String> pageList = ['Home', 'Search', 'Course', 'Chat', 'Profile'];

Widget buildPage(int index) {
  return Center(child: Text(pageList[index]));
}