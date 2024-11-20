// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      cardImage: json['card_image'] as String? ?? '',
      scale: (json['scale'] as num?)?.toDouble() ?? 0.0,
      xOffset: (json['x_offset'] as num?)?.toDouble() ?? 0.0,
      yOffset: (json['y_offset'] as num?)?.toDouble() ?? 0.0,
      cardColor: json['card_color'] as String? ?? '',
      gradientColors: (json['gradient_colors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      blur: (json['blur'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'card_image': instance.cardImage,
      'scale': instance.scale,
      'x_offset': instance.xOffset,
      'y_offset': instance.yOffset,
      'card_color': instance.cardColor,
      'gradient_colors': instance.gradientColors,
      'blur': instance.blur,
    };
