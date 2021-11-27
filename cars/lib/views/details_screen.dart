import 'package:cars/widgets/detailcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Get.arguments;

    return Scaffold(
      appBar: AppBar(actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BackButton(color: Theme.of(context).primaryColor),
            Obx(
              () => IconButton(
                onPressed: () {
                  model.isfavourite.value = !model.isfavourite.value;
                },
                icon: Icon(
                  model.isfavourite.value
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: model.isfavourite.value ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ]),
      backgroundColor: const Color(0xffd9eeff),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Image.asset(model.image),
            detailCard(context),
          ],
        ),
      ),
    );
  }
}
