import 'package:equatable/equatable.dart';

class Translation extends Equatable {
  final String? en;
  final String? id;

  const Translation({this.en, this.id});

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        en: json['en'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'en': en,
        'id': id,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [en, id];
}
