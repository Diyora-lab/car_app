import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resource/extensions/int_extension.dart';
import 'package:flutter_application_1/feature/cart/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerW = context.read<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Text(
              "$index ${providerW.carList[index].model} ${providerW.carList[index].count}"),
          separatorBuilder: (context, index) => 20.verticalSpace,
          itemCount: providerW.carList.length),
    );
  }
}
