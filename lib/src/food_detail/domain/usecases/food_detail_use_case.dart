import 'package:equatable/equatable.dart';
import 'package:maiapps/core/usecases/usecases.dart';
import 'package:maiapps/core/utils/typedef.dart';
import 'package:maiapps/src/food_detail/data/models/response/food_detail_model.dart';
import 'package:maiapps/src/food_detail/domain/repos/food_detail_repo.dart';

class FoodDetailUseCase extends UseCase<FoodDetailModel, FoodDetailParams> {
  FoodDetailUseCase(this._repo);
  final FoodDetailRepo _repo;

  @override
  ResultFuture<FoodDetailModel> call(FoodDetailParams params) =>
      _repo.getFoodDetail(
        id: params.id,
      );
}

class FoodDetailParams extends Equatable {
  const FoodDetailParams(this.id);
  final String? id;

  @override
  List<Object?> get props => [id];
}
