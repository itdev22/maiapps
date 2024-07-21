import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maiapps/core/common/views/core_utils.dart';
import 'package:maiapps/src/home/domain/entitys/food_data_entity.dart';
import 'package:maiapps/src/home/presentation/cubit/food_cubit.dart';
import 'package:maiapps/src/home/presentation/widgets/food_tile.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<FoodDataEntity> foodList = [];

  Future<void> onRefresh() async {
    await getFoodList();
  }

  Future<void> getFoodList() async {
    await context.read<FoodCubit>().getFoodList();
  }

  @override
  void initState() {
    super.initState();
    getFoodList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodCubit, FoodState>(
      listener: (context, state) {
        if (state is FoodError) {
          CoreUtils.showSnackBar(context, state.message ?? 'Unknown Error');
        } else if (state is FoodLoaded) {
          setState(() {
            foodList = state.entity?.foodDataModel ?? [];
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            surfaceTintColor: Colors.white,
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello'),
                Text(
                  'Rama Mai',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          body: RefreshIndicator(
            color: Colors.blue,
            backgroundColor: Colors.white,
            onRefresh: onRefresh,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state is FoodLoading)
                      _buildLoadingGrid()
                    else if (state is FoodLoaded)
                      _buildFoodGrid(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoadingGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFoodGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: foodList.length,
      itemBuilder: (context, index) {
        final foodDetail = foodList[index];
        return FoodTile(entity: foodDetail);
      },
    );
  }
}
