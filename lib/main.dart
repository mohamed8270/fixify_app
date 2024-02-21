import 'package:firebase_core/firebase_core.dart';
import 'package:fixify_app/service/Technician_Mongo.dart';
import 'package:fixify_app/service/mongo_DB.dart';
import 'package:fixify_app/wrapper/Wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;
Future<void> main() async {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(MongoController());
  Get.put(TechnicianMongo());
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrapper();
  }
}
