import 'package:card_customization/core/exceptions/failures.dart';
import 'package:card_customization/core/utils/either.dart';
import 'package:card_customization/features/main/data/model/card_model.dart';
import 'package:card_customization/features/main/domain/entity/card_entity.dart';

abstract class MainRepo {
  Future<Either<Failure, bool>> saveCard({required CardModel card});
  Future<Either<Failure, List<CardEntity>>> getCards();
}
