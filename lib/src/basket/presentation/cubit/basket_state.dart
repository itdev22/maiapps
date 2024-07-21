part of 'basket_cubit.dart';

sealed class BasketState extends Equatable {
  const BasketState();

  @override
  List<Object?> get props => [];
}

final class BasketInitial extends BasketState {
  const BasketInitial();
}

final class BasketLoading extends BasketState {
  const BasketLoading();
}

final class BasketLoaded extends BasketState {
  const BasketLoaded(this.entity);

  final BasketEntity? entity;
  @override
  List<Object?> get props => [entity];
}

final class BasketError extends BasketState {
  const BasketError(this.message);

  final String? message;
  @override
  List<Object?> get props => [message];
}
