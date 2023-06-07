import 'package:appbloc/common/values/constant.dart';
import 'package:appbloc/pages/welcome/bloc/welcom_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appbloc/global.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          body: BlocBuilder<WelcomBloc, WelcomState>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  // print(index);
                  state.page = index;
                  // print('StatePage = ${state.page}');
                  BlocProvider.of<WelcomBloc>(context).add(WelcomEvent());
                },
                children: [
                  _page(
                      0,
                      context,
                      'Next',
                      'First See Learing',
                      'Forget about a for of paper all knowledge in one learing',
                      'assets/images/reading.png'),
                  _page(
                      1,
                      context,
                      'Next',
                      'Connect With Everyone',
                      'Always keep in touch with your turto & friend. Let\'s get connected!',
                      'assets/images/boy.png'),
                  _page(
                      2,
                      context,
                      'Get Started',
                      'Always Fascinated Learing',
                      'Anywhere, anytime. The time is at your discretion so study whenever you want',
                      'assets/images/man.png')
                ],
              ),
              Positioned(
                bottom: 80.h,
                child: DotsIndicator(
                  position: state.page.toDouble(),
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                      color: Colors.grey,
                      size: const Size.square(8.0),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              )
            ],
          ),
        );
      })),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subtile, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.w),
          child: Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 24.sp),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.w),
          width: 375.w,
          child: Text(
            subtile,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5), fontSize: 14.sp),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 2) {
              pageController.animateToPage(index + 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              Global.storageService
                  .setBool(STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              print(
                  'The device is ${Global.storageService.getDeviceFirstOpen()}');
              Navigator.of(context).pushNamedAndRemoveUntil(
                'sigin',
                (route) => false,
              );
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 70.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1)),
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
