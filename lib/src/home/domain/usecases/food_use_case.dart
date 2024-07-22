import 'package:gufytea/core/usecases/usecases.dart';
import 'package:gufytea/core/utils/typedef.dart';
import 'package:gufytea/src/home/data/models/response/food_model.dart';
import 'package:gufytea/src/home/domain/repos/food_repo.dart';

class FoodUseCase extends UseCasesWithoutParams<FoodModel> {
  const FoodUseCase(this._repo);
  final FoodRepo _repo;

  @override
  ResultFuture<FoodModel> call() => _repo.getFoodList();
}
