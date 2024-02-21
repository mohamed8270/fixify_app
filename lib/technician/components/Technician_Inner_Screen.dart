// ignore_for_file: file_names, prefer_const_constructors

import 'package:fixify_app/constants/theme.dart';
import 'package:fixify_app/service/Technician_Mongo.dart';
import 'package:fixify_app/user/components/UserInput.dart';
import 'package:fixify_app/user/components/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class TechnicianInnerScreen extends StatefulWidget {
  const TechnicianInnerScreen({super.key});

  @override
  State<TechnicianInnerScreen> createState() => _TechnicianInnerScreenState();
}

class _TechnicianInnerScreenState extends State<TechnicianInnerScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController membersController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController specialistController = TextEditingController();
  TextEditingController technicianController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  TechnicianMongo mongoController = Get.put(TechnicianMongo());

  Future<void> submitData() async {
    try {
      final uuid = Uuid();
      final technicianData = {
        '_id': uuid.v4(),
        'name': nameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'address': addressController.text,
        'members': membersController.text,
        'experience': experienceController.text,
        'specialist': specialistController.text,
        'abouttechnician': technicianController.text,
        'location': locationController.text,
      };

      await mongoController.pushTechnicianData(technicianData);
      Get.toNamed('TechnicianBottomNavBar');
    } catch (e) {
      throw Exception('Error while submitting data: $e');
    }
  }

  @override
  void dispose() {
    mongoController.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.network(
              'https://www.svgrepo.com/show/327609/arrow-back.svg',
              height: 12,
              width: 12,
            ),
          ),
        ),
        title: Text(
          "Apply",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: fBlack,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        click: () => submitData(),
        height: screenSize.height * 0.06,
        width: screenSize.width * 0.9,
        boxcolor: fViolet,
        txt: "Apply",
        txtcolor: fWhite,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Technician Detail's",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: fViolet,
                ),
              ),
              const Gap(10),
              UserInputField(
                userController: nameController,
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink:
                    'https://www.svgrepo.com/show/532397/user-shield-alt-1.svg',
                txt: 'Technician Name',
                type: TextInputType.name,
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserInputField(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.47,
                    icnLink:
                        'https://www.svgrepo.com/show/521544/call-receive.svg',
                    txt: 'Contact Number',
                    type: TextInputType.phone,
                    userController: phoneController,
                  ),
                  UserInputField(
                    userController: emailController,
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.47,
                    icnLink: 'https://www.svgrepo.com/show/488920/email.svg',
                    txt: 'Email',
                    type: TextInputType.emailAddress,
                  ),
                ],
              ),
              const Gap(10),
              UserInputField(
                userController: addressController,
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/356104/address-book.svg',
                txt: 'Address Line',
                type: TextInputType.streetAddress,
              ),
              const Gap(10),
              UserInputField(
                userController: membersController,
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/332577/team.svg',
                txt: 'Team Persons',
                type: TextInputType.number,
              ),
              const Gap(10),
              UserInputField(
                userController: locationController,
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink:
                    'https://www.svgrepo.com/show/532540/location-pin-alt-1.svg',
                txt: 'Location',
                type: TextInputType.text,
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserInputField(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.47,
                    icnLink:
                        'https://www.svgrepo.com/show/498517/user-octagon.svg',
                    txt: 'Years of Experience',
                    type: TextInputType.number,
                    userController: experienceController,
                  ),
                  UserInputField(
                    userController: specialistController,
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.47,
                    icnLink:
                        'https://www.svgrepo.com/show/528353/link-broken.svg',
                    txt: 'Specialist',
                    type: TextInputType.text,
                  ),
                ],
              ),
              const Gap(10),
              UserInputField(
                userController: technicianController,
                height: screenSize.height * 0.2,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/524496/dialog-2.svg',
                txt: 'About Yourself',
                type: TextInputType.text,
              ),
              const Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}
