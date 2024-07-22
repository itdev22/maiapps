import 'package:equatable/equatable.dart';

import 'package:gufytea/src/basket/data/models/response/basket_cart_details_model.dart';

class BasketDataEntity extends Equatable {
  const BasketDataEntity({
    this.id,
    this.total,
    this.createdAt,
    this.updatedAt,
    this.cartDetails,
  });

  final String? id;
  final int? total;
  final String? createdAt;
  final String? updatedAt;
  final List<BasketCartDetailsModel>? cartDetails;

  @override
  List<Object?> get props {
    return [
      id,
      total,
      createdAt,
      updatedAt,
      cartDetails,
    ];
  }
}
