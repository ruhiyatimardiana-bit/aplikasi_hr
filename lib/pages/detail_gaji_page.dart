import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../latihan62_riverpod/gaji_provider.dart';

class DetailGajiPage extends ConsumerWidget {
  final String nik;

  const DetailGajiPage({super.key, required this.nik});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailGaji = ref.watch(detailGajiProvider(nik));

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Gaji Karyawan')),
      body: detailGaji.when(
        data: (gaji) {
          if (gaji == null) {
            return const Center(child: Text('Data gaji tidak ditemukan'));
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama: ${gaji.nama}'),
                Text('NIK: ${gaji.nik}'),
                Text('Divisi: ${gaji.divisi}'),
                Text('Gaji Pokok: Rp ${gaji.gajiPokok}'),
                Text('Tunjangan: Rp ${gaji.tunjangan}'),
                Text('Total Gaji: Rp ${gaji.totalGaji}'),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
