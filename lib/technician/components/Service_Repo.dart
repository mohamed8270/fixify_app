// ignore_for_file: file_names

import 'package:fixify_app/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceDetailsRepo extends StatelessWidget {
  const ServiceDetailsRepo({
    super.key,
    required this.txt1,
    required this.txt2,
  });

  final String txt1;
  final String txt2;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Container(
        height: 100,
        // width: 100,
        decoration: BoxDecoration(
          color: fWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border(
            top: BorderSide(
              width: 2,
              color: fBlack.withOpacity(0.1),
            ),
            bottom: BorderSide(
              width: 2,
              color: fBlack.withOpacity(0.1),
            ),
            right: BorderSide(
              width: 2,
              color: fBlack.withOpacity(0.1),
            ),
            left: BorderSide(
              width: 2,
              color: fBlack.withOpacity(0.1),
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 9, right: 9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                txt1,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: fBlack.withOpacity(0.7),
                ),
              ),
              const Gap(10),
              Text(
                txt2,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: fBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
