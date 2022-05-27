import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/cubit/auth_cubit.dart';

import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/home_page.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/onboarding/login_page.dart';
import 'package:flutter_application_hackathon_karol/ui/widgets/primary_button.dart';
import 'package:flutter_application_hackathon_karol/ui/widgets/text_field_custom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController noTelpController = TextEditingController(text: '');
  TextEditingController tanggalLahirController =
      TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController rePasswordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Global.grey01,
      body: Container(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Bergabung\nBersama Kami',
              style: Global.boldTextStyle24,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFielCustom(
              controller: nameController,
              hintText: 'Nama Lengkap',
              iconTextField: Icons.person_outline,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFielCustom(
              controller: emailController,
              hintText: 'Email',
              iconTextField: Icons.email_outlined,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFielCustom(
              controller: tanggalLahirController,
              hintText: 'Tanggal Lahir',
              iconTextField: Icons.calendar_today_outlined,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFielCustom(
              controller: noTelpController,
              hintText: 'Nomer Handphone',
              iconTextField: Icons.phone_android_sharp,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFielCustom(
              obsecure: true,
              controller: passwordController,
              hintText: 'Password',
              iconTextField: Icons.lock_open,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFielCustom(
              obsecure: true,
              controller: rePasswordController,
              hintText: 'Konfirmasi Password',
              iconTextField: Icons.lock_open,
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is AuthSuccess) {
                  Get.to(HomePage());
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Global.primary01,
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return PrimaryButton('Daftar', () {
                  context.read<AuthCubit>().signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                        noTelp: noTelpController.text,
                        tanggalLahir: tanggalLahirController.text,
                      );
                });
              },
            ),
            const SizedBox(
              height: 20,
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
