import 'package:card_customization/core/exceptions/failures.dart';
import 'package:card_customization/core/usecases/usecase.dart';
import 'package:card_customization/core/utils/either.dart';
import 'package:card_customization/features/main/data/model/card_model.dart';
import 'package:card_customization/features/main/data/repositories/main_repositories.dart';
import 'package:card_customization/features/main/domain/repositories/main_repo.dart';

class SaveCardUseCase extends UseCase<bool, CardModel> {
  final MainRepo repository = MainRepoImpl();

  @override
  Future<Either<Failure, bool>> call(CardModel params) async =>
      await repository.saveCard(card: params);
}