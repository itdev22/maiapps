import 'package:equatable/equatable.dart';

import 'package:maiapps/src/food_detail/data/models/response/food_detail_data_model.dart';

class FoodDetailEntity extends Equatable {
  const FoodDetailEntity({
    this.foodDetailDataModel,
  });

  final FoodDetailDataModel? foodDetailDataModel;

  @override
  List<Object?> get props => [foodDetailDataModel];
}
