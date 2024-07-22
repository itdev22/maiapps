import 'package:gufytea/src/basket/data/models/response/basket_cart_details_model.dart';
import 'package:gufytea/src/basket/domain/entitys/basket_data_entity.dart';

class BasketDataModel extends BasketDataEntity {
  const BasketDataModel({
    super.id,
    super.total,
    super.createdAt,
    super.updatedAt,
    super.cartDetails,
  });

  BasketDataModel copyWith({
    String? id,
    int? total,
    String? createdAt,
    String? updatedAt,
    List<BasketCartDetailsModel>? cartDetails,
  }) {
    return BasketDataModel(
      id: id ?? this.id,
      total: total ?? this.total,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      cartDetails: cartDetails ?? this.cartDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'total': total,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'cartDetails': cartDetails?.map((x) => x.toMap()).toList(),
    };
  }

  factory BasketDataModel.fromMap(Map<String, dynamic> map) {
    return BasketDataModel(
      id: map['id'] != null ? map['id'] as String : null,
      total: map['total'] != null ? map['total'] as int : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      cartDetails: map['cartDetails'] != null
          ? List<BasketCartDetailsModel>.from(
              (map['cartDetails'] as List<dynamic>)
                  .map<BasketCartDetailsModel?>(
                (x) =>
                    BasketCartDetailsModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}
