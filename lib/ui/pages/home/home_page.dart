import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/cubit/auth_cubit.dart';
import 'package:flutter_application_hackathon_karol/cubit/food_cubit.dart';
import 'package:flutter_application_hackathon_karol/models/food_model.dart';

import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/easytouch/easytouch_page.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/history_page.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/hitung_kolesterol_page.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/recommendation_page.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/profile_page.dart';
import 'package:flutter_application_hackathon_karol/ui/widgets/food_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import 'profile_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    // TODO: implement initState
    context.read<FoodCubit>().fetchFod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget foodCard(List<FoodModel> food) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              children: food.map((FoodModel food) {
                return FoodCard(food);
              }).toList(),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Global.grey01,
      body: SafeArea(
        child: ListView(
          children: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccess) {
                  return Container(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hai, ${state.user.name}',
                          style: Global.regulerTextStyle18,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(const ProfilePage()),
                          child: Image.asset(
                            'assets/icons/Ellipse_person.png',
                            width: 36,
                            height: 36,
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/home_image.png',
                  width: double.infinity,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(40, 45, 65, 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total\nKolesterol',
                            style: Global.boldTextStyle14
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '24/02/2022',
                            style: Global.lightTextStyle14
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '126',
                            style: Global.boldTextStyle24
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            'mg/dL',
                            style: Global.regulerTextStyle14
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rekomendasi',
                        style: Global.mediumTextStyle16,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(const RecommendationPage()),
                        child: Text(
                          'Lihat Semua',
                          style: Global.lightTextStyle16,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<FoodCubit, FoodState>(
                    listener: (context, state) {
                      if (state is FoodFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Global.primary01,
                            content: Text(state.error),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is FoodSuccess) {
                        return foodCard(state.foods);
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Get.to(const HitungKolesterolPage()),
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 24, right: 24, top: 24),
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFF5DF),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 3,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(18, 22, 22, 22),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/Icon-calculator.png',
                              width: 36,
                              height: 36,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Hitung Kolesterol',
                                  style: Global.mediumTextStyle14,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Dalam Makanan',
                                  style: Global.mediumTextStyle14,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(HistoryPage()),
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 24, right: 24, top: 24, bottom: 0),
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xffFBE0E0),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 3,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(18, 22, 22, 22),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/Icon-calender.png',
                              width: 36,
                              height: 36,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Riwayat',
                                  style: Global.mediumTextStyle14,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Kolesterol',
                                  style: Global.mediumTextStyle14,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to((const EasyTouchPage()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 24, right: 24, top: 24, bottom: 50),
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xffE0E6FB),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 3,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(18, 22, 22, 22),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/robotPinkRobot1.png',
                              width: 36,
                              height: 36,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Hubungkan dengan',
                                  style: Global.mediumTextStyle14,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'EasyTouch',
                                  style: Global.mediumTextStyle14,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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
