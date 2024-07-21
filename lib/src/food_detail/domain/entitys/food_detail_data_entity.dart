import 'package:equatable/equatable.dart';

class FoodDetailDataEntity extends Equatable {
  const FoodDetailDataEntity({
    this.id,
    this.title,
    this.description,
    this.image,
    this.price,
    this.stock,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? title;
  final String? description;
  final String? image;
  final int? price;
  final int? stock;
  final String? createdAt;
  final String? updatedAt;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      image,
      price,
      stock,
      createdAt,
      updatedAt,
    ];
  }
}
