import 'package:flutter/material.dart';
import 'package:machinetask/data/models/cart_item_model.dart';
import 'package:machinetask/viewmodel/cart_model.dart';
import 'package:provider/provider.dart';

class CartItemCard extends StatelessWidget {
  final CartItemModel item;
  const CartItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<CartViewModel>();

    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.network(item.image, width: 80),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold)),
                  Text("\$${item.price}"),
                  Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => vm.decrement(item.id)),
                      Text(item.quantity.toString()),
                      IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => vm.increment(item.id)),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () => vm.deleteItem(item.id),
                          child: const Text("Delete")),
                      TextButton(
                          onPressed: () => vm.toggleSave(item.id),
                          child: const Text("Save for later")),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
