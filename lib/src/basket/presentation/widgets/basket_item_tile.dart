import 'package:flutter/material.dart';
import 'package:maiapps/src/basket/domain/entitys/basket_cart_details_entity.dart';

class BasketItemTile extends StatelessWidget {
  final BasketCartDetailsEntity entity;

  const BasketItemTile({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image.network(entity.item?.image ?? ''),
            title: Text(entity.item?.title ?? ''),
            subtitle: Text(
              'Rp.${entity.item?.price ?? '-'}',
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Jumlah : ${entity.quantity}'),
              Text(
                'Total : ${entity.total}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
