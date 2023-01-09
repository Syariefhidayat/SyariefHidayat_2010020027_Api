import 'package:flutter/material.dart';
import '../api/api_service.dart';

class SiswaCreate extends StatefulWidget {
  static const routeName = '/siswa_create';
  const SiswaCreate({Key? key}) : super(key: key);

  @override
  State<SiswaCreate> createState() => _SiswaCreateState();
}

class _SiswaCreateState extends State<SiswaCreate> {
  String _id = '';
  String _nis = '';
  String _nama_lengkap = '';
  String _alamat = '';
  String _kelas_id = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Membaca API Ofline'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Tuliskan nama siswa baru',
                  labelText: 'Input Siswa',
                ),
                onChanged: (String value) {
                  setState(() {
                    _nama_lengkap = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  ApiService apiService = ApiService();
                  apiService.createSiswa(
                      _id, _nis, _nama_lengkap, _alamat, _kelas_id);
                },
              )
            ],
          ),
        ));
  }
}
