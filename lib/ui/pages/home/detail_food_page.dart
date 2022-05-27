import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/cubit/cart_cubit.dart';
import 'package:flutter_application_hackathon_karol/models/food_model.dart';
import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/hitung_kolesterol_page.dart';
import 'package:flutter_application_hackathon_karol/ui/widgets/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class DetailFoodPage extends StatelessWidget {
  final FoodModel food;
  const DetailFoodPage(this.food, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 360,
                child: Image.network(
                  food.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(food.name, style: Global.regulerTextStyle24),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff39B487),
                      ),
                      child: Center(
                        child: Text(
                          'Sehat',
                          style: Global.regulerTextStyle12
                              .copyWith(color: Colors.white),
                        ),
                      ),
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
                const SizedBox(height: 15),
                Text(
                  'Deskripsi',
                  style: Global.semiBoldTextStyle14,
                ),
                const SizedBox(height: 15),
                Text(
                  'Daging kelinci boleh dikonsumsi bagi penderita kolesterol. namun perlu diperhatikan kadar tertentu yang diperbolehkan. Direkomendasikan untuk memakan daging kelinci tidak lebih dari 300 gram dalam sehari.',
                  style: Global.regulerTextStyle12,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 100,
                ),
                PrimaryButton('Tambahkan', () {
                  BlocProvider.of<CartCubit>(context).addItemToCart(food);

                  Get.to(const HitungKolesterolPage());
                })
              ],
            ),
          )
        ],
      ),
    ));
  }
}
