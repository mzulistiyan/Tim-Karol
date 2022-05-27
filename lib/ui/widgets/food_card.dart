import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/models/food_model.dart';
import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/detail_food_page.dart';
import 'package:get/route_manager.dart';

class FoodCard extends StatelessWidget {
  final FoodModel food;
  const FoodCard(
    this.food, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(DetailFoodPage(food)),
      child: Container(
        margin: const EdgeInsets.only(right: 10, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: 150,
        height: 210,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              food.imageUrl,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(9, 11, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: Global.regulerTextStyle12,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        food.kalori.toString(),
                        style: Global.regulerTextStyle18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'mg',
                        style: TextStyle(fontSize: 8),
                      ),
                      Text(
                        '/',
                        style: Global.regulerTextStyle18,
                      ),
                      const Text(
                        '100gr',
                        style: TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
