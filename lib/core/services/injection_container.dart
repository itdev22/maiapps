import 'package:get_it/get_it.dart';
import 'package:gufytea/src/basket/data/datasources/basket_remote_data_sources.dart';
import 'package:gufytea/src/basket/data/repos/basket_repo_impl.dart';
import 'package:gufytea/src/basket/domain/repos/basket_repo.dart';
import 'package:gufytea/src/basket/domain/usecases/basket_use_case.dart';
import 'package:gufytea/src/basket/presentation/cubit/basket_cubit.dart';
import 'package:gufytea/src/food_detail/data/datasources/food_detail_remote_data_source.dart';
import 'package:gufytea/src/food_detail/data/repos/food_detail_repo_impl.dart';
import 'package:gufytea/src/food_detail/domain/repos/food_detail_repo.dart';
import 'package:gufytea/src/food_detail/domain/usecases/food_detail_use_case.dart';
import 'package:gufytea/src/food_detail/presentation/cubit/food_detail_cubit.dart';
import 'package:gufytea/src/home/data/datasources/food_remote_data_source.dart';
import 'package:gufytea/src/home/data/repos/food_repo_impl.dart';
import 'package:gufytea/src/home/domain/repos/food_repo.dart';
import 'package:gufytea/src/home/domain/usecases/food_use_case.dart';
import 'package:gufytea/src/home/presentation/cubit/food_cubit.dart';
import 'package:gufytea/src/profile/presentation/cubit/profile_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initBasket();
  await _initFoodDetail();
  await _initFood();
  await _initProfile();
}

Future<void> _initBasket() async {
  sl
    ..registerFactory(() => BasketCubit(useCase: sl()))
    ..registerLazySingleton(() => BasketUseCase(sl()))
    ..registerLazySingleton<BasketRepo>(() => BasketRepoImpl(sl()))
    ..registerLazySingleton<BasketRemoteDataSource>(
        () => BasketRemoteDataSourceImpl());
}

Future<void> _initFoodDetail() async {
  sl
    ..registerFactory(() => FoodDetailCubit(useCase: sl()))
    ..registerLazySingleton(() => FoodDetailUseCase(sl()))
    ..registerLazySingleton<FoodDetailRepo>(() => FoodDetailRepoImpl(sl()))
    ..registerLazySingleton<FoodDetailRemoteDataSource>(
        () => const FoodDetailRemoteDataSourceImpl());
}

Future<void> _initFood() async {
  sl
    ..registerFactory(() => FoodCubit(useCase: sl()))
    ..registerLazySingleton(() => FoodUseCase(sl()))
    ..registerLazySingleton<FoodRepo>(() => FoodRepoImpl(sl()))
    ..registerLazySingleton<FoodRemoteDataSource>(
        () => const FoodRemoteDataSourceImpl());
}

Future<void> _initProfile() async {
  sl.registerFactory(() => ProfileCubit());
}
