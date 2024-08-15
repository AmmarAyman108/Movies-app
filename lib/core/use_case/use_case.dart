import 'package:dartz/dartz.dart';
import 'package:movies_pp/core/errors/failure.dart';

abstract class UseCase<type> {
  Future<Either<Failure, type>> call();
}
