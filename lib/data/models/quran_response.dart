import 'package:equatable/equatable.dart';

import 'list_surah_models/surah_model.dart';

class QuranResponse extends Equatable {
  final List<SurahModel> quranList;

  const QuranResponse({required this.quranList});

  factory QuranResponse.fromJson(Map<String, dynamic> json) => QuranResponse(
        quranList: List<SurahModel>.from((json["data"] ?? [])
            .map((e) => SurahModel.fromJson(e))
            .where((element) => element.number != null)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(quranList.map((e) => e.toJson())),
      };

  @override
  List<Object> get props => [quranList];
}
