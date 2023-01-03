import 'package:al_quran_app/common/constants.dart';
import 'package:al_quran_app/common/theme_bloc.dart';
import 'package:al_quran_app/presentation/pages/juz_page.dart';
import 'package:al_quran_app/presentation/pages/surah_page.dart';
import 'package:al_quran_app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Widget textHeader() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Asslamualaikum",
              style: kHeading6.copyWith(color: kOsloGrey),
            ),
            Text(
              "teuku munawar",
              style: kHeading5.copyWith(
                color: context.watch<ThemeBloc>().state ? kWhite : kBlueViolet,
                fontSize: 24,
              ),
            ),
          ],
        );

    Widget buildCard() => Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Container(
            width: size.width,
            height: size.height * 0.2,
            clipBehavior: Clip.antiAliasWithSaveLayer,
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
                          style: kHeading5.copyWith(
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

    Widget body() => DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textHeader(),
                        buildCard(),
                      ],
                    ),
                  ),
                  SliverAppBar(
                    pinned: true,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    shape: Border(
                      bottom: BorderSide(
                        width: 3,
                        color: kMeteorite.withOpacity(0.1),
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(0),
                      child: TabBar(
                        unselectedLabelColor: kOsloGrey,
                        labelColor: context.watch<ThemeBloc>().state
                            ? kWhite
                            : kMeteorite,
                        indicatorColor: kBlueViolet,
                        indicatorWeight: 3,
                        tabs: [
                          Tab(
                            child: Text(
                              "Surah",
                              style: kHeading6.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Juz",
                              style: kHeading6.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ];
              },
              body: const TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  SurahPage(),
                  JuzPage(),
                ],
              ),
            ),
          ),
        );

    return Scaffold(
      appBar: appBar(context),
      body: body(),
    );
  }
}
