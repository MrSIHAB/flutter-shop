import 'package:f_store/pages/home/cart_list.dart';
import 'package:f_store/pages/home/product_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // ==========================
    List<Widget> pages = const [
      ProductList(),
      CartList(),
    ];
    // ==========================

    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, size: 35),
            tooltip: 'Home',
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout_rounded, size: 35),
            tooltip: 'Cart',
            label: '',
          ),
        ],
      ),
    );
  }
}
