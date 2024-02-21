// ignore_for_file: deprecated_member_use, file_names

import 'package:fixify_app/constants/theme.dart';
import 'package:fixify_app/technician/screens/Technician_Home_Page.dart.dart';
import 'package:fixify_app/technician/screens/Technician_Profile_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TechnicianBottomNavBar extends StatefulWidget {
  const TechnicianBottomNavBar({super.key});

  @override
  State<TechnicianBottomNavBar> createState() => _TechnicianBottomNavBarState();
}

class _TechnicianBottomNavBarState extends State<TechnicianBottomNavBar> {
  int currentIndex = 0;

  final screens = [
    const TechnicianHomePage(),
    const TechnicianProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: fBlack.withOpacity(0.3),
              width: 0.15,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: fWhite,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          iconSize: 18,
          currentIndex: currentIndex,
          selectedLabelStyle: const TextStyle(
            color: fViolet,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: fBlack.withOpacity(0.3),
          selectedItemColor: fViolet,
          unselectedLabelStyle: TextStyle(
            color: fBlack.withOpacity(0.3),
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.network(
                'https://www.svgrepo.com/show/524643/home-angle-2.svg',
                color: fBlack.withOpacity(0.4),
              ),
              activeIcon: SvgPicture.network(
                'https://www.svgrepo.com/show/524643/home-angle-2.svg',
                color: fViolet,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.network(
                'https://www.svgrepo.com/show/498298/profile.svg',
                color: fBlack.withOpacity(0.4),
              ),
              activeIcon: SvgPicture.network(
                'https://www.svgrepo.com/show/498298/profile.svg',
                color: fViolet,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
