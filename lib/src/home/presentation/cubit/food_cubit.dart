import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maiapps/src/home/domain/entitys/food_entity.dart';
import 'package:maiapps/src/home/domain/usecases/food_use_case.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit({required FoodUseCase useCase})
      : _useCase = useCase,
        super(const FoodInitial());

  final FoodUseCase _useCase;

  Future<void> getFoodList() async {
    emit(const FoodLoading());

    final result = await _useCase();

    result.fold(
      (failure) => emit(FoodError(failure.message)),
      (food) => emit(FoodLoaded(food)),
    );
  }
}
