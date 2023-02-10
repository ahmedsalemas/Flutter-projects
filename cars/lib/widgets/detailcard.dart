import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget detailCard(BuildContext context) {
  final model = Get.arguments;

  return DraggableScrollableSheet(
    maxChildSize: .8,
    initialChildSize: .6,
    minChildSize: .6,
    builder: (context, scrollController) {
      return Container(
        height: MediaQuery.of(context).size.height * .5,
        padding: const EdgeInsets.only(
            left: 19,
            right: 19,
            top: 16), //symmetric(horizontal: 19, vertical: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      model.name,
                      style: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.check_circle,
                        size: 18, color: Theme.of(context).primaryColor),
                    const Spacer(),
                  ],
                ),
                subtitle: Text(
                  model.type,
                  style: const TextStyle(
                      fontSize: 14.2,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffb9bfcd)),
                ),
              ),
              const Divider(
                thickness: .3,
                color: Colors.grey,
              ),

              const Text("About",
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)), //.vP16,
              Text(
                model.description,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
