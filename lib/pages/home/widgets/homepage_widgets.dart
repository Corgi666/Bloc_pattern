// ignore_for_file: prefer_const_constructors

import 'package:appbloc/common/values/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/bloc/app_bloc.dart';
import '../bloc/homepage_bloc.dart';

Widget _reuseableSlideWidget(int index) {
  final List<String> img = ['Art.png', 'Image(1).png', 'Image(2).png'];
  return Container(
    width: 160.w,
    height: 325.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: DecorationImage(
            image: AssetImage(
              "assets/icons/${img[index]}",
            ),
            fit: BoxFit.contain)),
  );
}

Widget _reusableTextMenu(
    {required String text,
    Color? color = AppColors.primaryText,
    FontWeight? fontWeight = FontWeight.w300,
    double? fontsize = 16}) {
  return Text(
    text,
    style: TextStyle(color: color, fontWeight: fontWeight, fontSize: fontsize),
  );
}

Widget _reusableSubTextMenu(
    {required String text,
    FontWeight? fontWeight = FontWeight.w300,
    double? fontsize = 16,
    required int position,
    required int choose}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
    margin: EdgeInsets.only(right: 5.w, top: 15.h),
    decoration: BoxDecoration(
        color: choose == position ? AppColors.primaryElement : Colors.white,
        borderRadius: BorderRadius.circular(5.w)),
    child: Text(
      text,
      style: TextStyle(
          color: choose == position
              ? Colors.white
              : AppColors.primaryThreeElementText,
          fontWeight: fontWeight,
          fontSize: fontsize),
    ),
  );
}

SliverAppBar buildAppbar() {
  return SliverAppBar(
    pinned: true,
    leading: SizedBox(
        width: 10.w, height: 10.h, child: Image.asset('assets/icons/menu.png')),
    actions: [
      BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => context.read<AppBloc>().add(TriggerAppEvent(4)),
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage('assets/icons/person.png')),
              ),
            ),
          );
        },
      )
    ],
  );
}

Widget homePageText(
    {required String text, Color color = Colors.black, double top = 0}) {
  return Container(
      margin: EdgeInsets.only(top: top.h),
      child: Text(text, style: TextStyle(color: color, fontSize: 24.sp)));
}

Widget searchView() {
  return SizedBox(
    width: double.maxFinite,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 280.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: BorderRadius.circular(15.h),
              border: Border.all(color: AppColors.primaryFourElementText)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w),
                width: 16.w,
                height: 16.w,
                child: Image.asset('assets/icons/search.png'),
              ),
              Container(
                width: 240.w,
                height: 40.h,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                      hintText: 'search your course',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      hintStyle:
                          TextStyle(color: Colors.grey.withOpacity(0.5))),
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Avenir",
                      fontSize: 14.sp),
                  autocorrect: false,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 30.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            'assets/icons/options.png',
          ),
        ),
      ],
    ),
  );
}

Widget sliderView() {
  PageController pageController = PageController(
    initialPage: 0,
  );

  return BlocBuilder<HomepageBloc, HomepageState>(
    builder: (context, state) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 325.w,
            height: 160.h,
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                // print(index);
                // state.index = index;
                // print('StatePage = ${state.page}');
                // BlocProvider.of<HomepageBloc>(context).add(HomepageEvent());
                context.read<HomepageBloc>().add(HomePageDot(index));
                // print(state.index);
              },
              children: [
                _reuseableSlideWidget(0),
                _reuseableSlideWidget(1),
                _reuseableSlideWidget(2),
              ],
            ),
          ),
          DotsIndicator(
            dotsCount: 3,
            position: state.index!.toDouble(),
            decorator: DotsDecorator(
                color: AppColors.primaryThreeElementText,
                activeColor: AppColors.primaryElement,
                size: Size.square(5),
                activeSize: Size(17.0.w, 5.0.h),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
          )
        ],
      );
    },
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _reusableTextMenu(
                text: 'Choose your course', fontWeight: FontWeight.w500),
            GestureDetector(
                onTap: () => null, child: _reusableTextMenu(text: 'See All')),
          ],
        ),
      ),
      BlocBuilder<HomepageBloc, HomepageState>(
        builder: (context, state) {
          return Row(
            children: [
              GestureDetector(
                onTap: () =>
                    context.read<HomepageBloc>().add(HomePageChoose(0)),
                child: _reusableSubTextMenu(
                    text: 'All', choose: state.choose, position: 0),
              ),
              GestureDetector(
                onTap: () =>
                    context.read<HomepageBloc>().add(HomePageChoose(1)),
                child: _reusableSubTextMenu(
                    text: 'Poppular', choose: state.choose, position: 1),
              ),
              GestureDetector(
                onTap: () =>
                    context.read<HomepageBloc>().add(HomePageChoose(2)),
                child: _reusableSubTextMenu(
                    text: 'Newest', choose: state.choose, position: 2),
              )
            ],
          );
        },
      )
    ],
  );
}
