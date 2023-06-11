import 'package:appbloc/common/values/colors.dart';
import 'package:appbloc/pages/profile/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomScrollView(
        slivers: [
          profileAppbar(),
          SliverToBoxAdapter(child: profileProfile()),
          SliverToBoxAdapter(child: profileCourse()),
          SliverToBoxAdapter(
            child: profileMenu(context),
          )
        ],
      ),
    );
  }
}
