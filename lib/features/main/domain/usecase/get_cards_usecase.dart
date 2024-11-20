import 'package:card_customization/core/exceptions/failures.dart';
import 'package:card_customization/core/usecases/usecase.dart';
import 'package:card_customization/core/utils/either.dart';
import 'package:card_customization/features/main/data/repositories/main_repositories.dart';
import 'package:card_customization/features/main/domain/entity/card_entity.dart';
import 'package:card_customization/features/main/domain/repositories/main_repo.dart';

class GetCardsUseCase extends UseCase<List<CardEntity>, NoParams> {
  final MainRepo repository = MainRepoImpl();

  @override
  Future<Either<Failure, List<CardEntity>>> call(NoParams params) async => await repository.getCards();
}