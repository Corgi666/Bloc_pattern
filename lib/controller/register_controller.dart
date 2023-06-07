import 'package:appbloc/common/widgets/flutter_toast.dart';
import 'package:appbloc/pages/register/bloc/registering_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  void handleEmailRegister() async {
    final state = context.read<RegisteringBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "Username can't be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can't be empty");
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can't be empty");
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password comfirmation is wrong ");
    }

    try {
      final creadential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (creadential.user != null) {
        await creadential.user?.sendEmailVerification();
        await creadential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                "An email has been sent to your registered email. To activate it please check your email box and click on the link");
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provider is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The email is already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email id is invalid");
      }
    }
  }
}
