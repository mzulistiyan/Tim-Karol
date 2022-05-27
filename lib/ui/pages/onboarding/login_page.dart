import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/cubit/auth_cubit.dart';

import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/home/home_page.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/onboarding/registration_page.dart';
import 'package:flutter_application_hackathon_karol/ui/widgets/primary_button.dart';
import 'package:flutter_application_hackathon_karol/ui/widgets/text_field_custom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Global.grey01,
      body: Container(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'Selamat Datang\nKembali',
                style: Global.boldTextStyle24,
                textAlign: TextAlign.center,
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
                obsecure: true,
                controller: passwordController,
                hintText: 'Password',
                iconTextField: Icons.lock_open,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Lupa Password ?',
                    style: Global.mediumTextStyle12,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is AuthSuccess) {
                    Get.off(HomePage());
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
                  return PrimaryButton('Masuk', () {
                    print(emailController.text);
                    print(passwordController.text);
                    context.read<AuthCubit>().signIn(
                          email: emailController.text,
                          password: passwordController.text,
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
                    'Belum Punya Akun ? ',
                    style: Global.regulerTextStyle14,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(RegistrationPage()),
                    child: Text(
                      'Daftar',
                      style: Global.regulerTextStyle14
                          .copyWith(color: Global.primary01),
                    ),
                  )
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Image.asset(
                'assets/icons/icon-karol-02.png',
                width: 74,
                height: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}
