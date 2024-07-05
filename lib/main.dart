import 'package:f_store/providers/cart_provider.dart';
import 'package:f_store/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

//  types of providers bellow
//
//  Provider
//  ChangeNotifierProvider
//  FutureProvider
//  SteamProvider

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (contex) => CartProvider(),
      child: MaterialApp(
        title: "F-Store",
        scrollBehavior: const MaterialScrollBehavior(),
        themeAnimationStyle: AnimationStyle(curve: Curves.easeInToLinear),
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'ubuntu',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF22FFAF),
            primary: const Color(0xFF22FFAF),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0x99aaaaaa),
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            titleMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            bodySmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
