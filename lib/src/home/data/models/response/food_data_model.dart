import 'package:maiapps/src/home/domain/entitys/food_data_entity.dart';

class FoodDataModel extends FoodDataEntity {
  const FoodDataModel({
    super.id,
    super.title,
    super.description,
    super.image,
    super.price,
    super.stock,
    super.createdAt,
    super.updatedAt,
  });

  FoodDataModel copyWith({
    String? id,
    String? title,
    String? description,
    String? image,
    int? price,
    int? stock,
    String? createdAt,
    String? updatedAt,
  }) {
    return FoodDataModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'price': price,
      'stock': stock,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory FoodDataModel.fromMap(Map<String, dynamic> map) {
    return FoodDataModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      stock: map['stock'] != null ? map['stock'] as int : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }
}
