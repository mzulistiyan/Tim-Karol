import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/cubit/auth_cubit.dart';

import 'package:flutter_application_hackathon_karol/shared/theme.dart';
import 'package:flutter_application_hackathon_karol/ui/pages/onboarding/login_page.dart';
import 'package:flutter_application_hackathon_karol/ui/widgets/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
          'Profile',
          style: Global.semiBoldTextStyle18.copyWith(color: Colors.black),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Global.primary01,
                content: Text(state.error),
              ),
            );
          } else if (state is AuthInitial) {
            Get.off(LoginPage());
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Get.to(const ProfilePage()),
                  child: Image.asset(
                    'assets/icons/Ellipse_person.png',
                    width: 91,
                    height: 91,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Muhammad Syariful Umam',
                  style: Global.mediumTextStyle18,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Edit Profile',
                      style: Global.mediumTextStyle12,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Ubah Password',
                      style: Global.mediumTextStyle12,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => context.read<AuthCubit>().signOut(),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Keluar',
                        style: Global.mediumTextStyle12
                            .copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
