import 'package:appbloc/common/values/colors.dart';
import 'package:appbloc/pages/sigin/bloc/signin_bloc.dart';
import 'package:appbloc/pages/sigin/bloc/signin_event.dart';
import 'package:appbloc/pages/sigin/bloc/signin_state.dart';
import 'package:appbloc/controller/sign_in_controller.dart';
import 'package:appbloc/pages/sigin/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigIn extends StatefulWidget {
  const SigIn({super.key});

  @override
  State<SigIn> createState() => _SigInState();
}

class _SigInState extends State<SigIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: ((context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal),
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: AppColors.primarySecondaryBackground,
                height: 1.0,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 50.h,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThirdPartyLogin(context),
              Center(child: reuseableText('Or use your email account login')),
              Container(
                margin: EdgeInsets.only(top: 66.h),
                padding: EdgeInsets.only(left: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reuseableText('Email'),
                    SizedBox(height: 5.h),
                    buildTextFeild('Enter your email address', 'email', 'user',
                        (value) {
                      context.read<SignInBloc>().add(EmailEvent(value));
                    }),
                    reuseableText('Password'),
                    SizedBox(height: 5.w),
                    buildTextFeild('Enter your Password', 'password', 'lock',
                        (value) {
                      context.read<SignInBloc>().add(PasswordEvent(value));
                    }),
                  ],
                ),
              ),
              forgotPassword(),
              buildLoginAndRegButton('Login', 'Login', () async {
                await SignInController(context: context).handleSignIn('email');
              }),
              buildLoginAndRegButton('Register', 'register', () {
                Navigator.of(context).pushNamed('register');
              })
            ],
          ),
        ),
      );
    }));
  }
}
