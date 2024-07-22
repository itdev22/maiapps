import 'package:gufytea/core/utils/typedef.dart';
import 'package:gufytea/src/basket/data/models/response/basket_model.dart';

abstract class BasketRepo {
  const BasketRepo();

  ResultFuture<BasketModel> getBasketList();
}
