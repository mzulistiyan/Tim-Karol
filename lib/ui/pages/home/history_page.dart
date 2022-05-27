import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/cubit/cart_cubit.dart';
import 'package:flutter_application_hackathon_karol/cubit/history_cubit.dart';
import 'package:flutter_application_hackathon_karol/models/food_model.dart';
import 'package:flutter_application_hackathon_karol/models/history_model.dart';
import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/home_page.dart';
import 'package:flutter_application_hackathon_karol/ui/widgets/history_card.dart';
import 'package:flutter_application_hackathon_karol/ui/widgets/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final TextEditingController _tanggalTemuController = TextEditingController();
  String? _tanggalTemu;
  @override
  void initState() {
    context.read<HistoryCubit>().fetchHistoryHitung();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HistoryCubit historyCubit = BlocProvider.of<HistoryCubit>(context);

    Widget listHistory(List<HistoryModel> transaction) {
      return Container(
        child: Column(
          children: transaction.map((HistoryModel e) {
            return HistoryCard(e);
          }).toList(),
        ),
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
                    'Riwayat Kolesterol',
                    style: Global.semiBoldTextStyle18
                        .copyWith(color: Colors.black),
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
                          hintText: 'Pilih Tanggal Kunjungan',
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
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            child: BlocConsumer<HistoryCubit, HistoryState>(
              listener: (context, state) {
                if (state is HistoryFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is HistorySuccess) {
                  return listHistory(state.historys);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      )),
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
        });
  }

  Widget customBottom(List<HistoryModel> food) {
    HistoryModel historyCustom;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return SizedBox(
          height: 165,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: PrimaryButton('+ Tambah Makanan', () {
                  Get.to(HomePage());
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
                          '',
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
                        Text('Sehat'),
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
}
