import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CarModel {
  final String name;
  final String type;
  final String description;
  final double rating;
  final double goodReviews;
  final double totalScore;
  final double satisfaction;
  RxBool isfavourite = false.obs;
  final String image;

  CarModel({
    required this.name,
    required this.type,
    required this.description,
    required this.rating,
    required this.goodReviews,
    required this.totalScore,
    required this.satisfaction,
    // required this.isfavourite,
    required this.image,
  });
}
