import 'package:f_store/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        // backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            // iconColor: Theme.of(context).colorScheme.primary,
            leading: Image.asset(cartItem['imageUrl'].toString()),
            title: Text(
              cartItem['title'].toString(),
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              'Color: ${cartItem['color']}',
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: SizedBox(
                        height: 400,
                        child: AlertDialog(
                          title: Text(
                            'Delete Product',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          content: Text(
                            'Do you want to remove ${cartItem['title']}?',
                          ),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .removeProduct(cartItem);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Delete',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
