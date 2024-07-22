import 'package:flutter/material.dart';
import 'package:gufytea/core/route/arguments.dart';
import 'package:gufytea/src/food_detail/presentation/views/food_detail_screen.dart';
import 'package:gufytea/src/home/domain/entitys/food_data_entity.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.entity,
  });

  final FoodDataEntity entity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          FoodDetailScreen.routeName,
          arguments: FoodDetailArguments(entity),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                image: NetworkImage(entity.image ??
                    'https://static.vecteezy.com/system/resources/previews/016/765/986/original/steak-fast-food-cartoon-png.png'),
                    height: 150,
              ),
              Text(
                entity.title ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                entity.description ?? '',
                style: const TextStyle(
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
