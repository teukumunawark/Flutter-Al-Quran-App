import 'package:equatable/equatable.dart';

class Tafsir extends Equatable {
  final String? id;

  const Tafsir({this.id});

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json['id'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id];
}
