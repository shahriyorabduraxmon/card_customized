import 'package:card_customization/core/exceptions/failures.dart';
import 'package:card_customization/core/utils/either.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  const UseCase();
  Future<Either<Failure, Type>> call(Params params);
}

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
