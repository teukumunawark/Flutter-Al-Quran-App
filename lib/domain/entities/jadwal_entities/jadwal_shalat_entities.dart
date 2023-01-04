import 'package:equatable/equatable.dart';

class JadwalEntities extends Equatable {
  final String? tanggal;
  final String? imsak;
  final String? subuh;
  final String? terbit;
  final String? dhuha;
  final String? dzuhur;
  final String? ashar;
  final String? maghrib;
  final String? isya;
  final String? date;

  const JadwalEntities({
    this.tanggal,
    this.imsak,
    this.subuh,
    this.terbit,
    this.dhuha,
    this.dzuhur,
    this.ashar,
    this.maghrib,
    this.isya,
    this.date,
  });

  @override
  List<Object?> get props => [
        tanggal,
        imsak,
        subuh,
        terbit,
        dhuha,
        dzuhur,
        ashar,
        maghrib,
        isya,
        date,
      ];
}
