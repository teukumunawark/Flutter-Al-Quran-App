import 'package:al_quran_app/data/models/list_juz_models/juz_model.dart';
import 'package:equatable/equatable.dart';

class JuzResponse extends Equatable {
  final List<JuzModel> listJuz;

  const JuzResponse({required this.listJuz});

  factory JuzResponse.fromJson(Map<String, dynamic> json) => JuzResponse(
        listJuz: List<JuzModel>.from((json["data"] ?? [])
            .map((e) => JuzModel.fromJson(e))
            .where((element) => element.juz != null)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(listJuz.map((e) => e.toJson())),
      };

  @override
  List<Object?> get props => [listJuz];
}
