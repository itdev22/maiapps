class FoodDetailBody {
  const FoodDetailBody({required this.id});

  final String id;

  factory FoodDetailBody.fromJson(Map<String, dynamic> json) {
    return FoodDetailBody(
      id: json['id'],
    );
  }

  Map<String, dynamic> toQuery() {
    return {
      'id': id,
    };
  }
}
