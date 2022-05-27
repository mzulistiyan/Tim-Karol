import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/cubit/cart_cubit.dart';
import 'package:flutter_application_hackathon_karol/cubit/transaction_cubit.dart';
import 'package:flutter_application_hackathon_karol/models/cart_model.dart';
import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/add_food_calculate_page.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/home_page.dart';
import 'package:flutter_application_hackathon_karol/ui/widgets/cart_card.dart';
import 'package:flutter_application_hackathon_karol/ui/widgets/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

class HitungKolesterolPage extends StatefulWidget {
  const HitungKolesterolPage({Key? key}) : super(key: key);

  @override
  State<HitungKolesterolPage> createState() => _HitungKolesterolPageState();
}

class _HitungKolesterolPageState extends State<HitungKolesterolPage> {
  final TextEditingController _tanggalTemuController = TextEditingController();
  bool isLoading = false;
  int _numberOfPeople = 0;
  final TextEditingController jumlahKaloriCustom = TextEditingController();
  @override
  void initState() {
    jumlahKaloriCustom.addListener(_numberOfPeopleChanged);
    super.initState();
  }

  _numberOfPeopleChanged() {
    setState(() {
      /// If the TextEditingController is `null`,
      /// then it will assign `1`

      _numberOfPeople = int.tryParse(jumlahKaloriCustom.text) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
    User? user = FirebaseAuth.instance.currentUser;

    Widget cartCard(CartModel cart) {
      return Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15, left: 24, right: 24),
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                  color: Color(0xffFFF8F4),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cart.food!.name,
                          style: Global.regulerTextStyle16,
                        ),
                        // PopupMenuButton(
                        //     onSelected: (value) {
                        //       _onMenuItemSelected(value as int);
                        //     },
                        //     itemBuilder: (context) => [
                        //           _buildPopupMenuItem(
                        //               'Edit', Options.edit.index),
                        //           _buildPopupMenuItem(
                        //               'delete', Options.delete.index),
                        //         ])
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Text(
                          cart.food!.kalori.toString(),
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
                        Text(
                          cart.food!.kalori.toString(),
                          style: const TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 35,
                          width: 170,
                          child: Text(
                            'Masukkan jumlah makanan yang dikonsumsi (dalam gram)',
                            style: Global.regulerTextStyle12,
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 22,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffB4B4B4)),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: TextField(
                              controller: jumlahKaloriCustom,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Total',
                        style: Global.lightTextStyle12
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${cart.food!.kalori + _numberOfPeople} mg ',
                        style: Global.regulerTextStyle14
                            .copyWith(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartListState) {
            return ListView(
              children: cartCubit.carts
                  .map(
                    (e) => CartCard(e),
                  )
                  .toList(),
            );
          }
          return const SizedBox();
        },
      );
    }

    Widget customBottom() {
      return BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return SizedBox(
            height: 165,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: PrimaryButton('+ Tambah Makanan', () {
                    Get.to(const AddFoodPage());
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Keseluruhan',
                            style: Global.lightTextStyle14,
                          ),
                          Text(
                            cartCubit.totalPrice().toString(),
                            style: Global.semiBoldTextStyle18,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: const Color(0xffFFF8F4),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status',
                            style: Global.lightTextStyle14,
                          ),
                          Text(
                            cartCubit.totalPrice().toInt() > 200
                                ? 'Kurang Sehat'
                                : 'Sehat',
                            style: Global.semiBoldTextStyle14,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Global.grey01,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(170.0),
        child: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Global.grey01,
          elevation: 0,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Hitung Kolesterol',
                    style: Global.semiBoldTextStyle18
                        .copyWith(color: Colors.black),
                  ),
                  BlocConsumer<TransactionCubit, TransactionState>(
                    listener: (context, state) {
                      if (state is TransactionSuccess) {
                        Get.to(HomePage());
                      } else if (state is TransactionFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(state.error),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is TransactionLoading) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 30),
                          child: const CircularProgressIndicator(),
                        );
                      }
                      return GestureDetector(
                        onTap: () {
                          context.read<TransactionCubit>().createTransaction(
                              cartCubit.carts,
                              cartCubit.totalPrice(),
                              _tanggalTemuController.text,
                              user!.uid.toString(),
                              _numberOfPeople);
                          Get.to(HomePage());
                          cartCubit.clearCard();
                        },
                        child: Text(
                          'Simpan',
                          style: Global.regulerTextStyle14
                              .copyWith(color: Global.primary01),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanggal',
                    style: Global.regulerTextStyle14,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: TextField(
                        style: Global.regulerTextStyle14,
                        readOnly: true,
                        controller: _tanggalTemuController,
                        decoration: InputDecoration(
                          isDense: true,
                          suffixIcon: IconButton(
                            onPressed: () => _modalDatePicker(context),
                            icon: const Icon(
                              Icons.calendar_today_outlined,
                              size: 16,
                            ),
                          ),
                          hintText: 'Pilih Tanggal',
                          hintStyle: Global.regulerTextStyle12,
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(50.0),
          ),
        ),
      ),
      body: cartCubit.carts.isEmpty
          ? const SizedBox()
          : BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return content();
              },
            ),
      bottomNavigationBar: customBottom(),
    );
  }

  void _modalDatePicker(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      ),
      context: context,
      builder: (builder) {
        return Wrap(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text('Pilih Tanggal',
                          style: Global.boldTextStyle16,
                          textAlign: TextAlign.left),
                    ),
                    Container(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.close)))
                  ],
                )),
            SizedBox(
              height: 200,
              child: DefaultTextStyle.merge(
                style: Global.boldTextStyle16,
                child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (val) {
                      setState(() {
                        _tanggalTemuController.text =
                            DateFormat("d / MMM / y").format(val);
                      });
                    }),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
              child: PrimaryButton('Pilih Tanggal', () {
                if (_tanggalTemuController.text == '') {
                  setState(() {
                    _tanggalTemuController.text =
                        DateFormat("d / MMM / y").format(DateTime.now());
                  });
                }
                Get.back();
              }),
            )
          ],
        );
      },
    );
  }
}
