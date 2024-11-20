import 'dart:io';

import 'package:card_customization/assets/images/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class CreateCardController {
  final List<String> cardImages = [
    AppImages.card1,
    AppImages.card2,
    AppImages.card3,
    AppImages.card4,
    AppImages.card5,
  ];

  final List<String> cardColors = [
    'FA193E',
    '7F92A0',
    'FFFFFF',
    '1A79FF',
    '000000',
    '00B43C',
    '0C1829',
    'FFC107',
    '8E44AD',
    'E91E63',
    'FF5722',
    '4CAF50',
    '2196F3',
    '9E9E9E',
    '607D8B',
  ];


  final TextEditingController nameCtr = TextEditingController();
  final TextEditingController numberCtr = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    return pickedFile != null ? File(pickedFile.path) : null;
  }
}