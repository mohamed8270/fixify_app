// // ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, depend_on_referenced_packages, avoid_print

// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class CloudinaryUploader extends StatefulWidget {
//   @override
//   _CloudinaryUploaderState createState() => _CloudinaryUploaderState();
// }

// class _CloudinaryUploaderState extends State<CloudinaryUploader> {
//   // Replace with your Cloudinary details
//   final cloudName = 'YOUR_CLOUD_NAME';
//   final apiKey = 'YOUR_API_KEY';
//   final apiSecret = 'YOUR_API_SECRET';

//   Future<void> uploadToCloudinary(File file) async {
//     final apiUrl = 'https://api.cloudinary.com/v1_1/$cloudName/upload';
//     final uri = Uri.parse(apiUrl);

//     final request = http.MultipartRequest('POST', uri)
//       ..fields['upload_preset'] = 'YOUR_UPLOAD_PRESET'
//       ..files.add(
//         await http.MultipartFile.fromPath('file', file.path),
//       );

//     try {
//       final response = await request.send();
//       if (response.statusCode == 200) {
//         final responseBody = await response.stream.bytesToString();
//         final jsonData = json.decode(responseBody);
//         final secureUrl = jsonData['secure_url'];
//         print('Uploaded to Cloudinary: $secureUrl');
//         // You can save the secure URL or perform additional actions here.
//       } else {
//         print('Failed to upload to Cloudinary: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       print('Error uploading to Cloudinary: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cloudinary Uploader'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             // Replace this with your file picking logic
//             // For simplicity, using a file from assets as an example
//             // You can use file_picker or other packages to pick files
//             final file = File('assets/sample_excel.xlsx');
//             await uploadToCloudinary(file);
//           },
//           child: const Text('Upload to Cloudinary'),
//         ),
//       ),
//     );
//   }
// }
