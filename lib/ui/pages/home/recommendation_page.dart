import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/cubit/food_cubit.dart';
import 'package:flutter_application_hackathon_karol/models/food_model.dart';
import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/berlangganan/metode_pembayaran_page.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/detail_food_page.dart';
import 'package:flutter_application_hackathon_karol/ui/widgets/food_card.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({Key? key}) : super(key: key);

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  @override
  void initState() {
    context.read<FoodCubit>().fetchFod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget foodCardPremium(List<FoodModel> food) {
      return ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          Container(
            child: GridView.count(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.4,
              crossAxisSpacing: 2,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              children: food.map((FoodModel food) {
                return FoodCard(food);
              }).toList(),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dapatkan lebih banyak daftar makanan',
                    style: Global.regulerTextStyle12,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Lebih dari 500 data makanan yang mengandung kolesterol',
                    style: Global.regulerTextStyle12
                        .copyWith(color: const Color(0xff6D6D6D)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'assets/image_premium.png',
                    width: 212,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Es Krim, Biskuit, Susu, Mentega dan 500+ lainnya',
                    style: Global.regulerTextStyle12
                        .copyWith(color: const Color(0xff6D6D6D)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return const Color(0xff5140BC);
                            } else if (states
                                .contains(MaterialState.disabled)) {
                              return const Color(0xff5140BC);
                            }
                            return const Color(
                                0xff5140BC); // Use the component's default.
                          },
                        ),
                      ),
                      onPressed: () {
                        Get.to(const MetodePembayaran());
                      },
                      child: Text(
                        'Berlangganan untuk akses',
                        style: Global.semiBoldTextStyle12.copyWith(
                            color:
                                (() {} != null) ? Colors.white : Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
        backgroundColor: Global.grey01,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Global.grey01,
          elevation: 0,
          title: Column(
            children: [
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    width: 50,
                    height: 34,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: TextField(
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  size: 14,
                                ),
                                onPressed: () {
                                  /* Clear the search field */
                                },
                              ),
                              hintText: 'Search...',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Filter',
                  style: Global.regulerTextStyle14
                      .copyWith(color: Global.primary01),
                ),
                const SizedBox(
                  width: 18,
                ),
                const Icon(
                  Icons.calendar_today,
                  size: 20,
                )
              ]),
            ],
          ),
        ),
        body: BlocConsumer<FoodCubit, FoodState>(
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
              return foodCardPremium(state.foods);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
