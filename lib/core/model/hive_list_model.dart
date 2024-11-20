import 'package:hive/hive.dart';
import 'hive_model.dart';

part 'hive_list_model.g.dart';

@HiveType(typeId: 1)  // Type ID o'zgaradi
class HiveListModel {
  @HiveField(0)
  final List<HiveModel> cards;

  HiveListModel({required this.cards});

  factory HiveListModel.fromJson(Map<String, dynamic> json) {
    return HiveListModel(
      cards: (json['cards'] as List)
          .map((item) => HiveModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cards': cards.map((card) => card.toJson()).toList(),
    };
  }
}
