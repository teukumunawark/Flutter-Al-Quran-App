import 'package:al_quran_app/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    PreferredSizeWidget appBar() {
      return AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SvgPicture.asset('assets/svg/menu-icon.svg'),
            const SizedBox(width: 24),
            Text(
              "Quran App",
              style: kHeading5.copyWith(color: kMeteorite),
            ),
            const Spacer(),
            SvgPicture.asset('assets/svg/search-icon.svg'),
          ],
        ),
      );
    }

    Widget textHeader() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Asslamualaikum",
              style: kHeading6.copyWith(color: kOsloGrey),
            ),
            Text(
              "teuku munawar",
              style: kHeading5.copyWith(color: kMeteorite, fontSize: 24),
            ),
          ],
        );

    Widget buildCard() => Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Container(
            width: size.width,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xffDF98FA),
                  Color(0xff9055FF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25, left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/svg/book-icon.svg'),
                          const SizedBox(width: 10),
                          Text(
                            "Last Read",
                            style: kHeading6.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text("Al-Fatiah",
                          style: kHeading6.copyWith(
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(height: 5),
                      Text("Ayah No: 1", style: kSubtitle),
                    ],
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset('assets/svg/quran-img.svg'),
                )
              ],
            ),
          ),
        );

    Widget buildTap() => Row(
          children: const [],
        );

    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textHeader(),
            buildCard(),
            buildTap(),
          ],
        ),
      ),
    );
  }
}
