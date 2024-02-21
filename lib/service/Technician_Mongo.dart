// ignore_for_file: file_names, prefer_final_fields

import 'package:fixify_app/constants/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';

class TechnicianMongo extends GetxController {
  late Db _db;
  late DbCollection _techniciancollection;

  @override
  void onInit() {
    super.onInit();
    _connectToMongo();
  }

  // All the Function Below are User Side Rendering
  Future<void> _connectToMongo() async {
    final url = dotenv.env['MONGO_URL'].toString();
    _db = await Db.create(url); // Replace with your MongoDB URI
    await _db.open();

    // Replace with your collection name
    _techniciancollection = _db.collection("technician_service");
  }

  // All the Function are Technician Side Rendering
  Future<void> pushTechnicianData(Map<String, dynamic> data) async {
    try {
      await _techniciancollection.insert(data);
      Get.snackbar(
        "Success",
        "Data pushed to MongoDB successfully",
        backgroundColor: fGreen,
        snackPosition: SnackPosition.BOTTOM,
        colorText: fWhite,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to push data: $e",
        backgroundColor: fRed,
        snackPosition: SnackPosition.BOTTOM,
        colorText: fWhite,
      );
    }
  }

  RxList<Map<String, dynamic>> _allData = RxList<Map<String, dynamic>>([]);
  List<Map<String, dynamic>> get allData => _allData;

  Future<void> getAllData() async {
    try {
      final data = await _techniciancollection.find().toList();
      _allData.value = data;
      update(); // Notify listeners of data change
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to fetch data: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: fRed,
        colorText: fWhite,
      );
    }
  }
}
