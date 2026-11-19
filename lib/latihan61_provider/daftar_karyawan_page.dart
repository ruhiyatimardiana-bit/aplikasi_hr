import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/karyawan.dart';
import 'badge_cuti.dart';
import 'cuti_notifier.dart';
import 'ringkasan_cuti_page.dart';

class DaftarKaryawanPage extends StatelessWidget {
  const DaftarKaryawanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Cuti'),
        actions: [
          IconButton(
            tooltip: 'Ringkasan cuti',
            icon: const BadgeCuti(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RingkasanCutiPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dummyKaryawan.length,
        itemBuilder: (context, index) {
          return KaryawanCutiTile(karyawan: dummyKaryawan[index]);
        },
      ),
    );
  }
}

class KaryawanCutiTile extends StatelessWidget {
  final Karyawan karyawan;

  const KaryawanCutiTile({super.key, required this.karyawan});

  @override
  Widget build(BuildContext context) {
    final mengajukan = context.select<CutiNotifier, bool>(
      (notifier) => notifier.sudahMengajukan(karyawan.nik),
    );

    return ListTile(
      title: Text(karyawan.nama),
      subtitle: Text('${karyawan.nik} • ${karyawan.divisi}'),
      trailing: mengajukan
          ? OutlinedButton(
              onPressed: () {
                context.read<CutiNotifier>().batalkan(karyawan.nik);
              },
              child: const Text('Batal'),
            )
          : FilledButton(
              onPressed: () {
                context.read<CutiNotifier>().ajukan(karyawan.nik);
              },
              child: const Text('Ajukan'),
            ),
    );
  }
}
