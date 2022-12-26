import 'package:al_quran_app/common/constants.dart';
import 'package:al_quran_app/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingPage extends StatelessWidget {
  static const routeName = '/';

  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.04),
                Text(
                  "Quran App",
                  style: kHeading4.copyWith(color: kMeteorite),
                ),
                const SizedBox(height: 16),
                Text(
                  "Learn Quran and\nRecite once everyday",
                  style: kHeading6.copyWith(color: kOsloGrey),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                SizedBox(
                  height: 480,
                  child: Stack(
                    children: [
                      Container(
                        height: 450,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: kMeteorite,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SvgPicture.asset(
                          'assets/svg/onboard-img.svg',
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Material(
                          borderRadius: BorderRadius.circular(50),
                          color: kLightSalmon,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            child: SizedBox(
                              height: 60,
                              width: 185,
                              child: Center(
                                child: Text(
                                  "Get Started",
                                  style: kHeading6,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, HomePage.routeName);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.08)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
