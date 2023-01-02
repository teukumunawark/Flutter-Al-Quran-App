import 'package:equatable/equatable.dart';

import '../../../domain/entities/detail_surah_entities/sajda_entities.dart';

class Sajda extends Equatable {
  final bool? recommended;
  final bool? obligatory;

  const Sajda({this.recommended, this.obligatory});

  factory Sajda.fromJson(Map<String, dynamic> json) => Sajda(
        recommended: json['recommended'] as bool?,
        obligatory: json['obligatory'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'recommended': recommended,
        'obligatory': obligatory,
      };

  SajdaEntities toEntity() => SajdaEntities(
        recommended: recommended,
        obligatory: obligatory,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [recommended, obligatory];
}
