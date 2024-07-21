import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maiapps/core/common/views/core_utils.dart';
import 'package:maiapps/src/food_detail/presentation/cubit/food_detail_cubit.dart';
import 'package:maiapps/src/food_detail/presentation/widgets/food_detail_app_bar.dart';
import 'package:maiapps/src/home/domain/entitys/food_data_entity.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({
    super.key,
    // required this.entity,
  });

  // final FoodDataEntity entity;

  static const routeName = '/food-detail';

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodDetailCubit, FoodDetailState>(
      listener: (context, state) {
        if (state is FoodDetailError) {
          CoreUtils.showSnackBar(context, state.message ?? 'Unkown Error');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: FoodDetailAppBar(itemName: "widget.entity.title"),
          body: Column(
            children: [
              if (state is FoodDetailLoaded)
                Image(
                  image: AssetImage(
                    state.entity?.foodDetailDataModel?.image ?? '',
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
