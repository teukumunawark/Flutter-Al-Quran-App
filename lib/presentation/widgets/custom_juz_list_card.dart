import 'package:al_quran_app/domain/entities/list_juz_entities/juz_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../common/constants.dart';

class JuzListCard extends StatelessWidget {
  const JuzListCard(this.juz, {super.key});

  final JuzEntities juz;

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
                        juz.juz.toString(),
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
                    'JUZ ${juz.juz}  ( ${juz.totalVerses} Ayat )',
                    style: kHeading5.copyWith(
                      fontSize: 16,
                      color: kBlack,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        juz.juzStartInfo!.split(' ')[0],
                        style: kSubtitle.copyWith(
                          color: kOsloGrey,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const CircleAvatar(
                        radius: 3,
                        backgroundColor: kBlueViolet,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        juz.juzEndInfo!.split(' ')[0],
                        style: kSubtitle.copyWith(
                          color: kOsloGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
        context.pushNamed('detail', params: {
          // 'id': juz.number.toString(),
        });
      },
    );
  }
}
