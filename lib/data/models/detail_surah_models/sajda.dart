import 'package:equatable/equatable.dart';

class SajdaDetail extends Equatable {
  final bool recommended;
  final bool obligatory;

  const SajdaDetail({required this.recommended, required this.obligatory});

  factory SajdaDetail.fromJson(Map<String, dynamic> json) => SajdaDetail(
        recommended: json['recommended'],
        obligatory: json['obligatory'],
      );

  Map<String, dynamic> toJson() => {
        'recommended': recommended,
        'obligatory': obligatory,
      };

  @override
  List<Object?> get props => [recommended, obligatory];
}
