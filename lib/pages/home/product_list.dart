import 'package:f_store/global_variable.dart';
import 'package:f_store/widget/product_card.dart';
import 'package:f_store/pages/product_detail_page.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Apple',
    'Samsung',
    'Eigfa',
    'Lenovo',
    'Walton',
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    dynamic filterdProducts;
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0x99aaaaaa)),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    //  Device width
    final deviceSize = MediaQuery.sizeOf(context);

    //  Filter products
    if (selectedFilter == 'All') {
      filterdProducts = products;
    } else {
      filterdProducts = products
          .where(
            (item) => (item['company'] == selectedFilter),
          )
          .toList();
    }

    return SafeArea(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Image(
                  height: 60,
                  image: AssetImage('assets/image/logo.png'),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search_rounded),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      side: BorderSide(
                        color: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : const Color(0x99dfdfdf),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color(0x99dfdfdf),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      label: Text(filter),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: deviceSize.width > 950
                    ? 3
                    : (deviceSize.width > 650 ? 2 : 1),
                childAspectRatio: 1.35,
              ),
              itemCount: filterdProducts.length,
              itemBuilder: (contex, index) {
                final product = filterdProducts[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailPage(product: product);
                        },
                      ),
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as num,
                    image: product['imageUrl'] as String,
                    isEven: index.isEven,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
