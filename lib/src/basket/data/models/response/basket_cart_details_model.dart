import 'package:maiapps/src/basket/data/models/response/basket_items_model.dart';
import 'package:maiapps/src/basket/domain/entitys/basket_cart_details_entity.dart';

class BasketCartDetailsModel extends BasketCartDetailsEntity {
  const BasketCartDetailsModel({
    super.id,
    super.cart_id,
    super.item_id,
    super.quantity,
    super.total,
    super.createdAt,
    super.updatedAt,
    super.item,
  });

  BasketCartDetailsModel copyWith({
    String? id,
    String? cart_id,
    String? item_id,
    int? quantity,
    int? total,
    String? createdAt,
    String? updatedAt,
    BasketItemsModel? item,
  }) {
    return BasketCartDetailsModel(
      id: id ?? this.id,
      cart_id: cart_id ?? this.cart_id,
      item_id: item_id ?? this.item_id,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      item: item ?? this.item,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cart_id': cart_id,
      'item_id': item_id,
      'quantity': quantity,
      'total': total,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'item': item?.toMap(),
    };
  }

  factory BasketCartDetailsModel.fromMap(Map<String, dynamic> map) {
    return BasketCartDetailsModel(
      id: map['id'] != null ? map['id'] as String : null,
      cart_id: map['cart_id'] != null ? map['cart_id'] as String : null,
      item_id: map['item_id'] != null ? map['item_id'] as String : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      total: map['total'] != null ? map['total'] as int : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      item: map['item'] != null
          ? BasketItemsModel.fromMap(map['item'] as Map<String, dynamic>)
          : null,
    );
  }
}
