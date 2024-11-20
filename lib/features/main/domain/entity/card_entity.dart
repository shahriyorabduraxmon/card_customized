import 'package:card_customization/features/main/data/model/card_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CardEntity extends Equatable {
  final String cardImage;
  final double scale;
  final double xOffset;
  final double yOffset;
  final String cardColor;
  final List<String> gradientColors;
  final double blur;

  const CardEntity({
    this.cardImage = '',
    this.scale = 0.0,
    this.xOffset = 0.0,
    this.yOffset = 0.0,
    this.cardColor = '',
    this.gradientColors = const <String>[],
    this.blur = 0.0,
  });

  @override
  List<Object?> get props => [
    cardImage,
    scale,
    xOffset,
    yOffset,
    cardColor,
    gradientColors,
    blur,
  ];
}

class CardConverter implements JsonConverter<CardEntity, Map<String, dynamic>?> {
  const CardConverter();
  @override
  CardEntity fromJson(Map<String, dynamic>? json) => CardModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(CardEntity object) => {};
}