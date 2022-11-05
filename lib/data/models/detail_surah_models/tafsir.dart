import 'package:equatable/equatable.dart';

class TafsirDetail extends Equatable {
  final String id;

  const TafsirDetail({required this.id});

  factory TafsirDetail.fromJson(Map<String, dynamic> json) => TafsirDetail(
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  @override
  List<Object?> get props => [id];
}
