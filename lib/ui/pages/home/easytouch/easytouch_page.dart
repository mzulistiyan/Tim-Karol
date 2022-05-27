import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/easytouch/easy_touch_detail_page.dart';
import 'package:flutter_ripple/flutter_ripple.dart';
import 'package:get/route_manager.dart';

class EasyTouchPage extends StatelessWidget {
  const EasyTouchPage({Key? key}) : super(key: key);

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
            'EasyTouch',
            style: Global.semiBoldTextStyle18.copyWith(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Center(
                child: Image.asset(
                  'assets/icons/icon_robot.png',
                  width: 238,
                  height: 301,
                ),
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: FlutterRipple(
                    child: const Icon(Icons.bluetooth,
                        size: 40, color: Colors.white),
                    rippleColor: const Color(0xffEE7814),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return _showDialogRincian();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'KETUK UNTUK MENGHUBUNGKAN',
              style: Global.semiBoldTextStyle16,
            ),
          ],
        ));
  }

  Widget _showDialogRincian() {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          24,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'Pilih Perangkat',
                        style: Global.semiBoldTextStyle14,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(const EasyTouchDetailPage()),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pak Joko',
                        style: Global.semiBoldTextStyle14,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '18723123',
                        style: Global.regulerTextStyle12,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pak Budi',
                      style: Global.semiBoldTextStyle14,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '18723123',
                      style: Global.regulerTextStyle12,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pak Andi',
                      style: Global.semiBoldTextStyle14,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '18723123',
                      style: Global.regulerTextStyle12,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
