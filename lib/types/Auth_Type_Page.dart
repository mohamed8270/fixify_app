// ignore_for_file: file_names

import 'package:fixify_app/constants/theme.dart';
import 'package:fixify_app/types/LogIn_Type_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationTypePage extends StatefulWidget {
  const AuthenticationTypePage({super.key});

  @override
  State<AuthenticationTypePage> createState() => _AuthenticationTypePageState();
}

class _AuthenticationTypePageState extends State<AuthenticationTypePage> {
  void updateSelectedUserType(String userType) {
    setState(() {
      selectedType = userType;
    });
  }

  String selectedType = '';
  void slectedUserTypeNavigation(String userType) {
    setState(() {
      selectedType = userType;
    });

    if (selectedType == 'Home Person') {
      Get.toNamed("UserBottomNavBar");
    } else if (selectedType == 'Technician') {
      Get.toNamed("TechnicianBottomNavBar");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fWhite,
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  "Heartly welcome to our Fix Man app where you can get vast number of services for your sweet home!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: fBlack.withOpacity(0.3),
                  ),
                ),
                const Gap(30),
                Text(
                  "Please select your user type",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: fBlack.withOpacity(0.5),
                  ),
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogInTypeButton(
                      icnLink:
                          'https://www.svgrepo.com/show/532363/user-alt-1.svg',
                      logintxt: 'Home Person',
                      onTap: (userType) async {
                        slectedUserTypeNavigation(userType);
                        HapticFeedback.lightImpact();
                      },
                      selected: selectedType == 'Home Person',
                    ),
                    const Gap(30),
                    LogInTypeButton(
                      icnLink:
                          'https://www.svgrepo.com/show/241382/worker-wrench.svg',
                      logintxt: 'Technician',
                      onTap: (userType) async {
                        slectedUserTypeNavigation(userType);
                        HapticFeedback.lightImpact();
                      },
                      selected: selectedType == 'Technician',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
