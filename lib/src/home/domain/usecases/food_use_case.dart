import 'package:maiapps/core/usecases/usecases.dart';
import 'package:maiapps/core/utils/typedef.dart';
import 'package:maiapps/src/home/data/models/response/food_model.dart';
import 'package:maiapps/src/home/domain/repos/food_repo.dart';

class FoodUseCase extends UseCasesWithoutParams<FoodModel> {
  const FoodUseCase(this._repo);
  final FoodRepo _repo;

  @override
  ResultFuture<FoodModel> call() => _repo.getFoodList();
}
