import 'package:cars/models/car_model.dart';
import 'package:get/state_manager.dart';

class CarsController extends GetxController {
  var carsDataList = <CarModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 0));
    var carsDataResult = [
      CarModel(
        name: "2022 Honda Civic",
        type: "Small Cars",
        rating: 4.5,
        goodReviews: 79.2,
        totalScore: 93.2,
        satisfaction: 85.2,
        //  isfavourite: true,
        image: "assets/2022-honda-civic.png",
        description:
            "Honda's popular Civic compact car gets a big glow-up for the 2022 model year as it debuts a more grown-up appearance, new features, and a refined cabin design. ",
      ),
      CarModel(
        name: "2021 Volkswagen Golf",
        type: "Hatchbacks",
        rating: 3.5,
        goodReviews: 93.2,
        totalScore: 72.2,
        satisfaction: 89.2,
        //  isfavourite: false,
        image: "assets/2021-VW-Gold.png",
        description:
            "Few compact hatchbacks are better than the 2021 Volkswagen Golf, but one that is happens to share the same showroom: the sporty GTI (reviewed separately). Apart from the standard Golf's lower asking price and higher fuel efficiency, it isn't as desirable as its more powerful, better-equipped sibling.",
      ),
      CarModel(
        name: "2022 Audi A7",
        type: "Luxury Cars",
        rating: 2.5,
        goodReviews: 88.2,
        totalScore: 93.94,
        satisfaction: 78.2,
        // isfavourite: false,
        image: "assets/2022-audi-a7.png",
        description:
            "From its sleek fastback design to its refined driving manners, the 2022 Audi A7 is a smooth operator. Audi discreetly hides a hatchback within its fastback profile that makes it more practical than other mid-size luxury sedans such as its corporate counterpart, the A6 sedan, or rivals such as the Mercedes-Benz CLS450.",
      ),
      CarModel(
        name: "2021 Kia Forte",
        type: "Compact Cars",
        rating: 1.5,
        goodReviews: 12.2,
        totalScore: 75.2,
        satisfaction: 84.2,
        //  isfavourite: true,
        image: "assets/2020-Forte-Currant-Red.png",
        description:
            "The Kia Forte reminds us of the well-known saying “champagne taste on a beer budget.” For car buyers with that mindset, the 2022 Forte offers styling and equipment that's reminiscent of the Stinger sports sedan at a much more affordable price. Unfortunately, the Stinger's winning performance isn't part of the package. Instead, the Forte offers middling acceleration from a standard 147-hp four-cylinder and a chassis that's tuned more for comfort than for sporty driving.",
      ),
    ];

    carsDataList.value = carsDataResult;
  }
}
