import 'package:card_customization/assets/box/hive_box.dart';
import 'package:card_customization/core/model/hive_list_model.dart';
import 'package:card_customization/core/model/hive_model.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:card_customization/app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugRepaintRainbowEnabled = false;
  final directory = await getApplicationDocumentsDirectory();

  Hive.init(directory.path);
  Hive.registerAdapter(HiveModelAdapter());
  Hive.registerAdapter(HiveListModelAdapter());
  Hive.deleteBoxFromDisk('card');
  cardsBox = await Hive.openBox<HiveListModel>('cards');

  runApp(const MyApp());
}
