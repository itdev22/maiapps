import 'package:gufytea/src/food_detail/data/models/response/food_detail_data_model.dart';
import 'package:gufytea/src/food_detail/domain/entitys/food_detail_entity.dart';

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
      'data': foodDetailDataModel?.toMap(),
    };
  }

  factory FoodDetailModel.fromMap(Map<String, dynamic> map) {
    return FoodDetailModel(
      foodDetailDataModel: map['data'] != null
          ? FoodDetailDataModel.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }
}
