import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cuti_notifier.dart';

class BadgeCuti extends StatelessWidget {
  const BadgeCuti({super.key});

  @override
  Widget build(BuildContext context) {
    final jumlah = context.select<CutiNotifier, int>((n) => n.jumlah);

    debugPrint('BadgeCuti rebuild: $jumlah');

    return Badge(
      label: Text('$jumlah'),
      isLabelVisible: jumlah > 0,
      child: const Icon(Icons.beach_access),
    );
  }
}
