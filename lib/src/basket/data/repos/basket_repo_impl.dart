import 'package:dartz/dartz.dart';
import 'package:maiapps/core/errors/exceptions.dart';
import 'package:maiapps/core/errors/failures.dart';
import 'package:maiapps/core/utils/typedef.dart';
import 'package:maiapps/src/basket/data/datasources/basket_remote_data_sources.dart';
import 'package:maiapps/src/basket/data/models/response/basket_model.dart';
import 'package:maiapps/src/basket/domain/repos/basket_repo.dart';

class BasketRepoImpl extends BasketRepo {
  BasketRepoImpl(this._dataSource);
  final BasketRemoteDataSource _dataSource;

  @override
  ResultFuture<BasketModel> getBasketList() async {
    try {
      final basketList = await _dataSource.getBasketList();
      return Right(basketList);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }
}
