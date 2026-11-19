import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'gaji_api.dart';
import 'gaji_model.dart';

// Provider API Gaji
final gajiApiProvider = Provider<GajiApi>((ref) {
  return GajiApi();
});

// FutureProvider untuk mengambil daftar gaji
final daftarGajiProvider = FutureProvider<List<Gaji>>((ref) async {
  final api = ref.watch(gajiApiProvider);
  return api.fetchGaji();
});

// Notifier untuk mengelola gaji yang sudah diproses
class GajiDiprosesNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    return {};
  }

  // Memproses satu karyawan berdasarkan NIK
  void proses(String nik) {
    state = {...state, nik};
  }

  // Memproses semua karyawan
  void prosesSemua(List<Gaji> daftarGaji) {
    state = {...state, ...daftarGaji.map((gaji) => gaji.nik)};
  }
}

// NotifierProvider
final gajiDiprosesProvider =
    NotifierProvider<GajiDiprosesNotifier, Set<String>>(
      GajiDiprosesNotifier.new,
    );

// FutureProvider.family untuk detail gaji berdasarkan NIK
final detailGajiProvider = FutureProvider.family<Gaji?, String>((
  ref,
  nik,
) async {
  final daftarGaji = await ref.watch(daftarGajiProvider.future);

  for (final gaji in daftarGaji) {
    if (gaji.nik == nik) {
      return gaji;
    }
  }

  return null;
});
