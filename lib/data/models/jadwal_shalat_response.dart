import 'package:al_quran_app/data/models/jadwal_sholat_model/jadwal_sholat_model.dart';
import 'package:equatable/equatable.dart';

class JadwalResponse extends Equatable {
  final List<JadwalModel> jadwal;

  const JadwalResponse({required this.jadwal});

  factory JadwalResponse.fromJson(Map<String, dynamic> json) => JadwalResponse(
        jadwal: List<JadwalModel>.from((json['jadwal'] ?? [])
            .map((e) => JadwalModel.fromJson(e))
            .where((element) => element.date != null)),
      );

  Map<String, dynamic> toJson() => {
        "jadwal": List<dynamic>.from(jadwal.map((e) => e.toJson())),
      };

  @override
  List<Object?> get props => [jadwal];
}
