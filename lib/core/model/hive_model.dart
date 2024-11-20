import 'package:hive/hive.dart';

part 'hive_model.g.dart';

@HiveType(typeId: 0)
class HiveModel {
  @HiveField(0)
  final String cardImage;

  @HiveField(1)
  final double scale;

  @HiveField(2)
  final double xOffset;

  @HiveField(3)
  final double yOffset;

  @HiveField(4)
  final String cardColor;

  @HiveField(5)
  final List<String> gradientColors;

  @HiveField(6)
  final double blur;

  HiveModel({
    required this.cardImage,
    required this.scale,
    required this.xOffset,
    required this.yOffset,
    required this.cardColor,
    required this.gradientColors,
    required this.blur,
  });

  factory HiveModel.fromJson(Map<String, dynamic> json) {
    return HiveModel(
      cardImage: json['cardImage'],
      scale: json['scale'],
      xOffset: json['xOffset'],
      yOffset: json['yOffset'],
      cardColor: json['cardColor'],
      gradientColors: List<String>.from(json['gradientColors']),
      blur: json['blur'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cardImage': cardImage,
      'scale': scale,
      'xOffset': xOffset,
      'yOffset': yOffset,
      'cardColor': cardColor,
      'gradientColors': gradientColors,
      'blur': blur,
    };
  }
}
