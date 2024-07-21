import 'package:maiapps/src/food_detail/data/models/response/food_detail_data_model.dart';
import 'package:maiapps/src/food_detail/domain/entitys/food_detail_entity.dart';

class FoodDetailModel extends FoodDetailEntity {
  const FoodDetailModel({super.foodDetailDataModel});

  FoodDetailModel copyWith({
    FoodDetailDataModel? foodDetailDataModel,
  }) {
    return FoodDetailModel(
      foodDetailDataModel: foodDetailDataModel ?? this.foodDetailDataModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foodDetailDataModel': foodDetailDataModel?.toMap(),
    };
  }

  factory FoodDetailModel.fromMap(Map<String, dynamic> map) {
    return FoodDetailModel(
      foodDetailDataModel: map['foodDetailDataModel'] != null
          ? FoodDetailDataModel.fromMap(
              map['foodDetailDataModel'] as Map<String, dynamic>)
          : null,
    );
  }
}
