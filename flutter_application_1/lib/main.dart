import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/cart/cart_provider.dart';
import 'package:flutter_application_1/feature/home/home_screen.dart';
import 'package:flutter_application_1/feature/home/provider/cars_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CarApp());
}

class CarApp extends StatelessWidget {
  const CarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CarsProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
