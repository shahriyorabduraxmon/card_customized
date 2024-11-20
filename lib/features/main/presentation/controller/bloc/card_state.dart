part of 'card_bloc.dart';

class CardState extends Equatable {
  final List<CardEntity> cards;
  final FormStateStatus status;

  const CardState({
    this.cards = const <CardEntity>[],
    this.status = FormStateStatus.initial,
  });

  CardState copyWith({
    List<CardEntity>? cards,
    FormStateStatus? status,
  }) =>
      CardState(
        cards: cards ?? this.cards,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [
    cards,
    status,
  ];
}

