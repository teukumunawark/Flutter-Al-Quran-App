import 'package:equatable/equatable.dart';

import 'list_surah_models/surah_model.dart';

class SurahResponse extends Equatable {
  final List<SurahModel> surahList;

  const SurahResponse({required this.surahList});

  factory SurahResponse.fromJson(Map<String, dynamic> json) => SurahResponse(
        surahList: List<SurahModel>.from((json["data"] ?? [])
            .map((e) => SurahModel.fromJson(e))
            .where((element) => element.number != null)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(surahList.map((e) => e.toJson())),
      };

  @override
  List<Object> get props => [surahList];
}
