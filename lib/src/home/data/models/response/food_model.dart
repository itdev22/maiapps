import 'package:maiapps/src/home/data/models/response/food_data_model.dart';
import 'package:maiapps/src/home/domain/entitys/food_entity.dart';

class FoodModel extends FoodEntity {
  const FoodModel({super.foodDataModel});

  FoodModel copyWith({
    List<FoodDataModel>? foodDataModel,
  }) {
    return FoodModel(
      foodDataModel: foodDataModel ?? this.foodDataModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': foodDataModel?.map((x) => x.toMap()).toList(),
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      foodDataModel: map['data'] != null
          ? List<FoodDataModel>.from(
              (map['data'] as List<dynamic>).map<FoodDataModel?>(
                (x) => FoodDataModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}
