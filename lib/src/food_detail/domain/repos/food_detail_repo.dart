import 'package:maiapps/core/utils/typedef.dart';
import 'package:maiapps/src/food_detail/data/models/response/food_detail_model.dart';

abstract class FoodDetailRepo {
  const FoodDetailRepo();

  ResultFuture<FoodDetailModel> getFoodDetail({
    required String? id,
  });
}
