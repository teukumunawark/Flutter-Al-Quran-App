import 'package:al_quran_app/common/constants.dart';
import 'package:flutter/material.dart';

class PraySchedulePage extends StatelessWidget {
  const PraySchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Pray Scedule Page",
          style: kHeading6.copyWith(color: kBlueViolet),
        ),
      ),
    );
  }
}
