import 'package:equatable/equatable.dart';

import 'package:maiapps/src/basket/data/models/response/basket_items_model.dart';

class BasketCartDetailsEntity extends Equatable {
  const BasketCartDetailsEntity({
    this.id,
    this.cart_id,
    this.item_id,
    this.quantity,
    this.total,
    this.createdAt,
    this.updatedAt,
    this.item,
  });

  final String? id;
  final String? cart_id;
  final String? item_id;
  final int? quantity;
  final int? total;
  final String? createdAt;
  final String? updatedAt;
  final BasketItemsModel? item;

  @override
  List<Object?> get props {
    return [
      id,
      cart_id,
      item_id,
      quantity,
      total,
      createdAt,
      updatedAt,
      item,
    ];
  }
}
