import 'package:flutter/material.dart';
import 'package:yukita/screens/shop_form.dart';
import 'package:yukita/screens/list_shopentry.dart';
import 'package:yukita/screens/menu.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF4E342E),
              ),
              child: Column(children: [
                Text(
                  'YuKita',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Simpan kegiatan belanjamu di sini!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ))
              ])),
          ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Halaman Utama"),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              }),
          ListTile(
              leading: const Icon(Icons.format_list_bulleted_add),
              title: const Text("Tambah Item"),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShopFormPage(),
                    ));
              }),
          ListTile(
              leading: const Icon(Icons.add_reaction_rounded),
              title: const Text('Daftar Item'),
              onTap: () {
                  // Route menu ke halaman item
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ShopEntryPage()),
                  );
              },
          ),
        ],
      ),
    );
  }
}