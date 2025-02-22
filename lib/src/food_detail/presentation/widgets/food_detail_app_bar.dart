import 'package:flutter/material.dart';

class FoodDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FoodDetailAppBar({
    super.key,
    required this.itemName,
  });

  final String? itemName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      title: Text(
        itemName ?? '',
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
