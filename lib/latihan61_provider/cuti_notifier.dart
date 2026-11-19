import 'package:flutter/foundation.dart';

class CutiNotifier extends ChangeNotifier {
  final List<String> _pengajuan = [];

  List<String> get pengajuan => List.unmodifiable(_pengajuan);

  int get jumlah => _pengajuan.length;

  bool sudahMengajukan(String nik) => _pengajuan.contains(nik);

  void ajukan(String nik) {
    if (sudahMengajukan(nik)) return;

    _pengajuan.add(nik);
    notifyListeners();
  }

  void batalkan(String nik) {
    if (_pengajuan.remove(nik)) {
      notifyListeners();
    }
  }
}
