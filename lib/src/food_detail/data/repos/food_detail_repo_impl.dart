import 'package:dartz/dartz.dart';
import 'package:gufytea/core/errors/exceptions.dart';
import 'package:gufytea/core/errors/failures.dart';
import 'package:gufytea/core/utils/typedef.dart';
import 'package:gufytea/src/food_detail/data/datasources/food_detail_remote_data_source.dart';
import 'package:gufytea/src/food_detail/data/models/response/food_detail_model.dart';
import 'package:gufytea/src/food_detail/domain/repos/food_detail_repo.dart';

class FoodDetailRepoImpl extends FoodDetailRepo {
  FoodDetailRepoImpl(this._dataSource);
  final FoodDetailRemoteDataSource _dataSource;

  @override
  ResultFuture<FoodDetailModel> getFoodDetail({
    required String? id,
  }) async {
    try {
      final foods = await _dataSource.getFoodDetail(id: id);
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
