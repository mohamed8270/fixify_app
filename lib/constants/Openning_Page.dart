// ignore_for_file: file_names, deprecated_member_use

import 'dart:async';

import 'package:fixify_app/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OpenningPage extends StatefulWidget {
  const OpenningPage({super.key});

  @override
  State<OpenningPage> createState() => _OpenningPageState();
}

class _OpenningPageState extends State<OpenningPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Get.toNamed("UserTypeLogin");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fViolet,
      body: SafeArea(
        child: Center(
          child: SvgPicture.network(
            'https://www.svgrepo.com/show/492009/wrench-23.svg',
            height: 200,
            width: 200,
            color: fWhite,
          ),
        ),
      ),
    );
  }
}
