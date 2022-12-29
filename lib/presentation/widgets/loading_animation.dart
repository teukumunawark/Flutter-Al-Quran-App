import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../common/constants.dart';

class BuildAnimationLoading extends StatelessWidget {
  const BuildAnimationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          )
        ],
      ),
    );
  }
}
