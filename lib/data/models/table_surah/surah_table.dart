import 'package:al_quran_app/data/models/surah_model/list_surah_models/surah_model.dart';
import 'package:equatable/equatable.dart';

class SurahTable extends Equatable {
  final int? id;
  final String? name;

  const SurahTable({
    this.id,
    this.name,
  });

  factory SurahTable.fromEntity(SurahModel surah) {
    return SurahTable(
      id: surah.number,
      name: surah.name?.transliteration?.id,
    );
  }

  factory SurahTable.fromMap(Map<String, dynamic> map) {
    return SurahTable(
      id: map['number'],
      name: map['name']['transliteration']['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  // SurahEntities toEntity() {
  //   return SurahEntities(
  //     number: id,
  //     name: name ,
  //   );
  // }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
