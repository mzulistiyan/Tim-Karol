import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:get/route_manager.dart';

class MetodePembayaranDetatilPage extends StatefulWidget {
  const MetodePembayaranDetatilPage({Key? key}) : super(key: key);

  @override
  State<MetodePembayaranDetatilPage> createState() =>
      _MetodePembayaranDetatilPageState();
}

class _MetodePembayaranDetatilPageState
    extends State<MetodePembayaranDetatilPage> {
  int? _value = 0;
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
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
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(6, 18, 6, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'No. Virtual Account',
                          style: Global.regulerTextStyle12
                              .copyWith(color: const Color(0xff6D6D6D)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '187 0822 4571 8040',
                              style: Global.semiBoldTextStyle18
                                  .copyWith(color: Global.primary01),
                            ),
                            const Icon(
                              Icons.copy,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
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
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const Color(0xff5140BC);
                          } else if (states.contains(MaterialState.disabled)) {
                            return const Color(0xff5140BC);
                          }
                          return const Color(
                              0xff5140BC); // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Lanjutkan Pembayaran',
                      style: Global.semiBoldTextStyle12
                          .copyWith(color: Colors.white),
                    ),
                  ),
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
