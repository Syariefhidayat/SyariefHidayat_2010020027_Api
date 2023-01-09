class Siswa {
  String id;
  String nis;
  String nama_lengkap;
  String alamat;
  String kelas_id;

  Siswa(
      {required this.id,
      required this.nis,
      required this.nama_lengkap,
      required this.alamat,
      required this.kelas_id});

  factory Siswa.fromJson(Map<String, dynamic> siswa) => Siswa(
      id: siswa['id'],
      nis: siswa['nis'],
      nama_lengkap: siswa['nama_lengkap'],
      alamat: siswa['alamat'],
      kelas_id: siswa['kelas_id']);
}
