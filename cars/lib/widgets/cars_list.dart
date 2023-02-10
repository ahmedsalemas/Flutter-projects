import 'dart:math';

import 'package:cars/controllers/cars_controller.dart';
import 'package:cars/views/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget carsList(BuildContext context) {
  Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      const Color(0xfffa8c73),
      const Color(0xff4cd1bc),
      const Color(0xffb8bfce),
      const Color(0xfffa9881),
      const Color(0xff71b4fb),
      const Color(0xff1b1718),
      const Color(0xffb1a5f6),
      const Color(0xff71b4fb),
      Colors.red,
      Colors.brown,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }

  return SliverList(
    delegate: SliverChildListDelegate(
      [
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("    Top Cars",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(
                    icon: Icon(
                      Icons.sort,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {})
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                children: [
                  Expanded(
                    child: GetX<CarsController>(
                      builder: (controller) {
                        return ListView.builder(
                          itemCount: controller.carsDataList.length,
                          itemBuilder: (context, index) {
                            var model = controller.carsDataList[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    offset: const Offset(4, 4),
                                    blurRadius: 10,
                                    color:
                                        const Color(0xffb8bfce).withOpacity(.2),
                                  ),
                                  BoxShadow(
                                    offset: const Offset(-3, 0),
                                    blurRadius: 15,
                                    color:
                                        const Color(0xffb8bfce).withOpacity(.1),
                                  )
                                ],
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8),
                                child: ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    leading: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(13)),
                                      child: Container(
                                        height: 55,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: randomColor(),
                                        ),
                                        child: Image.asset(
                                          model.image,
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    title: Text(model.name,
                                        style: const TextStyle(
                                          fontSize: 16.2,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    subtitle: Text(model.type,
                                        style: const TextStyle(
                                            fontSize: 14.2,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffb9bfcd))),
                                    trailing: IconButton(
                                      icon: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 30,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        Get.to(() => const DetailsScreen(),
                                            arguments: model);
                                      },
                                    )),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
