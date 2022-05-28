import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_hackathon_karol/cubit/cart_cubit.dart';
import 'package:flutter_application_hackathon_karol/cubit/food_cubit.dart';
import 'package:flutter_application_hackathon_karol/cubit/subscription_cubit.dart';
import 'package:flutter_application_hackathon_karol/cubit/transaction_cubit.dart';

import 'package:flutter_application_hackathon_karol/ui/pages/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as transition;

import 'cubit/auth_cubit.dart';
import 'cubit/history_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => FoodCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
        BlocProvider(
          create: (context) => HistoryCubit(),
        ),
        BlocProvider(
          create: (context) => SubscriptionCubit(),
        ),
      ],
      child: const GetMaterialApp(
        defaultTransition: transition.Transition.cupertino,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
