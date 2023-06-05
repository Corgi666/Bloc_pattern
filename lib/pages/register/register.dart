import 'package:appbloc/common/values/colors.dart';
import 'package:appbloc/pages/sigin/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          'Sign Up',
          style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal),
        ),
        bottom: PreferredSize(
            child: Container(
              child: Container(
                color: AppColors.primarySecondaryBackground,
                height: 1.0,
              ),
            ),
            preferredSize: Size.fromHeight(1.0)),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 50.h,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 20.h),
                    child: reuseableText(
                        'Enter you detials below & free sign up'))),
            Container(
              margin: EdgeInsets.only(top: 66.h),
              padding: EdgeInsets.only(left: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reuseableText('User name'),
                  SizedBox(height: 5.h),
                  buildTextFeild('Enter your user name ', 'email', 'user',
                      (value) {
                    // context.read<SignInBloc>().add(EmailEvent(value));
                  }),
                  reuseableText('Email'),
                  SizedBox(height: 5.h),
                  buildTextFeild('Enter your email address', 'email', 'user',
                      (value) {
                    // context.read<SignInBloc>().add(EmailEvent(value));
                  }),
                  reuseableText('Password'),
                  SizedBox(height: 5.h),
                  buildTextFeild('Enter your password', 'password', 'lock',
                      (value) {
                    // context.read<SignInBloc>().add(EmailEvent(value));
                  }),
                  reuseableText('Password'),
                  SizedBox(height: 5.w),
                  buildTextFeild(
                      'Enter your Confirm  Password', 'password', 'lock',
                      (value) {
                    // context.read<SignInBloc>().add(PasswordEvent(value));
                  }),
                  reuseableText(
                      'By creating an account you have to agree with our them & condication'),
                ],
              ),
            ),
            buildLoginAndRegButton('Sign Up', 'Login', () {
              // SignInController(context: context).handleSignIn('email');
            }),
          ],
        ),
      ),
    );
  }
}
