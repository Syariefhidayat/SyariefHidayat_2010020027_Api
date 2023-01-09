import '../model/siswa.dart';

class SiswaRead {
  SiswaRead({required this.success, required this.Siswas});

  bool success;
  List<Siswa> Siswas;

  factory SiswaRead.fromJson(Map<String, dynamic> json) => SiswaRead(
      success: json['success'],
      Siswas: List<Siswa>.from(json['data'].map((x) => Siswa.fromJson(x))));
}
