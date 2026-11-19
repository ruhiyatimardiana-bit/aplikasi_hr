import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../latihan62_riverpod/gaji_provider.dart';

class DaftarGajiPage extends ConsumerWidget {
  const DaftarGajiPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final daftarGajiAsync = ref.watch(daftarGajiProvider);
    final gajiDiproses = ref.watch(gajiDiprosesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Gaji Karyawan')),
      body: daftarGajiAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (daftarGaji) {
          if (daftarGaji.isEmpty) {
            return const Center(child: Text('Data gaji kosong'));
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ref
                          .read(gajiDiprosesProvider.notifier)
                          .prosesSemua(daftarGaji);
                    },
                    icon: const Icon(Icons.check_circle),
                    label: const Text('Proses Semua Gaji'),
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: daftarGaji.length,
                  itemBuilder: (context, index) {
                    final gaji = daftarGaji[index];
                    final sudahDiproses = gajiDiproses.contains(gaji.nik);

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.person)),
                        title: Text(
                          gaji.nama,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'NIK: ${gaji.nik}\n'
                          'Divisi: ${gaji.divisi}\n'
                          'Total Gaji: Rp ${gaji.totalGaji}',
                        ),
                        isThreeLine: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailGajiPage(nik: gaji.nik),
                            ),
                          );
                        },
                        trailing: IconButton(
                          tooltip: sudahDiproses
                              ? 'Sudah diproses'
                              : 'Proses gaji',
                          icon: Icon(
                            sudahDiproses ? Icons.check_circle : Icons.payments,
                            color: sudahDiproses ? Colors.green : Colors.blue,
                          ),
                          onPressed: () {
                            ref
                                .read(gajiDiprosesProvider.notifier)
                                .proses(gaji.nik);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// HALAMAN DETAIL GAJI
class DetailGajiPage extends ConsumerWidget {
  final String nik;

  const DetailGajiPage({super.key, required this.nik});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(detailGajiProvider(nik));
    final gajiDiproses = ref.watch(gajiDiprosesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Gaji Karyawan')),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (gaji) {
          if (gaji == null) {
            return const Center(child: Text('Data karyawan tidak ditemukan'));
          }

          final sudahDiproses = gajiDiproses.contains(gaji.nik);

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person, size: 45),
                  ),
                ),
                const SizedBox(height: 20),

                Center(
                  child: Text(
                    gaji.nama,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Divider(height: 30),

                Text('NIK: ${gaji.nik}'),
                const SizedBox(height: 12),

                Text('Divisi: ${gaji.divisi}'),
                const SizedBox(height: 12),

                Text('Gaji Pokok: Rp ${gaji.gajiPokok}'),
                const SizedBox(height: 12),

                Text('Tunjangan: Rp ${gaji.tunjangan}'),
                const Divider(height: 30),

                Text(
                  'Total Gaji: Rp ${gaji.totalGaji}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  sudahDiproses
                      ? 'Status: Sudah diproses'
                      : 'Status: Belum diproses',
                  style: TextStyle(
                    color: sudahDiproses ? Colors.green : Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: sudahDiproses
                        ? null
                        : () {
                            ref
                                .read(gajiDiprosesProvider.notifier)
                                .proses(gaji.nik);
                          },
                    icon: const Icon(Icons.check),
                    label: const Text('Proses Gaji'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
