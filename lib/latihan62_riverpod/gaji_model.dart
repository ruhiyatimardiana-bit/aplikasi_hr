class Gaji {
  final String nik;
  final String nama;
  final String divisi;
  final int gajiPokok;
  final int tunjangan;

  Gaji({
    required this.nik,
    required this.nama,
    required this.divisi,
    required this.gajiPokok,
    required this.tunjangan,
  });

  int get totalGaji => gajiPokok + tunjangan;
}
