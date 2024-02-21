// ignore_for_file: file_names

import 'package:fixify_app/Onboarding%20Screens/onboard.dart';
import 'package:fixify_app/authentication/LogInPage.dart';
import 'package:fixify_app/constants/Openning_Page.dart';
import 'package:fixify_app/constants/theme.dart';
import 'package:fixify_app/main.dart';
import 'package:fixify_app/technician/components/Technician_Inner_Screen.dart';
import 'package:fixify_app/technician/interface/Technician_Bottom_NavBar.dart';
import 'package:fixify_app/technician/screens/Technician_Home_Page.dart.dart';
import 'package:fixify_app/technician/screens/Technician_Profile_Page.dart';
import 'package:fixify_app/types/Auth_Type_Page.dart';
import 'package:fixify_app/user/interface/UserBottomNavBar.dart';
import 'package:fixify_app/user/screens/HomePage.dart';
import 'package:fixify_app/user/screens/UserPost.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fixify App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: fViolet),
        useMaterial3: true,
      ),
      routes: {
        "UserHome": (c) => const UserHomePage(),
        "UserPost": (c) => const UserPostScreen(),
        "LogInPage": (c) => const LogInPage(),
        "UserBottomNavBar": (c) => const UserNavigationBar(),
        "TechnicianBottomNavBar": (c) => const TechnicianBottomNavBar(),
        "UserTypeLogin": (c) => const AuthenticationTypePage(),
        "TechnicianInnerPage": (c) => const TechnicianInnerScreen(),
        "TechnicianHomePage": (c) => const TechnicianHomePage(),
        "TechnicianProfilePage": (c) => const TechnicianProfile(),
        "OpenningPage": (c) => const OpenningPage(),
        "onBoardingScreen": (c) => const OnBoardingScreen(),
      },
      home: isviewed != 0 ? const OnBoardingScreen() : const OpenningPage(),
    );
  }
}
