// ignore_for_file: file_names, unused_import

import 'package:fixify_app/authentication/Authentication_service.dart';
import 'package:fixify_app/categoryCard.dart';
import 'package:fixify_app/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String img =
      'https://cdni.iconscout.com/illustration/premium/thumb/login-page-4468581-3783954.png?f=webp';

  String icnlink = 'https://www.svgrepo.com/show/475656/google-color.svg';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: fWhite,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenSize.height * 0.3,
                width: screenSize.width * 0.8,
                decoration: BoxDecoration(
                  color: fWhite,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(20),
              Text(
                "Fix Man",
                style: GoogleFonts.poppins(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: fViolet,
                ),
              ),
              const Gap(10),
              Text(
                "A fun twist on fix with a sense of efficiency,\nCall towards our app to get lot of services\nwith our application",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: fBlack.withOpacity(0.3),
                ),
              ),
              const Gap(30),
              CatergoryContainer(
                icnlink: icnlink,
                click: () {
                  AuthService().signInWithGoogle();
                },
                height: screenSize.height * 0.06,
                width: screenSize.width * 0.5,
                color: fBlack.withOpacity(0.03),
                txt: "Login to continue",
                txtcolor: fBlack,
              )
            ],
          ),
        ),
      ),
    );
  }
}
