import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gufytea/src/basket/domain/entitys/basket_data_entity.dart';
import 'package:gufytea/src/basket/presentation/widgets/basket_item_tile.dart';

class BasketTile extends StatelessWidget {
  final BasketDataEntity entity;

  const BasketTile({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Detail Pemesanan',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Text(
                '${entity.id}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap:
                    true, // Ensures the ListView only occupies the space it needs
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scrolling of the inner ListView
                itemCount: entity.cartDetails?.length ?? 0,
                itemBuilder: (context, index) {
                  final basketItem = entity.cartDetails?[index];
                  return BasketItemTile(entity: basketItem!);
                },
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                    child: Text(
                      'Total : ${entity.total}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
