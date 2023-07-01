import 'package:exchange_calc/models/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class ProductTile extends StatelessWidget {
  final Item item;

  ProductTile({required this.item});
  @override
  Widget build(BuildContext context) {
    // select
    int count = context.select<CartModel, int>((cart) => cart.getCount(item));
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Count:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$count',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
              width: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: count > 0
                      ? () {
                          // If the item is not in cart, we let the user add it.
                          // We are using context.read() here because the callback
                          // is executed whenever the user taps the button. In other
                          // words, it is executed outside the build method.
                          var cart = context.read<CartModel>();
                          cart.remove(item);
                        }
                      : null,
                  backgroundColor: count == 0 ? Colors.grey : null,
                  foregroundColor: count == 0 ? Colors.black : null,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                FloatingActionButton.large(
                  onPressed: () {
                    // If the item is not in cart, we let the user add it.
                    // We are using context.read() here because the callback
                    // is executed whenever the user taps the button. In other
                    // words, it is executed outside the build method.
                    var cart = context.read<CartModel>();
                    cart.add(item);
                  },
                  // make diameter bigger

                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
