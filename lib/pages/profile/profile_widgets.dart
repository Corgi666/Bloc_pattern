import 'package:appbloc/pages/profile/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';

// ? ReUseaBle Section
Widget _reuseableCourseBox({required String text, required String icon}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    height: 50.h,
    width: 90.w,
    decoration: BoxDecoration(
        color: AppColors.primaryElement,
        borderRadius: BorderRadius.circular(10.r)),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
          height: 20,
          child: Image.asset('assets/icons/${icon}'),
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 10.sp),
        )
      ],
    ),
  );
}

Widget _reuseableMenu(
    {required String text, required String icon, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 10.w),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(5)),
            child: Image.asset('assets/icons/${icon}.png'),
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}

// ! Build Section
SliverAppBar profileAppbar() {
  return SliverAppBar(
    leading: GestureDetector(
      onTap: () => null,
      child: SizedBox(
        child: Image.asset('assets/icons/menu.png',
            color: AppColors.primarySecondaryElementText),
      ),
    ),
    title: Text(
      'Profile',
      style: TextStyle(fontSize: 16.sp, color: AppColors.primaryText),
    ),
    actions: [
      SizedBox(
        child: Image.asset('assets/icons/more-vertical.png'),
      )
    ],
    centerTitle: true,
    pinned: true,
  );
}

Widget profileProfile() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.only(right: 6.w, bottom: 2.h),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          image: DecorationImage(
            image: AssetImage('assets/icons/headpic.png'),
          ),
        ),
        alignment: Alignment.bottomRight,
        child: Image(
            width: 15.w,
            height: 15.h,
            image: AssetImage('assets/icons/edit_3.png')),
      ),
      Text(
        'Anuchit',
        style: TextStyle(fontWeight: FontWeight.bold),
      )
    ],
  );
}

Widget profileCourse() {
  return Container(
    margin: EdgeInsets.only(top: 20.h, bottom: 30.h),
    child: Row(
      children: [_reuseableCourseBox(text: 'My Course', icon: 'Vector.png')],
    ),
  );
}

Widget profileMenu(BuildContext context) {
  Map imageInfo = <String, String>{
    "Setting": "settings",
    "Payment detial": "credit-card",
    "Archievement": "award",
    "Love": "heart(1)",
    "Reminders": "cube",
  };
  return Column(
    children: [
      ...List.generate(
          imageInfo.length,
          (index) => _reuseableMenu(
              onTap: () => imageInfo.keys.elementAt(index) == "Setting"
                  ? Navigator.pushNamed(context, 'setting')
                  : null,
              text: imageInfo.keys.elementAt(index),
              icon: imageInfo.values.elementAt(index)))
    ],
  );
}
