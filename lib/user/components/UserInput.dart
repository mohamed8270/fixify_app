// ignore_for_file: file_names

import 'package:fixify_app/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInputField extends StatelessWidget {
  const UserInputField({
    super.key,
    required this.height,
    required this.width,
    required this.icnLink,
    required this.txt,
    required this.type,
    required this.userController,
  });

  final double height;
  final double width;
  final String icnLink;
  final String txt;
  final TextInputType type;
  final TextEditingController userController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: fBlack.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: userController,
        keyboardType: type,
        cursorColor: fBlack,
        cursorHeight: 16,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: fBlack,
        ),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(9),
            child: SvgPicture.network(
              icnLink,
              height: 12,
              width: 12,
            ),
          ),
          contentPadding: const EdgeInsets.only(left: 15),
          labelText: txt,
          labelStyle: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: fBlack.withOpacity(0.3),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
