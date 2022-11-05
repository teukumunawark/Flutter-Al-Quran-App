import 'package:equatable/equatable.dart';

class IdDetail extends Equatable {
  final String short;
  final String long;

  const IdDetail({required this.short, required this.long});

  factory IdDetail.fromJson(Map<String, dynamic> json) => IdDetail(
        short: json['short'],
        long: json['long'],
      );

  Map<String, dynamic> toJson() => {
        'short': short,
        'long': long,
      };

  @override
  List<Object?> get props => [short, long];
}
