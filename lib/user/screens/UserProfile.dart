// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixify_app/authentication/Authentication_service.dart';
import 'package:fixify_app/constants/theme.dart';
import 'package:fixify_app/user/components/customButton.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: fBlack.withOpacity(0.03),
                child: ClipOval(
                  child: Image.network(
                    FirebaseAuth.instance.currentUser!.photoURL!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(20),
              Text(
                FirebaseAuth.instance.currentUser!.displayName!,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: fViolet,
                ),
              ),
              const Gap(10),
              Text(
                FirebaseAuth.instance.currentUser!.email!,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: fBlack.withOpacity(0.5),
                ),
              ),
              const Gap(20),
              CustomButton(
                height: screenSize.height * 0.06,
                width: screenSize.width * 0.4,
                boxcolor: fViolet,
                txt: 'SignOut',
                txtcolor: fWhite,
                click: () {
                  AuthService().signOut();
                  Get.toNamed("LogInPage");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
