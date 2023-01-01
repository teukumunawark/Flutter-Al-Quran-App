import 'package:al_quran_app/domain/entities/list_surah_entities/surah_entities.dart';
import 'package:al_quran_app/presentation/bloc/quran_bloc.dart';
import 'package:al_quran_app/presentation/widgets/custom_surah_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurahPage extends StatelessWidget {
  const SurahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SurahListBloc, QuranState>(
        builder: (context, state) {
          if (state is QuranLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SurahHasData) {
            return BuildSurahList(state.surahList);
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

        return SurahListCard(surah);
      },
    );
  }
}
