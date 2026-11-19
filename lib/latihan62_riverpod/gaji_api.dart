import 'dart:async';

import 'gaji_model.dart';

class GajiApi {
  Future<List<Gaji>> fetchGaji() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      Gaji(
        nik: 'ENG-001',
        nama: 'Budi Santoso',
        divisi: 'Engineering',
        gajiPokok: 5000000,
        tunjangan: 1000000,
      ),
      Gaji(
        nik: 'SAL-002',
        nama: 'Citra Dewi',
        divisi: 'Sales',
        gajiPokok: 4500000,
        tunjangan: 750000,
      ),
      Gaji(
        nik: 'HR-003',
        nama: 'Dewi Kusuma',
        divisi: 'HR',
        gajiPokok: 4800000,
        tunjangan: 800000,
      ),
      Gaji(
        nik: 'ENG-004',
        nama: 'Eko Prasetyo',
        divisi: 'Engineering',
        gajiPokok: 6000000,
        tunjangan: 1200000,
      ),
      Gaji(
        nik: 'FIN-005',
        nama: 'Fitri Handayani',
        divisi: 'Finance',
        gajiPokok: 5200000,
        tunjangan: 900000,
      ),
    ];
  }
}
