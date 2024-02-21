// ignore_for_file: deprecated_member_use

import 'package:fixify_app/constants/theme.dart';
import 'package:fixify_app/service/Technician_Mongo.dart';
import 'package:fixify_app/service/mongo_DB.dart';
import 'package:fixify_app/technician/components/Detail_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TechnicianHomePage extends StatefulWidget {
  const TechnicianHomePage({super.key});

  @override
  State<TechnicianHomePage> createState() => _TechnicianHomePageState();
}

class _TechnicianHomePageState extends State<TechnicianHomePage> {
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
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
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
        () => Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome!",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: fBlack,
                ),
              ),
              Text(
                "Get paid for your valuable servivce to correct client through our app",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: fBlack.withOpacity(0.35),
                ),
              ),
              const Gap(20),
              Text(
                "Opportunity",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: fBlack,
                ),
              ),
              const Gap(20),
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
                        onTap: () {
                          Get.to(
                            DetailPostPage(
                              id: index,
                            ),
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
                "Applied Jobs",
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
                        onLongPress: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
