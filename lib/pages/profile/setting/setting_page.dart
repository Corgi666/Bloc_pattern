import 'package:appbloc/common/values/constant.dart';
import 'package:appbloc/pages/profile/setting/bloc/setting_bloc.dart';
import 'package:appbloc/pages/profile/setting/setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global.dart';
import '../../application/bloc/app_bloc.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingAppBar(context),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return Column(
              children: [settingSigout(context)],
            );
          },
        ),
      ),
    );
  }
}
