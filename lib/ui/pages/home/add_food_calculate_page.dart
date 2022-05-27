import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/cubit/cart_cubit.dart';
import 'package:flutter_application_hackathon_karol/models/food_model.dart';
import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/hitung_kolesterol_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class AddFoodPage extends StatelessWidget {
  const AddFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController namaMakanan = TextEditingController(text: '');
    TextEditingController jumlahKalori = TextEditingController();
    return Scaffold(
      backgroundColor: Global.grey01,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Global.grey01,
        elevation: 0,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Hitung Kolesterol',
                style: Global.semiBoldTextStyle18.copyWith(color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<CartCubit>(context).addItemToCart(FoodModel(
                      kalori: int.parse(jumlahKalori.text),
                      name: namaMakanan.text));
                  Get.to(HitungKolesterolPage());
                },
                child: Text(
                  'Simpan',
                  style: Global.regulerTextStyle14
                      .copyWith(color: Global.primary01),
                ),
              ),
            ]),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'Nama Makanan',
            style: Global.regulerTextStyle14,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 38,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextField(
                controller: namaMakanan,
                style: Global.regulerTextStyle14,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Pilih Makanan',
                  hintStyle: Global.regulerTextStyle12,
                  enabledBorder:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Jumlah mg Kolesterol dalam setiap 100gr',
            style: Global.regulerTextStyle14,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 38,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextField(
                controller: jumlahKalori,
                style: Global.regulerTextStyle14,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Pilih Makanan',
                  hintStyle: Global.regulerTextStyle12,
                  enabledBorder:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
