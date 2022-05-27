import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/cubit/cart_cubit.dart';
import 'package:flutter_application_hackathon_karol/models/cart_model.dart';
import 'package:flutter_application_hackathon_karol/models/history_model.dart';
import 'package:flutter_application_hackathon_karol/models/transaction_model.dart';
import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

enum Options { edit, delete }

class HistoryCard extends StatefulWidget {
  final HistoryModel transaction;
  HistoryCard(this.transaction);

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  TextEditingController jumlah = TextEditingController(text: '');
  var _popupMenuItemIndex = 0;
  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.transaction.totalKalori.toString()),
                      Text(
                        widget.transaction.foods![1].name,
                        style: Global.regulerTextStyle16,
                      ),
                      PopupMenuButton(
                          onSelected: (value) {},
                          itemBuilder: (context) => [
                                _buildPopupMenuItem('Edit', Options.edit.index),
                                _buildPopupMenuItem(
                                    'delete', Options.delete.index),
                              ])
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.transaction.foods![0].kalori.toString(),
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
                        widget.transaction.foods![0].kalori.toString(),
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
                            controller: jumlah,
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
                      style:
                          Global.lightTextStyle12.copyWith(color: Colors.black),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${widget.transaction.foods![0].kalori.toString()} mg ',
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

  PopupMenuItem _buildPopupMenuItem(String title, int position) {
    return PopupMenuItem(
      value: position,
      child: Text(title),
    );
  }

  Widget _showDialogRincian() {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(25),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(
          0,
        ),
        child: Container(
          height: 105,
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                    child: Text(
                  'Cari Rekomendasi',
                  style: Global.regulerTextStyle14,
                )),
              ),
              Container(width: double.infinity, height: 1, color: Colors.black),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                    child: Text('Tambah Sendiri',
                        style: Global.regulerTextStyle14)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
