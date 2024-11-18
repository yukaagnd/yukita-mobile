import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:yukita/screens/login.dart';
import 'package:yukita/screens/shop_form.dart';
import 'package:yukita/screens/list_shopentry.dart';

class ItemHomepage {
     final String name;
     final IconData icon;
     final Color color;

     ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item; 
  
  const ItemCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () async { 
        if (item.name == "Tambah Produk") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ShopFormPage(), // Directing to the ItemFormPage
            ),
          );
        } // Menampilkan pesan SnackBar saat kartu ditekan.
        else if (item.name == "Lihat Daftar Produk") {
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => const ShopEntryPage()
              ),
          );
      }
        else if (item.name == "Logout") {
          final response = await request.logout(
              // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
              "http://127.0.0.1:8000/auth/logout/");
          String message = response["message"];
          if (context.mounted) {
              if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$message Sampai jumpa, $uname."),
                  ));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
              } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(message),
                      ),
                  );
              }
          }
      }
        else {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
          if (item.name == "Add Item") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }
        }},
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}


