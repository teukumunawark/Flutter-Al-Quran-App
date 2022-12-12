import 'package:equatable/equatable.dart';

class Transliteration extends Equatable {
  final String? en;
  final String? id;

  const Transliteration({this.en, this.id});

  factory Transliteration.fromJson(Map<String, dynamic> json) {
    return Transliteration(
      en: json['en'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'en': en,
        'id': id,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [en, id];
}
