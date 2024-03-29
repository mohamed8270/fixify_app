// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixify_app/authentication/LogInPage.dart';
import 'package:fixify_app/types/Auth_Type_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // handleAuthState()
  // signInwithGoogle()
  // signOut()

  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;

  getProfileImage() {
    if (FirebaseAuth.instance.currentUser!.photoURL != null) {
      return Image.network(
        FirebaseAuth.instance.currentUser!.photoURL!,
        height: 100,
        width: 100,
      );
    } else {
      return const Icon(
        Icons.account_circle,
        size: 100,
      );
    }
  }

  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const AuthenticationTypePage();
        } else {
          return const LogInPage();
        }
      },
    );
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // ignore: non_constant_identifier_names
    final Credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    return await FirebaseAuth.instance.signInWithCredential(Credential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
