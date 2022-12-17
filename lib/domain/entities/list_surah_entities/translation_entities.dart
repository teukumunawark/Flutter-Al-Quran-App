import 'package:equatable/equatable.dart';

class TranslationEntities extends Equatable {
  final String? en;
  final String? id;

  const TranslationEntities({
    this.en,
    this.id,
  });

  @override
  List<Object> get props => [
        en.toString(),
        id.toString(),
      ];
}
