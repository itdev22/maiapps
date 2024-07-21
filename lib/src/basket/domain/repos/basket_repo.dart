import 'package:maiapps/core/utils/typedef.dart';
import 'package:maiapps/src/basket/data/models/response/basket_model.dart';

abstract class BasketRepo {
  const BasketRepo();

  ResultFuture<BasketModel> getBasketList();
}
