class Karyawan {
  final String nik;
  final String nama;
  final String divisi;
  final double gajiPokok;

  const Karyawan({
    required this.nik,
    required this.nama,
    required this.divisi,
    required this.gajiPokok,
  });
}

const List<Karyawan> dummyKaryawan = [
  Karyawan(
    nik: 'ENG-001',
    nama: 'Budi Santoso',
    divisi: 'Engineering',
    gajiPokok: 9500000,
  ),
  Karyawan(
    nik: 'SAL-002',
    nama: 'Citra Dewi',
    divisi: 'Sales',
    gajiPokok: 7500000,
  ),
  Karyawan(
    nik: 'HR-003',
    nama: 'Dewi Kusuma',
    divisi: 'HR',
    gajiPokok: 6800000,
  ),
  Karyawan(
    nik: 'ENG-004',
    nama: 'Eko Prasetyo',
    divisi: 'Engineering',
    gajiPokok: 8700000,
  ),
  Karyawan(
    nik: 'FIN-005',
    nama: 'Fitri Handayani',
    divisi: 'Finance',
    gajiPokok: 7900000,
  ),
  Karyawan(
    nik: 'SAL-006',
    nama: 'Gilang Ramadhan',
    divisi: 'Sales',
    gajiPokok: 7200000,
  ),
  Karyawan(
    nik: 'HR-007',
    nama: 'Hana Pertiwi',
    divisi: 'HR',
    gajiPokok: 6500000,
  ),
  Karyawan(
    nik: 'FIN-008',
    nama: 'Indra Wijaya',
    divisi: 'Finance',
    gajiPokok: 8100000,
  ),
  Karyawan(
    nik: 'ENG-009',
    nama: 'Joko Susilo',
    divisi: 'Engineering',
    gajiPokok: 10200000,
  ),
  Karyawan(
    nik: 'SAL-010',
    nama: 'Kartika Sari',
    divisi: 'Sales',
    gajiPokok: 7000000,
  ),
];

Karyawan? cariKaryawan(String nik) {
  for (final k in dummyKaryawan) {
    if (k.nik == nik) return k;
  }
  return null;
}

String formatRupiah(double value) {
  final s = value.toStringAsFixed(0);
  final buffer = StringBuffer();

  for (int i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) {
      buffer.write('.');
    }
    buffer.write(s[i]);
  }

  return 'Rp $buffer';
}
