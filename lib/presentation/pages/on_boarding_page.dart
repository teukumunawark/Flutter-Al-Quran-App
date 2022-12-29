import 'package:al_quran_app/common/constants.dart';
import 'package:al_quran_app/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatelessWidget {
  static const routeName = '/onboard-page';

  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeAppBar = MediaQuery.of(context).padding.top;
    final height = MediaQuery.of(context).size.height - sizeAppBar;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.05),
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
                  height: height * 0.65,
                  child: Stack(
                    children: [
                      Container(
                          height: height * 0.615,
                          width: size.width,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xffDF98FA),
                                Color(0xff9055FF),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Stack(
                            children: [
                              SvgPicture.asset('assets/svg/onboard-img.svg'),
                              Positioned(
                                top: 100,
                                left: 5,
                                right: 5,
                                child: Lottie.asset('assets/lottie/quran.json'),
                              ),
                            ],
                          )),
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
