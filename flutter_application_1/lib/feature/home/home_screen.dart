import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/car_filters.dart';
import 'package:flutter_application_1/core/resource/app_svg.dart';
import 'package:flutter_application_1/core/resource/extensions/context_extension.dart';
import 'package:flutter_application_1/core/resource/extensions/int_extension.dart';
import 'package:flutter_application_1/feature/cart/cart_provider.dart';
import 'package:flutter_application_1/feature/cart/cart_screen.dart';
import 'package:flutter_application_1/feature/cart/detail/detail_screen.dart';
import 'package:flutter_application_1/feature/home/provider/cars_provider.dart';
import 'package:flutter_application_1/feature/home/widgets/ad_widget.dart';
import 'package:flutter_application_1/feature/home/widgets/car_chip_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _activeCategory = ValueNotifier<CarFilters?>(null);

  @override
  void dispose() {
    _activeCategory.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerW = context.watch<CarsProvider>();
    return Scaffold(
      drawer: Container(
        color: Colors.white,
        child: const Column(
          children: [
            Text("DRAWER"),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(AppSvg.drawerIcon),
          );
        }),
        actions: [
          IconButton(
            onPressed: () {
              context.push(
                const CartScreen(),
              );
            },
            icon: const Icon(
              Icons.add_shopping_cart,
              size: 30,
            ),
          )
        ],
      ),
      body: Padding(
        padding: 15.symetricHorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const AdWidget(),
            50.verticalSpace,
            SizedBox(
              height: 60,
              child: ListView.separated(
                itemCount: CarFilters.values.length,
                separatorBuilder: (context, index) => 20.horizontalSpace,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ValueListenableBuilder(
                      valueListenable: _activeCategory,
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () =>
                              _onItemTap(type: CarFilters.values[index]),
                          child: CarChipWidget(
                              isActive: CarFilters.values[index] == value,
                              label: CarFilters.values[index].category),
                        );
                      });
                },
              ),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 40.0,
                      crossAxisSpacing: 35.0,
                      childAspectRatio: 1.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            context.push(
                              DetailScreen(car: providerW.currentList[index]),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: providerW.currentList[index].type.getColor
                                  .withOpacity(0.4),
                              borderRadius: 20.borderRadius,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) =>
                                        const SizedBox.shrink(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    imageUrl:
                                        providerW.currentList[index].image,
                                  ),
                                ),
                                Row(
                                  children: [
                                    15.horizontalSpace,
                                    Expanded(
                                      child: Text(
                                          "${providerW.currentList[index].brand} ${providerW.currentList[index].model}"),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context
                                            .read<CartProvider>()
                                            .addItemToCart(
                                                providerW.currentList[index]);
                                      },
                                      icon: const Icon(Icons.add_shopping_cart),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: providerW.currentList.length,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onItemTap({required CarFilters type}) {
    final providerR = context.read<CarsProvider>();
    _activeCategory.value = type;
    switch (type) {
      case CarFilters.popularCars:
        providerR.showPopularCars();
      case CarFilters.familyCars:
        providerR.showFamilyCar();
      case CarFilters.cheapCars:
        providerR.showCheapCars();
      case CarFilters.luxuryCars:
        providerR.showLuxuryCars();
      case CarFilters.sportCars:
        providerR.showSportCar();
      case CarFilters.allCars:
        providerR.showAllCars();

      default:
    }
  }
}
