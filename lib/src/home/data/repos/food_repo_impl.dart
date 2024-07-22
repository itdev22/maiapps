import 'package:dartz/dartz.dart';
import 'package:gufytea/core/errors/exceptions.dart';
import 'package:gufytea/core/errors/failures.dart';
import 'package:gufytea/core/utils/typedef.dart';
import 'package:gufytea/src/home/data/datasources/food_remote_data_source.dart';
import 'package:gufytea/src/home/data/models/response/food_model.dart';
import 'package:gufytea/src/home/domain/repos/food_repo.dart';

class FoodRepoImpl extends FoodRepo {
  FoodRepoImpl(this._dataSource);
  final FoodRemoteDataSource _dataSource;

  @override
  ResultFuture<FoodModel> getFoodList() async {
    try {
      final foods = await _dataSource.getFoodList();
      return Right(foods);
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
