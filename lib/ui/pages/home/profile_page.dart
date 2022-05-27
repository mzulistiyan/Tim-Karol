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
          return Center(
            child: Column(
              children: [
                PrimaryButton('Logout', () {
                  context.read<AuthCubit>().signOut();
                })
              ],
            ),
          );
        },
      ),
    );
  }
}
