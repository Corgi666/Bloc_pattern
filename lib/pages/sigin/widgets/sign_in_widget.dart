// ignore_for_file: prefer_const_constructors

import 'package:appbloc/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h, left: 40.w, right: 40.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        reuseableIcons('google'),
        reuseableIcons('apple'),
        reuseableIcons('facebook'),
      ],
    ),
  );
}

Widget reuseableIcons(String iconName) {
  return GestureDetector(
    onTap: () => null,
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/${iconName}.png'),
    ),
  );
}

Widget reuseableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(color: Colors.grey.withOpacity(0.5)),
    ),
  );
}

Widget buildTextFeild(String text, String textType, String iconName,
    void Function(String value)? func
    ) {
  return Container(
    width: 310.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      // color: Colors.red,
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(color: Colors.black),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset('assets/icons/${iconName}.png'),
        ),
        Container(
          width: 260.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: text,
                // border: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.transparent),
                // ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                // disabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.transparent),
                // ),
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5))),
            style: TextStyle(
                color: Colors.black, fontFamily: "Avenir", fontSize: 14.sp),
            autocorrect: false,
            obscureText: textType == 'password' ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(left: 25.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot password',
        style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            fontSize: 12.sp),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(String buttonName, String buttomType , void Function()? func) {
  return GestureDetector(
    onTap:  func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(
          left: 25.w, right: 25.w, top: buttomType == 'Login' ? 40.sp : 20.sp),
      decoration: BoxDecoration(
          color:
              buttomType == 'Login' ? AppColors.primaryElement : Colors.white,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
              color: buttomType == 'login'
                  ? Colors.transparent
                  : AppColors.primaryFourElementText),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color:
                  buttomType == 'Login' ? Colors.white : AppColors.primaryText),
        ),
      ),
    ),
  );
}
