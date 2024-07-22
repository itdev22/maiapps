import 'package:equatable/equatable.dart';

import 'package:gufytea/src/basket/data/models/response/basket_data_model.dart';

class BasketEntity extends Equatable {
  const BasketEntity({
    this.data,
  });
  final List<BasketDataModel>? data;

  @override
  List<Object?> get props => [data];
}
