import 'package:al_quran_app/common/constants.dart';
import 'package:al_quran_app/common/theme_bloc.dart';
import 'package:al_quran_app/domain/entities/surah_entities/detail_surah_entities/detail_surah_entities.dart';
import 'package:al_quran_app/presentation/bloc/quran_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/error_message.dart';
import '../widgets/loading_animation.dart';

class DetailSurahPage extends StatefulWidget {
  final String id;

  const DetailSurahPage({super.key, required this.id});

  @override
  State<DetailSurahPage> createState() => _DetailSurahPageState();
}

class _DetailSurahPageState extends State<DetailSurahPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DetailSurahBloc>().add(OnDetailSurah(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailSurahBloc, QuranState>(
        builder: (context, state) {
          if (state is QuranLoading) {
            return const BuildAnimationLoading();
          } else if (state is DetailSurahHasData) {
            return BuildDetail(state.detailSurah);
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
  final DetailSurahEntities surah;
  const BuildDetail(this.surah, {super.key});
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
                          surah.name?.transliteration?.id as String,
                          style: kHeading5.copyWith(fontSize: 28),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          surah.name?.translation?.id as String,
                          style: kHeading5.copyWith(fontSize: 18),
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
                              "${surah.revelation!.id}(${surah.revelation!.arab})",
                              style: kHeading5.copyWith(fontSize: 16),
                            ),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: kWhite,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "${surah.numberOfVerses} ayat",
                              style: kHeading5.copyWith(fontSize: 16),
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
          itemCount: surah.verses!.length,
          itemBuilder: (context, index) {
            final verse = surah.verses![index];
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
        title: surah.name?.transliteration?.id,
        iconPath: 'assets/svg/back-arrow-icon.svg',
        onPressed: () => context.pop(),
      ),
      body: body(),
    );
  }
}
