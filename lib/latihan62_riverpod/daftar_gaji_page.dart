import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'gaji_provider.dart';

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
                  child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(gajiDiprosesProvider.notifier)
                          .prosesSemua(daftarGaji);
                    },
                    child: const Text('Proses Semua Gaji'),
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
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.person)),
                        title: Text(gaji.nama),
                        subtitle: Text(
                          'NIK: ${gaji.nik}\n'
                          'Divisi: ${gaji.divisi}\n'
                          'Total Gaji: Rp ${gaji.totalGaji}',
                        ),
                        isThreeLine: true,
                        trailing: IconButton(
                          icon: Icon(
                            sudahDiproses ? Icons.check_circle : Icons.payments,
                            color: sudahDiproses ? Colors.green : Colors.blue,
                          ),
                          onPressed: sudahDiproses
                              ? null
                              : () {
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
