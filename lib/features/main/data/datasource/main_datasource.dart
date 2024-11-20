import 'dart:io';
import 'package:card_customization/assets/box/hive_box.dart';
import 'package:card_customization/core/model/hive_list_model.dart';
import 'package:card_customization/core/model/hive_model.dart';
import 'package:card_customization/features/main/data/model/card_model.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;

Future<bool> uploadCardData(CardModel card, File imageFile) async {
  final uri = Uri.parse("https://your-api-endpoint.com/saveCard");

  XFile compressedImage = await compressImage(imageFile);

  var request = http.MultipartRequest("POST", uri);

  request.files.add(
    await http.MultipartFile.fromPath(
      'card_image',
      compressedImage.path,
    ),
  );

  request.fields['scale'] = card.scale.toString();
  request.fields['x_offset'] = card.xOffset.toString();
  request.fields['y_offset'] = card.yOffset.toString();
  request.fields['card_color'] = card.cardColor;
  request.fields['gradient_colors'] = card.gradientColors.join(',');
  request.fields['blur'] = card.blur.toString();

  final response = await request.send();

  if (response.statusCode == 200) {
    print("Data uploaded successfully!");
    return true;
  } else {
    print("Failed to upload data.");
    return false;
  }
}

abstract class MainDataSource {
  Future<bool> saveCard({required CardModel card});
  Future<List<CardModel>> getCards();
}

class MainDataSourceImpl extends MainDataSource {
  @override
  Future<bool> saveCard({required CardModel card}) async {
    await Future.delayed(const Duration(seconds: 1));
    Map<String, dynamic> jsonData = {
      'cardImage': card.cardImage,
      'scale': card.scale,
      'xOffset': card.xOffset,
      'yOffset': card.yOffset,
      'cardColor': card.cardColor,
      'gradientColors': card.gradientColors,
      'blur': card.blur,
    };
    final HiveModel data = HiveModel.fromJson(jsonData);
    HiveListModel? cards = cardsBox?.get('cards');
    if(cards == null){
      cardsBox?.put('cards', HiveListModel(cards: [data]));
    } else {
      List<HiveModel> list = cards.cards;
      list.add(data);
      cardsBox?.put('cards', HiveListModel(cards: list));
    }
    return true;
  }

  @override
  Future<List<CardModel>> getCards() async {
    await Future.delayed(const Duration(seconds: 1));
    HiveListModel? cards = cardsBox?.get('cards');
    if(cards == null) {
      return [];
    } else {
      List<HiveModel> list = cards.cards;
      return list.map((card) => CardModel(
        cardImage: card.cardImage,
        scale: card.scale,
        xOffset: card.xOffset,
        yOffset: card.yOffset,
        cardColor: card.cardColor,
        blur: card.blur,
      )).toList();
    }
  }
}

Future<XFile> compressImage(File file) async {
  final String targetPath = "${file.path}_compressed.jpg";
  final result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: 70,
  );
  return result!;
}

