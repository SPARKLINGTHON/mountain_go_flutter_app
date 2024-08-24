import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../routes/app_pages.dart';

class AddImageController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final Rx<File?> _selectedImage = Rx<File?>(null);
  File? get selectedImage => _selectedImage.value;

  final String _serverUrl = "http://43.201.65.109:3000/api/dict/create";
  final int mountainId = Get.arguments['mountainId'];
  final String mountainName = Get.arguments['mountainName'];
  static final _storage = FlutterSecureStorage();
  // 이미지 선택 메서드
  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        _selectedImage.value = File(pickedFile.path);
      } else {
        print("No image selected.");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  // 이미지 업로드 메서드
  Future<void> uploadImage() async {
    if (_selectedImage.value == null) {
      print("No image selected to upload.");
      return;
    }

    try {
      // 쿼리 파라미터를 URL에 포함
      var request = http.MultipartRequest(
        'POST',
        //Uri.parse("$_serverUrl?userId=${await _storage.read(key: "id")}&mountainId=$mountainId"),
        Uri.parse("$_serverUrl?userId=1000&mountainId=$mountainId"), //임시로 1000으로 해둠. 나중에 위에 코드로 변경 필요
      );

      // 이미지 파일 추가
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',  // 서버의 필드명
          _selectedImage.value!.path,
          filename: basename(_selectedImage.value!.path),
        ),
      );

      // 서버에 요청 전송
      var response = await request.send();

      // 응답 처리
      if (response.statusCode == 201) {
        print("Image uploaded successfully.");
        //Get.toNamed(Routes.MAIN, arguments: {
        //}); 여기에 취합할때 mountain metadata를 줘야함.
      } else {
        print("Failed to upload image. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error uploading image: $e");
    }
  }
}
