import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resource/app_svg.dart';
import 'package:flutter_application_1/core/resource/extensions/int_extension.dart';
import 'package:flutter_application_1/feature/home/widgets/ad_widget.dart';
import 'package:flutter_application_1/feature/home/widgets/car_chip_widget.dart';
import 'package:flutter_svg/svg.dart';

const filters = [
  "Family cars",
  "Cheap cars",
  "Luxury cars",
  "Sport cars",
  "Popular cars",
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _activeIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    _activeIndex.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
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
                itemCount: filters.length,
                separatorBuilder: (context, index) => 20.horizontalSpace,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ValueListenableBuilder(
                      valueListenable: _activeIndex,
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            _activeIndex.value = index;
                          },
                          child: CarChipWidget(
                              isActive: value == index, label: filters[index]),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
