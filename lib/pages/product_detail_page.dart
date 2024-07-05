import 'package:f_store/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late String selectedColor;
  var icon = Icons.add_shopping_cart_rounded;

  void onTap() {
    if (selectedColor != '0') {
      setState(() {
        Provider.of<CartProvider>(context, listen: false).addProduct({
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'color': selectedColor,
        });
        icon = Icons.done_outline_rounded;
      });
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          icon = Icons.add_shopping_cart_rounded;
        });
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a color'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    selectedColor = (widget.product['color'] as List)[0] as String;
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);
    final childs = [
      Expanded(
        flex: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.product['title'] as String,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            // const Spacer(),
            Expanded(
              child: Image.asset(
                widget.product['imageUrl'] as String,
              ),
            ),
          ],
        ),
      ),
      // const Spacer(),
      // const Spacer(),
      Expanded(
        flex: 1,
        child: Container(
          // width:
          //     deviceSize.width < 650 ? double.infinity : deviceSize.width / 2.1,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Color(0x44A5C5BD),
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: Column(
            children: [
              const Spacer(),
              Text(
                '\$${widget.product['price']}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (widget.product['color'] as List<String>).length,
                  itemBuilder: (context, index) {
                    final color = (widget.product['color'] as List)[index];

                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                        child: Chip(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          backgroundColor: selectedColor == color
                              ? Theme.of(context).colorScheme.primary
                              : null,
                          label: Text(color.toString()),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                icon: Icon(icon),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  elevation: 5,
                  overlayColor: const Color(0x37008F77),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: onTap,
                label: const Text('Add To Cart'),
              ),
              const Spacer(),
            ],
          ),
        ),
      )
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
          // leading: const BackButton(),
          centerTitle: true,
        ),
        body: deviceSize.width > 650
            ? Row(children: childs)
            : Column(children: childs));
  }
}
