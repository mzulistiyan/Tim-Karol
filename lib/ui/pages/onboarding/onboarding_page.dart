import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/home_page.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/onboarding/login_page.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/onboarding/registration_page.dart';
import 'package:flutter_application_hackathon_karol/ui/widgets/primary_button.dart';
import 'package:get/route_manager.dart';

class OnboardingStep1Page extends StatelessWidget {
  const OnboardingStep1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.grey01,
      body: Container(
        padding: const EdgeInsets.fromLTRB(24, 150, 24, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang',
              style: Global.boldTextStyle24,
            ),
            Image.asset('assets/illustrations/illustrations-01.png'),
            PrimaryButton(
              'Mulai Mendaftar',
              () => Get.to(RegistrationPage()),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah Punya Akun ? ',
                  style: Global.regulerTextStyle14,
                ),
                GestureDetector(
                  onTap: () => Get.to(LoginPage()),
                  child: Text(
                    'Masuk',
                    style: Global.regulerTextStyle14
                        .copyWith(color: Global.primary01),
                  ),
                )
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/icons/icon-karol-02.png',
              width: 74,
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
