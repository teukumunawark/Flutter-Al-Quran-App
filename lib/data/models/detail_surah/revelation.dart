import 'package:equatable/equatable.dart';

class Revelation extends Equatable {
  final String? arab;
  final String? en;
  final String? id;

  const Revelation({this.arab, this.en, this.id});

  factory Revelation.fromJson(Map<String, dynamic> json) => Revelation(
        arab: json['arab'] as String?,
        en: json['en'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'arab': arab,
        'en': en,
        'id': id,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [arab, en, id];
}
