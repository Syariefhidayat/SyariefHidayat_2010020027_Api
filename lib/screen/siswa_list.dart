import 'package:flutter/material.dart';
import '../api/api_service.dart';
import '../model/siswa.dart';
import '../model/siswaread.dart';
import '../screen/siswa_create.dart';

class SiswaList extends StatefulWidget {
  static const routeName = '/siswa_list';

  const SiswaList({Key? key}) : super(key: key);

  @override
  State<SiswaList> createState() => _SiswaListState();
}

class _SiswaListState extends State<SiswaList> {
  late Future<SiswaRead> _future;

  @override
  void initState() {
    super.initState();
    ApiService apiService = ApiService();
    _future = apiService.getSiswa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membaca API Ofline'),
      ),
      body: Center(
        child: FutureBuilder<SiswaRead>(
          future: _future,
          builder: (context, snapshot) {
            var state = snapshot.connectionState;
            if (state != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                final List<Siswa> Siswas = snapshot.data!.Siswas;
                return ListView.builder(
                    itemCount: Siswas.length,
                    itemBuilder: (context, index) {
                      return _buildSiswaCard(context, Siswas[index]);
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else {
                return const Text('');
              }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, SiswaCreate.routeName);
        },
      ),
    );
  }

  Widget _buildSiswaCard(BuildContext context, Siswa siswa) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(
        siswa.nama_lengkap,
      ),
    );
  }
}
