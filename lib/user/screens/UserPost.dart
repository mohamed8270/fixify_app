// ignore_for_file: file_names, prefer_final_fields, prefer_const_constructors

import 'package:fixify_app/constants/theme.dart';
import 'package:fixify_app/service/mongo_DB.dart';
import 'package:fixify_app/user/components/UserInput.dart';
import 'package:fixify_app/user/components/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class UserPostScreen extends StatefulWidget {
  const UserPostScreen({super.key});

  @override
  State<UserPostScreen> createState() => _UserPostScreenState();
}

class _UserPostScreenState extends State<UserPostScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController serviceController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController queryController = TextEditingController();

  MongoController mongoController = Get.put(MongoController());

  Future<void> submitData() async {
    try {
      final uuid = Uuid();
      final userData = {
        '_id': uuid.v4(),
        'name': nameController.text,
        'contact': contactController.text,
        'email': emailController.text,
        'address': addressController.text,
        'district': districtController.text,
        'pincode': pincodeController.text,
        'location': locationController.text,
        'service': serviceController.text,
        'tag': tagController.text,
        'query': queryController.text,
      };

      await mongoController.pushData(userData);
      Get.toNamed('UserHome');
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
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
          "Post the service",
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
        txt: "Submit",
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
                "User Detail's",
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
                txt: 'Owner Name',
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
                    userController: contactController,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserInputField(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.47,
                    icnLink:
                        'https://www.svgrepo.com/show/533530/place-of-worship.svg',
                    txt: 'District',
                    type: TextInputType.text,
                    userController: districtController,
                  ),
                  UserInputField(
                    userController: pincodeController,
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.47,
                    icnLink:
                        'https://www.svgrepo.com/show/430557/area-map-marker-line.svg',
                    txt: 'Pincode',
                    type: TextInputType.number,
                  ),
                ],
              ),
              const Gap(10),
              UserInputField(
                userController: locationController,
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink:
                    'https://www.svgrepo.com/show/532535/location-crosshairs.svg',
                txt: 'Location',
                type: TextInputType.text,
              ),
              const Gap(30),
              Text(
                "Service Detail's",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: fViolet,
                ),
              ),
              const Gap(10),
              UserInputField(
                userController: serviceController,
                height: screenSize.height * 0.2,
                width: screenSize.width * 0.95,
                icnLink:
                    'https://www.svgrepo.com/show/445344/service-setting-solid.svg',
                txt: 'Services',
                type: TextInputType.text,
              ),
              const Gap(10),
              UserInputField(
                userController: tagController,
                height: screenSize.height * 0.1,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/506761/tag-plus.svg',
                txt: 'Service Tag',
                type: TextInputType.text,
              ),
              const Gap(30),
              Text(
                "Additional Queries",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: fViolet,
                ),
              ),
              const Gap(10),
              UserInputField(
                userController: queryController,
                height: screenSize.height * 0.1,
                width: screenSize.width * 0.95,
                icnLink:
                    'https://www.svgrepo.com/show/309848/person-feedback.svg',
                txt: 'Query',
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
