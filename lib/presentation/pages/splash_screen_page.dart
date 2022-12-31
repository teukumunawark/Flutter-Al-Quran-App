import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../common/constants.dart';
import '../bloc/quran_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<SurahListBloc>().add(OnQuranList());
    });
    startSplashScreen();
  }

  startSplashScreen() async {
    return Future.delayed(
        const Duration(seconds: 5), () => context.goNamed('onboard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: kWhite,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/quran.json'),
            const SizedBox(height: 50),
            const Center(
              child: CircularProgressIndicator(
                color: kBlueViolet,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
