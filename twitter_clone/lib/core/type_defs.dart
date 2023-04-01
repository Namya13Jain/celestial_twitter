import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';

//we have used a generic T for success asa success is diff for diff scenarios
typedef FutureEither<T> = Future<Either<Failure, T>>;

typedef FutureEitherVoid = FutureEither<void>;
