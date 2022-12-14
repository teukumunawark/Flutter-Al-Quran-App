import 'package:equatable/equatable.dart';

class TranslationEntities extends Equatable {
  final String en;
  final String id;

  const TranslationEntities({
    required this.en,
    required this.id,
  });

  @override
  List<Object> get props => [en, id];
}
