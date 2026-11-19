import 'package:flutter/material.dart';

import '../models/karyawan.dart';

class DaftarKaryawanPage extends StatelessWidget {
  const DaftarKaryawanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Karyawan'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: dummyKaryawan.length,
        itemBuilder: (context, index) {
          final karyawan = dummyKaryawan[index];

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(karyawan.nama),
              subtitle: Text('${karyawan.nik} - ${karyawan.divisi}'),
            ),
          );
        },
      ),
    );
  }
}
