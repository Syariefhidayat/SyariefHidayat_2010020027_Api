import 'package:flutter/material.dart';
import '../screen/siswa_create.dart';
import '../screen/siswa_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      initialRoute: SiswaList.routeName,
      routes: {
        SiswaList.routeName: (context) => const SiswaList(),
        SiswaCreate.routeName: (context) => const SiswaCreate(),
      },
    );
  }
}
