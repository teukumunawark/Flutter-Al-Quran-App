import 'package:equatable/equatable.dart';

import '../../../domain/entities/jadwal_entities/jadwal_shalat_entities.dart';

class JadwalModel extends Equatable {
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

  const JadwalModel({
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

  factory JadwalModel.fromJson(Map<String, dynamic> json) => JadwalModel(
        tanggal: json['tanggal'] as String?,
        imsak: json['imsak'] as String?,
        subuh: json['subuh'] as String?,
        terbit: json['terbit'] as String?,
        dhuha: json['dhuha'] as String?,
        dzuhur: json['dzuhur'] as String?,
        ashar: json['ashar'] as String?,
        maghrib: json['maghrib'] as String?,
        isya: json['isya'] as String?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'tanggal': tanggal,
        'imsak': imsak,
        'subuh': subuh,
        'terbit': terbit,
        'dhuha': dhuha,
        'dzuhur': dzuhur,
        'ashar': ashar,
        'maghrib': maghrib,
        'isya': isya,
        'date': date,
      };

  JadwalEntities toEntity() => JadwalEntities(
        tanggal: tanggal,
        imsak: imsak,
        subuh: subuh,
        terbit: terbit,
        dhuha: dhuha,
        dzuhur: dzuhur,
        ashar: ashar,
        maghrib: maghrib,
        isya: isya,
        date: date,
      );

  @override
  List<Object?> get props {
    return [
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
}
