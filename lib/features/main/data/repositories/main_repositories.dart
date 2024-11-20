import 'package:card_customization/core/exceptions/failures.dart';
import 'package:card_customization/core/utils/either.dart';
import 'package:card_customization/features/main/data/datasource/main_datasource.dart';
import 'package:card_customization/features/main/data/model/card_model.dart';
import 'package:card_customization/features/main/domain/entity/card_entity.dart';
import 'package:card_customization/features/main/domain/repositories/main_repo.dart';

class MainRepoImpl extends MainRepo {
  final MainDataSource dataSource = MainDataSourceImpl();

  @override
  Future<Either<Failure, bool>> saveCard({required CardModel card}) async {
    try {
      final result = await dataSource.saveCard(card: card);
      return Right(result);
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<CardEntity>>> getCards() async {
    try {
      final result = await dataSource.getCards();
      return Right(result);
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    }
  }
}
