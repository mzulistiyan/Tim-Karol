import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/cubit/subscription_cubit.dart';
import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/berlangganan/metode_pembayaran_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class MetodePembayaran extends StatefulWidget {
  const MetodePembayaran({Key? key}) : super(key: key);

  @override
  State<MetodePembayaran> createState() => _MetodePembayaranState();
}

class _MetodePembayaranState extends State<MetodePembayaran> {
  int? _value = 0;
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Global.grey01,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Global.grey01,
        elevation: 0,
        title: Text(
          'Metode Pembayaran',
          style: Global.semiBoldTextStyle18.copyWith(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset('assets/background_pembayaran.png'),
              Container(
                padding: const EdgeInsets.fromLTRB(48, 45, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pembayaran',
                      style: Global.semiBoldTextStyle18
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Berlangganan untuk akses semua fitur',
                      style: Global.regulerTextStyle12
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(6, 15, 24, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Tagihan',
                          style: Global.regulerTextStyle12
                              .copyWith(color: const Color(0xff6D6D6D)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Rp50.000/bulan',
                          style: Global.semiBoldTextStyle14,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  'Melalui Bank',
                  style: Global.boldTextStyle14,
                ),
                const SizedBox(
                  height: 15,
                ),
                metodePembayaran('BCA', 'assets/icons/BCA.png', 1),
                const SizedBox(
                  height: 15,
                ),
                metodePembayaran('BRI', 'assets/icons/BRI.png', 2),
                const SizedBox(
                  height: 15,
                ),
                metodePembayaran('BNI', 'assets/icons/BNI.png', 3),
                const SizedBox(
                  height: 15,
                ),
                metodePembayaran('Mandiri', 'assets/icons/MANDIRI.png', 4),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  'Melalui Digital Wallet',
                  style: Global.boldTextStyle14,
                ),
                const SizedBox(
                  height: 15,
                ),
                metodePembayaran('Gopay', 'assets/icons/GOPAY.png', 5),
                const SizedBox(
                  height: 15,
                ),
                metodePembayaran('Shopeepay', 'assets/icons/BRI.png', 6),
                const SizedBox(
                  height: 25,
                ),
                BlocConsumer<SubscriptionCubit, SubscriptionState>(
                  listener: (context, state) {
                    if (state is SubscriptionSuccess) {
                      Get.to(const MetodePembayaranDetatilPage());
                    } else if (state is SubscriptionFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.error),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is SubscriptionLoading) {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 30),
                        child: const CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
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
                          context
                              .read<SubscriptionCubit>()
                              .createSubscription(user!.uid.toString());
                        },
                        child: Text(
                          'Lanjutkan Pembayaran',
                          style: Global.semiBoldTextStyle12
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget metodePembayaran(String namaBank, String image, int value) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffFFF8F4),
                  ),
                  child: Center(
                    child: Image.asset(
                      image,
                      width: 30,
                      height: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  namaBank,
                  style: Global.semiBoldTextStyle12,
                ),
              ],
            ),
            SizedBox(
              height: 60,
              width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Radio(
                    activeColor: const Color(0xff5140BC),
                    value: value,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value as int?;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
