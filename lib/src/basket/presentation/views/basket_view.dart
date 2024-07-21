import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maiapps/core/common/views/core_utils.dart';
import 'package:maiapps/core/extensions/context_extension.dart';
import 'package:maiapps/src/basket/domain/entitys/basket_data_entity.dart';
import 'package:maiapps/src/basket/presentation/cubit/basket_cubit.dart';
import 'package:maiapps/src/basket/presentation/widgets/basket_tile.dart';
import 'package:shimmer/shimmer.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  List<BasketDataEntity> basketList = [];

  Future<void> onRefresh() async {
    await getBasketList();
  }

  Future<void> getBasketList() async {
    await context.read<BasketCubit>().getBasketList();
  }

  @override
  void initState() {
    super.initState();
    getBasketList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketCubit, BasketState>(
      listener: (context, state) {
        if (state is BasketError) {
          CoreUtils.showSnackBar(context, state.message ?? 'Unknown Error');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            surfaceTintColor: Colors.white,
            title: const Text(
              'Order',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(BasketState state) {
    if (state is BasketLoading) {
      return RefreshIndicator(
        backgroundColor: Colors.white,
        color: Colors.blue,
        onRefresh: onRefresh,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: double.infinity,
                height: context.height * 0.3,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
        ),
      );
    } else if (state is BasketLoaded) {
      return RefreshIndicator(
        backgroundColor: Colors.white,
        color: Colors.blue,
        onRefresh: onRefresh,
        child: ListView.builder(
          itemCount: state.entity?.data?.length ?? 0,
          itemBuilder: (context, index) {
            final basketItem = state.entity?.data?[index];
            return BasketTile(entity: basketItem!);
          },
        ),
      );
    } else {
      return const Center(
        child: Text('Failed to load basket details'),
      );
    }
  }
}
