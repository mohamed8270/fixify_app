// ignore_for_file: prefer_final_fields, file_names

import 'package:fixify_app/constants/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoController extends GetxController {
  late Db _db;
  late DbCollection _collection;

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
    _collection =
        _db.collection("home_service"); // Replace with your collection name
  }

  Future<void> pushData(Map<String, dynamic> data) async {
    try {
      await _collection.insert(data);
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
      final data = await _collection.find().toList();
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

  Future<void> deleteData(String uuid) async {
    try {
      await _collection
          .deleteOne({"_id": uuid}); // Use string-based filter for the UUID
      Get.snackbar(
        "Success",
        "Data deleted successfully",
        backgroundColor: fGreen,
        snackPosition: SnackPosition.BOTTOM,
        colorText: fWhite,
      );
      // Optionally, update the UI to reflect the deletion
      await getAllData(); // Fetch updated data
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to delete data: $e",
        backgroundColor: fRed,
        snackPosition: SnackPosition.BOTTOM,
        colorText: fWhite,
      );
    }
  }

  @override
  void onClose() {
    _db.close();
    super.onClose();
  }
}
