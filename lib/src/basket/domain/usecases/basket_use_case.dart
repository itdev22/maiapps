import 'package:maiapps/core/usecases/usecases.dart';
import 'package:maiapps/core/utils/typedef.dart';
import 'package:maiapps/src/basket/data/models/response/basket_model.dart';
import 'package:maiapps/src/basket/domain/repos/basket_repo.dart';

class BasketUseCase extends UseCasesWithoutParams<BasketModel> {
  const BasketUseCase(this._repo);
  final BasketRepo _repo;

  @override
  ResultFuture<BasketModel> call() => _repo.getBasketList();
}
