import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_application_hackathon_karol/ui/widgets/primary_button.dart';
import 'package:get/route_manager.dart';

class EasyTouchDetailPage extends StatelessWidget {
  const EasyTouchDetailPage({Key? key}) : super(key: key);

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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '24 Mei 2022',
                    style: Global.regulerTextStyle12
                        .copyWith(color: const Color(0xff6D6D6D)),
                  ),
                  Text(
                    '126 mg/dL',
                    style: Global.semiBoldTextStyle14,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '24 Mei 2022',
                    style: Global.regulerTextStyle12
                        .copyWith(color: const Color(0xff6D6D6D)),
                  ),
                  Text(
                    '126 mg/dL',
                    style: Global.semiBoldTextStyle14,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '24 Mei 2022',
                    style: Global.regulerTextStyle12
                        .copyWith(color: const Color(0xff6D6D6D)),
                  ),
                  Text(
                    '126 mg/dL',
                    style: Global.semiBoldTextStyle14,
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: PrimaryButton('Validasi Data', () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return _showDialogRincian();
                  },
                );
              })),
          Spacer(),
        ],
      ),
    );
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
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          'Data telah tervalidasi',
                          style: Global.semiBoldTextStyle16,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Nilai yang tervalidasi akan muncul pada halaman\nutama anda',
                          textAlign: TextAlign.center,
                          style: Global.regulerTextStyle12,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
