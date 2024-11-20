part of 'create_card_bloc.dart';

class CreateCardState extends Equatable {
  final FormStateStatus status;

  final String cardImage;
  final double scale;
  final double xOffset;
  final double yOffset;

  final String cardColor;
  final List<String> gradientColors;

  final double blur;

  const CreateCardState({
    this.status = FormStateStatus.initial,
    this.cardImage = AppImages.card1,
    this.scale = 0.0,
    this.xOffset = 0.0,
    this.yOffset = 0.0,
    this.cardColor = '',
    this.gradientColors = const <String>[],
    this.blur = 0.0,
  });

  CreateCardState copyWith({
    FormStateStatus? status,
    String? cardImage,
    double? scale,
    double? xOffset,
    double? yOffset,
    String? cardColor,
    List<String>? gradientColors,
    bool? isGradient,
    double? blur,
  }) =>
      CreateCardState(
        status: status ?? this.status,
        cardImage: cardImage ?? this.cardImage,
        scale: scale ?? this.scale,
        xOffset: xOffset ?? this.xOffset,
        yOffset: yOffset ?? this.yOffset,
        cardColor: cardColor ?? this.cardColor,
        gradientColors: gradientColors ?? this.gradientColors,
        blur: blur ?? this.blur,
      );

  @override
  List<Object> get props => [
    status,
    cardImage,
    scale,
    xOffset,
    yOffset,
    cardColor,
    gradientColors,
    blur,
  ];
}

