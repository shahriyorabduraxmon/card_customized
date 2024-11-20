import 'package:card_customization/assets/images/app_images.dart';
import 'package:card_customization/features/common/utils/state_status.dart';
import 'package:card_customization/features/main/data/model/card_model.dart';
import 'package:card_customization/features/main/domain/usecase/save_card_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_card_event.dart';
part 'create_card_state.dart';

class CreateCardBloc extends Bloc<CreateCardEvent, CreateCardState> {
  final SaveCardUseCase saveCardUseCase = SaveCardUseCase();
  CreateCardBloc() : super(const CreateCardState()) {
    on<UpdateAssetImageEvent>((event, emit) {
      emit(state.copyWith(
        cardImage: event.image,
        cardColor: '',
        gradientColors: []
      ));
    });

    on<UpdatePickedImageEvent>((event, emit) {
      emit(state.copyWith(
        cardImage: event.imagePath,
      ));
    });

    on<UpdateCardImageTransformEvent>((event, emit) {
      emit(state.copyWith(
        scale: event.scale,
        xOffset: event.xOffset,
        yOffset: event.yOffset,
      ));
    });

    on<UpdateCardColorEvent>((event, emit) {
      emit(state.copyWith(
        cardColor: event.color,
        cardImage: '',
        gradientColors: []
      ));
    });

    on<UpdateGradientEvent>((event, emit) {
      emit(state.copyWith(
          cardColor: '',
          cardImage: '',
          gradientColors: event.gradientColors
      ));
    });

    on<UpdateBlurEvent>((event, emit) {
      emit(state.copyWith(blur: event.blur));
    });

    on<SaveCreateCardEvent>((event, emit) async {
      emit(state.copyWith(status: FormStateStatus.loading));
      var result = await saveCardUseCase.call(CardModel(
        cardImage: state.cardImage,
        cardColor: state.cardColor,
        scale: state.scale,
        xOffset: state.xOffset,
        yOffset: state.yOffset,
        gradientColors: state.gradientColors,
        blur: state.blur
      ));
      if (result.isRight) {
        event.onSuccess();
        emit(state.copyWith(status: FormStateStatus.success));
      }else if(result.isLeft){
        event.onError();
        emit(state.copyWith(status: FormStateStatus.error));
      }
    });
  }
}
