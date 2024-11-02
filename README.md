# YuKita

**Tugas Pemrograman Berbasis Platform - PBP B**

> **YuKita** merupakan proyek sederhana berbentuk e-commerce berbasis mobile untuk memenuhi Tugas Individu mata kuliah PBP Gasal 2024/2025

## **Penjelasan Tugas**

<details>
<summary> <b> Tugas 7: Elemen Dasar Flutter </b> </summary>

## **Implementasi Checklist**

* ### Membuat Program Flutter Baru

Siapkan sebuah direktori baru dan menjalankan perintah berikut pada terminal untuk membuat sebuah proyek Flutter baru.
```
flutter create yukita
cd yukita
```
Pada menu.dart kita tambahkan 
```
import 'package:flutter/material.dart';
```

Pindahkan `class MyHomePage ...` dari main.dart ke menu.dart dan menghapus  `class _MyHomePage State ...` di main.dart.
Terakhir, tambahkan kode berikut pada main.dart.
```
`import 'package:yukita/menu.dart';`
```
* ### Membuat Tombol Sederhana
Pada `menu.dart` tambahkan 
```
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
      ),
      // Body halaman dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),

            // Memberikan jarak vertikal 16 unit.
            const SizedBox(height: 16.0),

            // Menempatkan widget berikutnya di tengah halaman.
            Center(
              child: Column(
                // Menyusun teks dan grid item secara vertikal.

                children: [
                  // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to YuKita',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // Agar grid menyesuaikan tinggi kontennya.
                    shrinkWrap: true,

                    // Menampilkan ItemCard untuk setiap item dalam list items.
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  // Kartu informasi yang menampilkan title dan content.

  final String title;  // Judul kartu.
  final String content;  // Isi kartu.

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Membuat kotak kartu dengan bayangan dibawahnya.
      elevation: 2.0,
      child: Container(
        // Mengatur ukuran dan jarak di dalam kartu.
        width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
        padding: const EdgeInsets.all(16.0),
        // Menyusun title dan content secara vertikal.
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

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
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),
      
      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },
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
```
Dengan begitu, selesai sudah pembuatan proyek Flutter baru. Jangan lupa untul menjalankan proyek menggunakan Google Chrome dengan perintah berikut ini
```
flutter run
```

## **Jawaban Tugas 7**

* ### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

Stateless widget adalah widget yang tidak memiliki state atau kondisi yang berubah setelah widget tersebut dibuat. Artinya, tampilannya statis dan tidak berubah-ubah berdasarkan interaksi pengguna atau variabel lain. Contoh widget yang sering digunakan sebagai stateless adalah Text atau Icon. Sebaliknya, stateful widget adalah widget yang memiliki state yang dapat berubah-ubah selama aplikasi berjalan. Karena itu, stateful widget dapat merespons perubahan data atau input pengguna dan memperbarui tampilan sesuai perubahan tersebut. Widget seperti Checkbox, Slider, dan TextField biasanya dibuat sebagai stateful karena mereka membutuhkan interaksi langsung dari pengguna.

* ### Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

Pada proyek ini, beberapa widget yang digunakan meliputi Scaffold, yang menyediakan struktur dasar halaman dengan AppBar dan body; AppBar untuk menampilkan judul aplikasi di bagian atas; Padding untuk memberi jarak pada widget agar tampil lebih rapi; Column dan Row yang digunakan untuk menyusun elemen secara vertikal dan horizontal; Text untuk menampilkan teks informasi; GridView untuk menampilkan item dalam tata letak grid 3 kolom; Card sebagai kotak dengan efek bayangan yang menyimpan informasi dasar seperti NPM, nama, dan kelas; Material untuk memberi latar belakang pada tombol dengan warna yang sesuai tema; InkWell untuk menambahkan efek sentuhan (ripple effect) saat tombol ditekan; SnackBar untuk menampilkan pesan singkat di bagian bawah layar ketika tombol ditekan; serta Icon untuk menampilkan ikon grafis pada setiap tombol, seperti "shopping_bag" untuk "Lihat Daftar Produk", "add" untuk "Tambah Produk", dan "logout" untuk "Logout". Widget-widget ini saling mendukung untuk membangun tampilan aplikasi yang interaktif dan mudah digunakan.

* ### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

Fungsi setState() digunakan dalam stateful widget untuk memberi tahu framework bahwa ada perubahan pada state yang memerlukan pembaruan tampilan. Ketika setState() dipanggil, widget akan membangun ulang dirinya dengan data terbaru, sehingga perubahan state akan terlihat pada layar. Variabel yang terdampak oleh setState() biasanya adalah variabel yang disimpan di dalam state dan berhubungan dengan data yang berubah-ubah seperti nilai input pengguna, pengaturan tampilan, atau kondisi aplikasi saat itu.

* ### Jelaskan perbedaan antara const dengan final.

Kata kunci const dan final di Flutter digunakan untuk mendeklarasikan variabel yang nilainya bersifat tetap. Namun, const membuat nilai variabel tersebut konstan pada waktu kompilasi (compile-time) dan berlaku secara immutabel di seluruh aplikasi. Dengan kata lain, objek const sepenuhnya tetap dan tidak dapat diubah kapan pun. Sementara itu, final menentukan variabel yang nilainya tetap setelah diinisialisasi, namun penentuan nilai tersebut bisa dilakukan pada waktu runtime (run-time). Hal ini memungkinkan variabel final dipakai untuk nilai yang tetap tetapi hanya diketahui setelah aplikasi berjalan.

</details>