

import 'package:either_dart/either.dart';
import 'package:weather_app/core/errors/failure.dart';

abstract class UseCase<T, A> {
  Future<Either<Failure, T?>> execute([A args]);
}
