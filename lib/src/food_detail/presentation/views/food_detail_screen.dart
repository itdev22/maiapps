import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maiapps/core/common/views/core_utils.dart';
import 'package:maiapps/core/extensions/context_extension.dart';
import 'package:maiapps/src/food_detail/presentation/cubit/food_detail_cubit.dart';
import 'package:maiapps/src/food_detail/presentation/widgets/food_detail_app_bar.dart';
import 'package:maiapps/src/home/domain/entitys/food_data_entity.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({
    Key? key,
    required this.entity,
  }) : super(key: key);

  // final FoodDataEntity entity;

  static const routeName = '/food-detail';

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int counter = 0;
  int counterPrice = 0;

  @override
  void initState() {
    super.initState();
    getDetailItem();
  }

  Future<void> getDetailItem() async {
    context.read<FoodDetailCubit>().getFoodDetail(id: widget.entity.id);
  }

  void incrementCounter() {
    setState(() {
      counter++;
      if (widget.entity.price != null) {
        counterPrice += widget.entity.price!;
      }
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
        if (widget.entity.price != null) {
          counterPrice -= widget.entity.price!;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodDetailCubit, FoodDetailState>(
      listener: (context, state) {
        if (state is FoodDetailError) {
          CoreUtils.showSnackBar(context, state.message ?? 'Unknown Error');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: FoodDetailAppBar(itemName: widget.entity.title),
          body: Container(
            child: _buildBody(state),
          ),
        );
      },
    );
  }

  Widget _buildBody(FoodDetailState state) {
    if (state is FoodDetailLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is FoodDetailLoaded) {
      final entity = state.entity?.foodDetailDataModel;
      if (entity == null) {
        return const Center(child: Text('Failed to load food detail'));
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: context.height * 0.3,
            child: Image.network(
              entity.image ?? '',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entity.description ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Harga : Rp.${entity.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Pembelian : ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Rp.$counterPrice',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: decrementCounter,
                          icon: const Icon(Icons.remove),
                          tooltip: 'Kurang',
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '$counter',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: incrementCounter,
                          icon: const Icon(Icons.add),
                          tooltip: 'Tambah',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Tambah Keranjang'),
            ),
          ),
        ],
      );
    } else {
      return const Center(child: Text('Failed to load food detail'));
    }
  }
}
