import 'package:flutter/material.dart';

import 'latihan61_provider/daftar_karyawan_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _buka(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aplikasi HR — BAB 6')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.beach_access),
            title: const Text('Latihan 6.1 — Cuti (Provider)'),
            onTap: () => _buka(context, const DaftarKaryawanPage()),
          ),
        ],
      ),
    );
  }
}
