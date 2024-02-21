// ignore_for_file: file_names, deprecated_member_use

import 'package:fixify_app/constants/theme.dart';
import 'package:fixify_app/service/Call_Service.dart';
import 'package:fixify_app/service/Technician_Mongo.dart';
import 'package:fixify_app/technician/components/Service_Repo.dart';
import 'package:fixify_app/user/components/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TechnicianContactDetailPage extends StatefulWidget {
  final int id;
  const TechnicianContactDetailPage({super.key, required this.id});

  @override
  State<TechnicianContactDetailPage> createState() =>
      _TechnicianContactDetailPageState();
}

class _TechnicianContactDetailPageState
    extends State<TechnicianContactDetailPage> {
  TechnicianMongo mongoController = Get.put(TechnicianMongo());
  CallService callService = Get.put(CallService());

  @override
  void initState() {
    super.initState();
    mongoController.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: fWhite,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.network(
            'https://www.svgrepo.com/show/474448/job-management.svg',
            height: 12,
            width: 12,
          ),
        ),
        title: Text(
          "Job Details",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: fBlack,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
            click: () async {
              await callService.makePhoneCall(
                '+91${mongoController.allData[widget.id]["phone"]}',
              );
            },
            height: screenSize.height * 0.06,
            width: screenSize.width * 0.4,
            boxcolor: fViolet,
            txt: "Contact",
            txtcolor: fWhite,
          ),
          CustomButton(
            click: () {
              Get.toNamed("UserBottomNavBar");
            },
            height: screenSize.height * 0.06,
            width: screenSize.width * 0.4,
            boxcolor: fRed,
            txt: "Cancel",
            txtcolor: fWhite,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenSize.height * 0.25,
              decoration: BoxDecoration(
                color: fWhite,
                borderRadius: BorderRadius.circular(10),
                border: Border(
                  top: BorderSide(
                    width: 2,
                    color: fBlack.withOpacity(0.1),
                  ),
                  left: BorderSide(
                    width: 2,
                    color: fBlack.withOpacity(0.1),
                  ),
                  right: BorderSide(
                    width: 2,
                    color: fBlack.withOpacity(0.1),
                  ),
                  bottom: BorderSide(
                    width: 2,
                    color: fBlack.withOpacity(0.1),
                  ),
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    mongoController.allData[widget.id]["name"].toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: fBlack,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    mongoController.allData[widget.id]["specialist"].toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: fViolet,
                    ),
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.network(
                        'https://www.svgrepo.com/show/532539/location-pin.svg',
                        height: 16,
                        width: 16,
                        color: fBlack.withOpacity(0.6),
                      ),
                      const Gap(5),
                      Text(
                        mongoController.allData[widget.id]["address"]
                            .toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: fBlack.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceDetailsRepo(
                  txt1: "Contact",
                  txt2: mongoController.allData[widget.id]["phone"].toString(),
                ),
                ServiceDetailsRepo(
                  txt1: "Location",
                  txt2:
                      mongoController.allData[widget.id]["location"].toString(),
                ),
                ServiceDetailsRepo(
                  txt1: "Email",
                  txt2: mongoController.allData[widget.id]["email"].toString(),
                ),
              ],
            ),
            const Gap(20),
            Text(
              "About Technician",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: fBlack,
              ),
            ),
            const Gap(10),
            Text(
              mongoController.allData[widget.id]["abouttechnician"].toString(),
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: fBlack.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
