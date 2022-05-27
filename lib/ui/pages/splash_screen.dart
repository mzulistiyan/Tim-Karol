// ignore_for_file: avoid_print

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/cubit/auth_cubit.dart';

import 'package:flutter_application_hackathon_karol/ui/pages/home/home_page.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/onboarding/onboarding_page.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Get.to(const OnboardingStep1Page());
      } else {
        print(user.email);
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Get.off(HomePage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/icons/icon-karol-01.png',
              width: 115,
              height: 172,
            ),
          ),
        ],
      ),
    );
  }
}
