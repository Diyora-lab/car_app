import 'package:flutter/material.dart';

enum CarFilters {
  allCars,
  familyCars,
  cheapCars,
  luxuryCars,
  sportCars,
  popularCars,
}

extension CarFiltersExtension on CarFilters {
  Color get getColor {
    switch (this) {
      case CarFilters.allCars:
        return Colors.grey;
      case CarFilters.cheapCars:
        return Colors.brown;
      case CarFilters.familyCars:
        return Colors.yellow;
      case CarFilters.luxuryCars:
        return Colors.red;
      case CarFilters.popularCars:
        return Colors.blue;
      case CarFilters.sportCars:
        return Colors.black;
      default:
        return Colors.pink;
    }
  }

  String get category {
    switch (this) {
      case CarFilters.allCars:
        return "All Cars";
      case CarFilters.cheapCars:
        return "Cheap Cars";
      case CarFilters.familyCars:
        return "Family Cars";
      case CarFilters.luxuryCars:
        return "Luxury Cars";
      case CarFilters.popularCars:
        return "Popular Cars";
      case CarFilters.sportCars:
        return "Sport Cars";
      default:
        return "Other";
    }
  }
}
