import 'package:al_quran_app/common/theme_bloc.dart';
import 'package:al_quran_app/domain/entities/juz_entities/detail_juz_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/constants.dart';
import '../bloc/quran_bloc.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/error_message.dart';
import '../widgets/loading_animation.dart';

class DetailJuzPage extends StatefulWidget {
  final String id;

  const DetailJuzPage({super.key, required this.id});

  @override
  State<DetailJuzPage> createState() => _DetailJuzPageState();
}

class _DetailJuzPageState extends State<DetailJuzPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DetailJuzBloc>().add(OnDetailJuz(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailJuzBloc, QuranState>(
        builder: (context, state) {
          if (state is QuranLoading) {
            return const BuildAnimationLoading();
          } else if (state is DetailJuzHasData) {
            return BuildDetail(state.detailJuz);
          } else if (state is QuranError) {
            return ErrorMessage(message: state.message);
          } else {
            return const ErrorMessage(message: "Failed");
          }
        },
      ),
    );
  }
}

class BuildDetail extends StatelessWidget {
  final DetailJuzEntities juz;
  const BuildDetail(this.juz, {super.key});
  @override
  Widget build(BuildContext context) {
    Widget buildCard() => Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 30),
          child: Container(
            height: 255,
            width: double.maxFinite,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                colors: [
                  Color(0xffDF98FA),
                  Color(0xff9055FF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset('assets/svg/card-quran.svg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "SURAH",
                          style: kHeading5.copyWith(fontSize: 22),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Surah(${juz.juzStartSurahNumber})  -  Surah(${juz.juzEndSurahNumber})",
                          style: kHeading5.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Divider(
                          thickness: 1.5,
                          color: kWhite.withOpacity(0.4),
                          indent: 50,
                          endIndent: 50,
                          height: 20,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              juz.juzStartInfo.toString().split(' ')[0],
                              style: kHeading5.copyWith(fontSize: 20),
                            ),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: kWhite,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              " ${juz.juzEndInfo.toString().split(' ')[0]}",
                              style: kHeading5.copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset("assets/svg/bismillah.svg")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );

    Widget buildListAyat() => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: juz.verses!.length,
          itemBuilder: (context, index) {
            final verse = juz.verses![index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 48,
                  decoration: BoxDecoration(
                    color:
                        context.watch<ThemeBloc>().state ? kSecondDark : kGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: kBlueViolet,
                        child: Center(
                          child: Text(
                            verse.number!.inSurah.toString(),
                            style: kSubtitle.copyWith(color: kWhite),
                          ),
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset('assets/svg/share-icon.svg'),
                      const SizedBox(width: 16),
                      SvgPicture.asset('assets/svg/play-icon.svg'),
                      const SizedBox(width: 16),
                      SvgPicture.asset('assets/svg/bookmark-surah.svg'),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    verse.text!.arab.toString(),
                    style: GoogleFonts.amiri(
                      color: context.watch<ThemeBloc>().state ? kWhite : kBlack,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  verse.translation!.id.toString(),
                  style: kBodyText.copyWith(
                    color: kOsloGrey,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 1.6,
                ),
                const SizedBox(height: 15),
              ],
            );
          },
        );

    Widget body() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildCard(),
                    ],
                  ),
                ),
              ];
            },
            body: buildListAyat(),
          ),
        );

    return Scaffold(
      appBar: appBar(
        context,
        title: "Juz ${juz.juz}",
        iconPath: 'assets/svg/back-arrow-icon.svg',
        onPressed: () => context.pop(),
      ),
      body: body(),
    );
  }
}
