import 'package:flutter/material.dart';
import 'package:yukita/widgets/item_card.dart';
import 'package:yukita/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({super.key});

    final String npm = '23061657704'; // NPM
    final String name = 'Gnade Yuka'; // Nama
    final String className = 'PBP B'; // Kelas

    final List<ItemHomepage> items = [
      ItemHomepage("Lihat Daftar Produk", Icons.shopping_bag, Colors.brown[700]!), // Dark brown
      ItemHomepage("Tambah Produk", Icons.add, Colors.brown[500]!),                 // Medium brown
      ItemHomepage("Logout", Icons.logout, Colors.brown[300]!),                     // Light cream
    ];

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    return Scaffold(
      // AppBar adalah bagian atas halaman yang menampilkan judul.
      appBar: AppBar(
        // Judul aplikasi "Mental Health Tracker" dengan teks putih dan tebal.
        title: const Text(
          'YuKita',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Mengganti warna icon drawer menjadi putih
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // Body halaman dengan padding di sekelilingnya.
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  "YuKita",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                // padding
                padding: const EdgeInsets.all(20),
                // gap
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                // count
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ItemHomepage item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}