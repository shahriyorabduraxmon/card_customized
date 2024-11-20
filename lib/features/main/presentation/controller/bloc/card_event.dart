part of 'card_bloc.dart';

abstract class CardEvent{
  const CardEvent();
}

class GetCardsEvent extends CardEvent {}
