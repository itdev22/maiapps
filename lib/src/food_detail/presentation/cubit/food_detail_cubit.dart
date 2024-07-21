import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maiapps/src/food_detail/domain/entitys/food_detail_entity.dart';
import 'package:maiapps/src/food_detail/domain/usecases/food_detail_use_case.dart';

part 'food_detail_state.dart';

class FoodDetailCubit extends Cubit<FoodDetailState> {
  FoodDetailCubit({required FoodDetailUseCase useCase})
      : _useCase = useCase,
        super(const FoodDetailInitial());

  final FoodDetailUseCase _useCase;

  Future<void> getFoodDetail({
    required String? id,
  }) async {
    emit(const FoodDetailLoading());

    final result = await _useCase(
      FoodDetailParams(id),
    );

    result.fold(
      (failure) => emit(FoodDetailError(failure.message)),
      (food) => emit(FoodDetailLoaded(food)),
    );
  }
}
