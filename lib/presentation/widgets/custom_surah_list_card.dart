import 'package:al_quran_app/common/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/constants.dart';
import '../../domain/entities/surah_entities/list_surah_entities/surah_entities.dart';

class SurahListCard extends StatelessWidget {
  const SurahListCard(this.surah, {super.key});

  final SurahEntities surah;

  @override
  Widget build(BuildContext context) {
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
                          color: context.watch<ThemeBloc>().state
                              ? kWhite
                              : kBlack,
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
                    surah.name!.transliteration!.id.toString(),
                    style: kHeading5.copyWith(
                      fontSize: 16,
                      color: context.watch<ThemeBloc>().state ? kWhite : kBlack,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "${surah.revelation!.id} | ${surah.numberOfVerses} ayat"
                        .toUpperCase(),
                    style: kSubtitle.copyWith(
                      color: kOsloGrey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                surah.name!.short.toString(),
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
        context.pushNamed('detail-surah', params: {
          'id': surah.number.toString(),
        });
      },
    );
  }
}
