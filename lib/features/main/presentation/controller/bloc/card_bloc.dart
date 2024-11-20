import 'package:card_customization/core/usecases/usecase.dart';
import 'package:card_customization/features/common/utils/state_status.dart';
import 'package:card_customization/features/main/domain/entity/card_entity.dart';
import 'package:card_customization/features/main/domain/usecase/get_cards_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final GetCardsUseCase getCardsUseCase = GetCardsUseCase();
  CardBloc() : super(const CardState()) {
    on<GetCardsEvent>((event, emit) async {
      if(state.cards.isEmpty) {
        emit(state.copyWith(status: FormStateStatus.loading));
      }
      var result = await getCardsUseCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(status: FormStateStatus.success, cards: result.right));
      }else if(result.isLeft){
        emit(state.copyWith(status: FormStateStatus.error));
      }
    });
  }
}
