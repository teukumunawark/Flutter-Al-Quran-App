import 'package:equatable/equatable.dart';

class TranslationDetail extends Equatable {
  final String? en;
  final String? id;

  const TranslationDetail({this.en, this.id});

  factory TranslationDetail.fromJson(Map<String, dynamic> json) =>
      TranslationDetail(
        en: json['en'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'en': en,
        'id': id,
      };

  @override
  List<Object?> get props => [en, id];
}
