import 'package:maiapps/core/utils/typedef.dart';
import 'package:maiapps/src/home/data/models/response/food_model.dart';

abstract class FoodRepo {
  const FoodRepo();

  ResultFuture<FoodModel> getFoodList();
}
