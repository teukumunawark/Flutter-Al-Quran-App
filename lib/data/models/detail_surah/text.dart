import 'package:equatable/equatable.dart';

import 'transliteration.dart';

class Text extends Equatable {
  final String? arab;
  final Transliteration? transliteration;

  const Text({this.arab, this.transliteration});

  factory Text.fromJson(Map<String, dynamic> json) => Text(
        arab: json['arab'] as String?,
        transliteration: json['transliteration'] == null
            ? null
            : Transliteration.fromJson(
                json['transliteration'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'arab': arab,
        'transliteration': transliteration?.toJson(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [arab, transliteration];
}
