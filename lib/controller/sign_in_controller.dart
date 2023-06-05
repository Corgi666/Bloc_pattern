import 'package:appbloc/common/widgets/flutter_toast.dart';
import 'package:appbloc/pages/sigin/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;

        String emailAdress = state.email;
        String password = state.password;

        if (password.isEmpty && emailAdress.isEmpty) {
          toastInfo(msg: "Your need to fill emain and password");
          return;
        } else if (emailAdress.isEmpty) {
          toastInfo(msg: "Your need to fill email adress");
          return;
        } else if (password.isEmpty) {
          //
          toastInfo(msg: "Your need to fill password");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAdress, password: password);
          if (credential.user == null) {
            //
            print('user is null');
          }
          if (!credential.user!.emailVerified) {
            //
            print('User not found');
          }

          var user = credential.user;
          if (user != null) {
            print(user.toString());
          } else {
            // user is exited
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for that email");
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password provided for that user.");
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Your email wrong format.");
            return;
          }
        }
      }
    } catch (e) {}
  }
}
