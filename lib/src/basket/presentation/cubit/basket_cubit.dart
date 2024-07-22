import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gufytea/src/basket/domain/entitys/basket_entity.dart';
import 'package:gufytea/src/basket/domain/usecases/basket_use_case.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  BasketCubit({required BasketUseCase useCase})
      : _useCase = useCase,
        super(const BasketInitial());

  final BasketUseCase _useCase;

  Future<void> getBasketList() async {
    emit(const BasketLoading());

    final result = await _useCase();

    result.fold(
      (failure) => emit(BasketError(failure.message)),
      (food) => emit(BasketLoaded(food)),
    );
  }
}
