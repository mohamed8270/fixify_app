// ignore_for_file: file_names, deprecated_member_use

import 'package:fixify_app/categoryCard.dart';
import 'package:fixify_app/constants/theme.dart';
import 'package:fixify_app/service/Technician_Mongo.dart';
import 'package:fixify_app/service/mongo_DB.dart';
import 'package:fixify_app/user/components/Technician_Contact_Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  MongoController mongoController = Get.put(MongoController());
  TechnicianMongo technicianMongo = Get.put(TechnicianMongo());

  @override
  void initState() {
    super.initState();
    mongoController.getAllData();
    technicianMongo.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.network(
            'https://www.svgrepo.com/show/522595/menu-2.svg',
            height: 12,
            width: 12,
            color: fBlack.withOpacity(0.3),
          ),
        ),
        title: Text(
          "Fix Man",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: fViolet,
          ),
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Home!",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: fBlack,
                  ),
                ),
                Text(
                  "Explore your dream house with advanced\ncontrol & service system",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: fBlack.withOpacity(0.35),
                  ),
                ),
                const Gap(20),
                Text(
                  "Your Services",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: fBlack,
                  ),
                ),
                const Gap(10),
                SizedBox(
                  height: screenSize.height * 0.15,
                  width: screenSize.width * 0.95,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mongoController.allData.length,
                    itemBuilder: (context, index) {
                      final document = mongoController.allData[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onLongPress: () async {
                            String uuidToDelete = document["_id"];
                            await mongoController.deleteData(uuidToDelete);
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.5,
                            decoration: BoxDecoration(
                              color: fBlack.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    document["tag"].toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: fBlack.withOpacity(0.5),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.45,
                                    child: Text(
                                      document["service"].toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: fViolet,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.45,
                                    child: Text(
                                      document["address"].toString(),
                                      overflow: TextOverflow.visible,
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: fBlack.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  const Gap(5),
                                  Text(
                                    document["pincode"].toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: fBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Gap(20),
                Text(
                  "Hire Technicians",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: fBlack,
                  ),
                ),
                const Gap(10),
                SizedBox(
                  height: screenSize.height * 0.15,
                  width: screenSize.width * 0.95,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: technicianMongo.allData.length,
                    itemBuilder: (context, index) {
                      final document = technicianMongo.allData[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              TechnicianContactDetailPage(id: index),
                            );
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.5,
                            decoration: BoxDecoration(
                              color: fBlack.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    document["specialist"].toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: fBlack.withOpacity(0.5),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.45,
                                    child: Text(
                                      document["name"].toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: fViolet,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.45,
                                    child: Text(
                                      document["address"].toString(),
                                      overflow: TextOverflow.visible,
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: fBlack.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  const Gap(5),
                                  Text(
                                    document["phone"].toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: fBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Gap(20),
                Text(
                  "What's on your mind",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: fBlack,
                  ),
                ),
                const Gap(20),
                CatergoryContainer(
                  icnlink:
                      'https://www.svgrepo.com/show/297044/water-tap-plumber.svg',
                  click: () {},
                  height: screenSize.height * 0.06,
                  width: screenSize.width * 0.4,
                  color: fBlack.withOpacity(0.04),
                  txt: 'Plumbing',
                  txtcolor: fBlack.withOpacity(0.8),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
