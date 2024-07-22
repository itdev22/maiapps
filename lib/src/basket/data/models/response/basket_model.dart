import 'package:gufytea/src/basket/data/models/response/basket_data_model.dart';
import 'package:gufytea/src/basket/domain/entitys/basket_entity.dart';

class BasketModel extends BasketEntity {
  const BasketModel({
    super.data,
  });

  BasketModel copyWith({
    List<BasketDataModel>? data,
  }) {
    return BasketModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory BasketModel.fromMap(Map<String, dynamic> map) {
    return BasketModel(
      data: map['data'] != null
          ? List<BasketDataModel>.from(
              (map['data'] as List<dynamic>).map<BasketDataModel?>(
                (x) => BasketDataModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}
