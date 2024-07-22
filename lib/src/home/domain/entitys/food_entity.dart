import 'package:equatable/equatable.dart';

import 'package:gufytea/src/home/data/models/response/food_data_model.dart';

class FoodEntity extends Equatable {
  const FoodEntity({
    this.foodDataModel,
  });

  final List<FoodDataModel>? foodDataModel;

  @override
  List<Object?> get props => [foodDataModel];
}
