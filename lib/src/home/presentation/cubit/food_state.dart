part of 'food_cubit.dart';

sealed class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object?> get props => [];
}

final class FoodInitial extends FoodState {
  const FoodInitial();
}

final class FoodLoading extends FoodState {
  const FoodLoading();
}

final class FoodLoaded extends FoodState {
  const FoodLoaded(this.entity);

  final FoodEntity? entity;
  @override
  List<Object?> get props => [entity];
}

final class FoodError extends FoodState {
  const FoodError(this.message);

  final String? message;
  @override
  List<Object?> get props => [message];
}
