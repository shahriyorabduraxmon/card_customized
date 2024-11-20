part of 'create_card_bloc.dart';

abstract class CreateCardEvent{
  const CreateCardEvent();
}

class UpdateAssetImageEvent extends CreateCardEvent {
  final String image;
  const UpdateAssetImageEvent({required this.image});
}

class UpdatePickedImageEvent extends CreateCardEvent {
  final String imagePath;
  const UpdatePickedImageEvent({required this.imagePath});
}

class UpdateCardImageTransformEvent extends CreateCardEvent {
  final double scale;
  final double xOffset;
  final double yOffset;

  const UpdateCardImageTransformEvent({
    required this.scale,
    required this.xOffset,
    required this.yOffset,
  });
}

class UpdateCardColorEvent extends CreateCardEvent {
  final String color;

  const UpdateCardColorEvent({required this.color});
}

class UpdateGradientEvent extends CreateCardEvent {
  final List<String> gradientColors;

  const UpdateGradientEvent({required this.gradientColors});
}

class UpdateBlurEvent extends CreateCardEvent {
  final double blur;
  const UpdateBlurEvent({required this.blur});
}

class SaveCreateCardEvent extends CreateCardEvent {
  final Function() onSuccess;
  final Function() onError;
  const SaveCreateCardEvent({required this.onSuccess, required this.onError});
}
