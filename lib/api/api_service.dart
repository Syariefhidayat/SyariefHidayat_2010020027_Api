import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/siswaread.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1/SyariefH2010020027/api/';

  Future<SiswaRead> getSiswa() async {
    final response = await http.get(Uri.parse("${baseUrl}siswa/read.php"));
    if (response.statusCode == 200) {
      return SiswaRead.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<http.Response> createSiswa(String id, String nis, String nama_lengkap,
      String alamat, String kelas_id) async {
    final response = await http.post(
      Uri.parse("${baseUrl}siswa/create.php"),
      body: jsonEncode(<String, String>{
        'nama_lengkap': nama_lengkap,
      }),
    );
    return response;
  }
}
