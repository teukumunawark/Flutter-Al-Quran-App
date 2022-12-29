import 'package:al_quran_app/common/constants.dart';
import 'package:al_quran_app/domain/entities/list_surah_entities/surah_entities.dart';
import 'package:al_quran_app/presentation/bloc/quran_bloc.dart';
import 'package:al_quran_app/presentation/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahPage extends StatelessWidget {
  const SurahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SurahListBloc, SurahState>(
        builder: (context, state) {
          if (state is SurahLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SurahHasData) {
            return BuildSurahList(state.listQuran);
          } else if (state is SurahError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("Failed"));
          }
        },
      ),
    );
  }
}

class BuildSurahList extends StatelessWidget {
  final List<SurahEntities> listSurah;

  const BuildSurahList(this.listSurah, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listSurah.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final surah = listSurah[index];

        return InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset('assets/svg/number-icon.svg'),
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: Center(
                          child: Text(
                            surah.number.toString(),
                            style: kHeading6.copyWith(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        surah.name.transliteration.id.toString(),
                        style: kHeading5.copyWith(
                          fontSize: 16,
                          color: kBlack,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "${surah.revelation.id} | ${surah.numberOfVerses} ayat"
                            .toUpperCase(),
                        style: kSubtitle.copyWith(
                          color: kOsloGrey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    surah.name.short,
                    style: GoogleFonts.amiri(
                      color: kBlueViolet,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Divider(
                height: 0,
                thickness: 1,
                indent: 5,
                endIndent: 5,
                color: const Color(0xffBBC4CE).withOpacity(0.4),
              )
            ],
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              DetailPage.routeName,
              arguments: surah.number,
            );
          },
        );
      },
    );
  }
}
