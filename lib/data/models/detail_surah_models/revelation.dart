import 'package:equatable/equatable.dart';

class RevelationDetail extends Equatable {
  final String arab;
  final String en;
  final String id;

  const RevelationDetail(
      {required this.arab, required this.en, required this.id});

  factory RevelationDetail.fromJson(Map<String, dynamic> json) =>
      RevelationDetail(
        arab: json['arab'],
        en: json['en'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'arab': arab,
        'en': en,
        'id': id,
      };

  @override
  List<Object?> get props => [arab, en, id];
}
