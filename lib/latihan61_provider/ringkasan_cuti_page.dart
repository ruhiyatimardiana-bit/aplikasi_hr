import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/karyawan.dart';
import 'cuti_notifier.dart';

class RingkasanCutiPage extends StatelessWidget {
  const RingkasanCutiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pengajuan = context.watch<CutiNotifier>().pengajuan;

    final karyawanCuti = dummyKaryawan
        .where((k) => pengajuan.contains(k.nik))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Ringkasan Cuti')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Total Pengajuan: ${pengajuan.length}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: karyawanCuti.isEmpty
                ? const Center(child: Text('Belum ada pengajuan cuti'))
                : ListView.builder(
                    itemCount: karyawanCuti.length,
                    itemBuilder: (context, index) {
                      final karyawan = karyawanCuti[index];

                      return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(karyawan.nama),
                        subtitle: Text(karyawan.nik),
                        trailing: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
