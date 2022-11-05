import 'package:equatable/equatable.dart';

class AudioDetail extends Equatable {
  final String primary;
  final List<String> secondary;

  const AudioDetail({required this.primary, required this.secondary});

  factory AudioDetail.fromJson(Map<String, dynamic> json) => AudioDetail(
        primary: json['primary'],
        secondary: List<String>.from(json['secondary'].map((e) => e)),
      );

  Map<String, dynamic> toJson() => {
        'primary': primary,
        'secondary': secondary,
      };

  @override
  List<Object?> get props => [primary, secondary];
}
