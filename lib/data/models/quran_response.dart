import 'package:al_quran_app/data/models/quran_list_model.dart';
import 'package:equatable/equatable.dart';

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
