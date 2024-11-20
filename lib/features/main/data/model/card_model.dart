import 'package:card_customization/features/main/domain/entity/card_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CardModel extends CardEntity {
  const CardModel({
    super.cardImage,
    super.scale,
    super.xOffset,
    super.yOffset,
    super.cardColor,
    super.gradientColors,
    super.blur,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}