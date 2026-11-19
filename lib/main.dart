import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as provider;

// Provider - Latihan 6.1
import 'latihan61_provider/cuti_notifier.dart';
import 'latihan61_provider/daftar_karyawan_page.dart';

// Riverpod - Latihan 6.2
import 'latihan62_riverpod/daftar_gaji_page.dart';

// Cubit - Latihan 6.3
import 'latihan63_cubit/login_page.dart';

void main() {
  runApp(
    provider.ChangeNotifierProvider(
      create: (context) => CutiNotifier(),
      child: const ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi HR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi HR - BAB 6'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.beach_access, color: Colors.blue),
              title: const Text('Latihan 6.1 - Cuti (Provider)'),
              subtitle: const Text('Pengajuan cuti karyawan'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DaftarKaryawanPage(),
                  ),
                );
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.payments, color: Colors.green),
              title: const Text('Latihan 6.2 - Penggajian (Riverpod)'),
              subtitle: const Text('Daftar dan data gaji karyawan'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DaftarGajiPage(),
                  ),
                );
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.lock, color: Colors.orange),
              title: const Text('Latihan 6.3 - Login (Cubit)'),
              subtitle: const Text('Halaman login aplikasi HR'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
