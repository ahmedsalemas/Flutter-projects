import 'package:cars/controllers/cars_controller.dart';
import 'package:cars/widgets/appbar.dart';
import 'package:cars/widgets/category.dart';
import 'package:cars/widgets/cars_list.dart';
import 'package:cars/widgets/header.dart';
import 'package:cars/widgets/searchfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final carsController = Get.put(CarsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: header(context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                    child: searchField(context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.33,
                    child: category(context),
                  ),
                ],
              ),
            ),
            carsList(context),
          ],
        ),
      ),
    );
  }
}
