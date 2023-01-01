import 'package:al_quran_app/domain/entities/list_juz_entities/juz_entities.dart';
import 'package:al_quran_app/presentation/bloc/quran_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_juz_list_card.dart';

class JuzPage extends StatelessWidget {
  const JuzPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<JuzListBloc, QuranState>(
        builder: (context, state) {
          if (state is QuranLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is JuzHasData) {
            print(state.juzList);
            return BuildJuzList(state.juzList);
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

class BuildJuzList extends StatelessWidget {
  final List<JuzEntities> juzList;

  const BuildJuzList(this.juzList, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: juzList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final juz = juzList[index];

        return JuzListCard(juz);
      },
    );
  }
}
