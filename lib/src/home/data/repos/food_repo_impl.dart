import 'package:dartz/dartz.dart';
import 'package:maiapps/core/errors/exceptions.dart';
import 'package:maiapps/core/errors/failures.dart';
import 'package:maiapps/core/utils/typedef.dart';
import 'package:maiapps/src/home/data/datasources/food_remote_data_source.dart';
import 'package:maiapps/src/home/data/models/response/food_model.dart';
import 'package:maiapps/src/home/domain/repos/food_repo.dart';

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
