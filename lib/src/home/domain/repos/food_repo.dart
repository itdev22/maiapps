import 'package:gufytea/core/utils/typedef.dart';
import 'package:gufytea/src/home/data/models/response/food_model.dart';

abstract class FoodRepo {
  const FoodRepo();

  ResultFuture<FoodModel> getFoodList();
}
