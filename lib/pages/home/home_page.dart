import 'package:appbloc/common/values/colors.dart';
import 'package:appbloc/pages/home/widgets/homepage_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: CustomScrollView(
          slivers: [
            buildAppbar(),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homePageText(text: 'Hello', color: Colors.grey, top: 20),
                  homePageText(text: 'Anuchit', top: 10),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: searchView(),
            ),
            SliverToBoxAdapter(
              child: sliderView(),
            ),
            SliverAppBar(
              toolbarHeight: 110,
              pinned: true,
              title: menuView(),
            ),
            SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                sliver: sliverGrid()),
          ],
        ),
      ),
    );
  }
}
