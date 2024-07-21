part of 'food_detail_cubit.dart';

sealed class FoodDetailState extends Equatable {
  const FoodDetailState();

  @override
  List<Object?> get props => [];
}

final class FoodDetailInitial extends FoodDetailState {
  const FoodDetailInitial();
}

final class FoodDetailLoading extends FoodDetailState {
  const FoodDetailLoading();
}

final class FoodDetailLoaded extends FoodDetailState {
  const FoodDetailLoaded(this.entity);

  final FoodDetailEntity? entity;
  @override
  List<Object?> get props => [entity];
}

final class FoodDetailError extends FoodDetailState {
  const FoodDetailError(this.message);

  final String? message;
  @override
  List<Object?> get props => [message];
}
