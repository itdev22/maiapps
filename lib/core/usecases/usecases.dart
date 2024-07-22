import 'package:gufytea/core/utils/typedef.dart';

abstract class UseCase<Type, Params> {
  ResultFuture<Type> call(Params params);
}

abstract class UseCasesWithoutParams<Type> {
  const UseCasesWithoutParams();

  ResultFuture<Type> call();
}
