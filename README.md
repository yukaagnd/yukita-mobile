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

<details>
<summary> <b> Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements </b> </summary>

## **Implementasi Checklist**

* ### Membuat halaman tambah formulir

Buat berkas baru pada direktori lib dengan nama items_form.dart. Lalu saya tambahkan kode berikut ke dalam berkas items_form.dart

```
import 'package:flutter/material.dart';
import 'package:yukita/widgets/left_drawer.dart';

class ItemFormPage extends StatefulWidget {
  const ItemFormPage({super.key});

  @override
  State<ItemFormPage> createState() => _ItemFormPageState();
}

class _ItemFormPageState extends State<ItemFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Add Item Form'),
        ),
        backgroundColor: Colors.brown.shade400,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Product Name",
                        labelText: "Product Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Name can't be empty!";
                        }
                        return null;
                      })),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Amount",
                        labelText: "Amount",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _amount = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Amount can't be empty!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Amount has to be an integer!";
                        }
                        return null;
                      })),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Description",
                        labelText: "Description",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _description = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Description can't be empty!";
                        }
                        return null;
                      })),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all( Colors.brown.shade400),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        title: const Text("Your item is saved"),
                                        content: SingleChildScrollView(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Item name: $_name"),
                                            Text("Amount: $_amount"),
                                            Text("Description: $_description")
                                          ],
                                        )),
                                        actions: [
                                          TextButton(
                                            child: const Text("OK"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ]);
                                  });
                              _formKey.currentState!.reset();
                            }
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

Lalu, saya mengarahkan pengguna ke halaman form ketika menekan tombol Tambah Produk pada halaman utama. Saya menambahkan kode berikut ini pada fungsi onTap() di berkas lib/widgets/item_card.dart

```
onTap: ()
        if (item.name == "Tambah Produk") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ItemFormPage(), // Directing to the ItemFormPage
            ),
          );
        }
```

* ### Membuat sebuah drawer pada aplikasi 

Buat berkas baru left_drawer.dart pada folder lib/widgets dan saya tambahkan kode dibawah ini.

```
import 'package:flutter/material.dart';
import 'package:yukita/screens/items_form.dart';
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
                      builder: (context) => const ItemFormPage(),
                    ));
              })
        ],
      ),
    );
  }
}
```

## **Jawaban Tugas 8**

* ### Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?

Const digunakan untuk menetapkan nilai yang konstan dan tidak berubah di Flutter, artinya nilai atau widget ini akan tetap sama setiap kali aplikasi dijalankan atau diperbarui. Dengan menggunakan const, kita memberi tahu Flutter bahwa widget ini bersifat statis dan tidak perlu di-render ulang setiap kali widget lainnya berubah.

Menggunakan const dapat meningkatkan performa aplikasi dengan mengurangi kerja rebuild pada widget yang tidak perlu diperbarui. Hal ini membantu dalam efisiensi penggunaan memori karena objek konstan hanya dibuat satu kali.

Gunakan const saat kita tahu nilai atau widget tersebut tidak akan berubah selama aplikasi berjalan. Misalnya, teks yang tidak bergantung pada state atau widget statis.

Jika suatu widget memiliki nilai atau properti yang bisa berubah (tergantung state), kita tidak perlu menggunakan const, karena widget tersebut akan memerlukan pembaruan atau perhitungan ulang.

* ### Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

Column : Digunakan untuk menyusun widget secara vertikal (dari atas ke bawah). Biasanya digunakan saat kita ingin menempatkan beberapa widget di atas satu sama lain.
Contoh : 
```
Column(
  children: [
    Text('Judul'),
    Text('Deskripsi'),
    ElevatedButton(onPressed: () {}, child: Text('Tombol'))
  ],
);
```
Row : Digunakan untuk menyusun widget secara horizontal (dari kiri ke kanan). Ini berguna saat kita ingin beberapa elemen berada dalam satu baris.
Contoh :
```
Row(
  children: [
    Icon(Icons.star),
    Text('Rating'),
    ElevatedButton(onPressed: () {}, child: Text('Beri Rating'))
  ],
);
```

* ### Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

Pada halaman form ini, elemen input yang digunakan meliputi TextFormField untuk memasukkan Product Name, Amount, dan Description. TextFormField adalah elemen input dasar di Flutter yang sering digunakan untuk menerima input teks dan memungkinkan validasi.

Elemen input lain yang tersedia di Flutter tetapi tidak digunakan pada tugas ini termasuk DropdownButton, Slider, Switch, Checkbox, dan Radio. Misalnya, DropdownButton berguna untuk memilih opsi dari daftar, sedangkan Switch digunakan untuk opsi biner (misalnya, on atau off).

* ### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Tema aplikasi Flutter diatur melalui ThemeData dalam properti theme di MaterialApp. Ini bisa meliputi warna utama (primaryColor), warna sekunder, font, ikon, dan lain-lain. Tema ini akan diterapkan secara konsisten ke seluruh aplikasi.

Pada kode yang saya, sudah diimplementasikan tema dengan ThemeData pada MaterialApp, yang mengatur skema warna aplikasi menggunakan warna coklat sebagai warna utama.

* ### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Flutter menyediakan Navigator untuk menangani navigasi antar halaman. Metode seperti Navigator.push digunakan untuk mendorong halaman baru ke dalam stack navigasi, sementara Navigator.pop untuk menghapus halaman terakhir. Dalam kode yang diberikan, navigasi digunakan dengan Navigator.pushReplacement untuk mengganti halaman saat ini dengan halaman baru, sehingga pengguna tidak bisa kembali ke halaman sebelumnya.

</details>

<details>
<summary> <b> Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter </b> </summary>

## **Implementasi Checklist**

* ### Mengimplementasikan Fitur Login dan Integrasi Sistem Autentikasi Django dengan Flutter
Dalam proyek ini, halaman login dibuat menggunakan Stateful Widget karena memiliki elemen yang dinamis, seperti form input untuk username dan password. Tombol pada halaman ini akan mengirimkan permintaan ke endpoint autentikasi Django (auth/login/) dengan data yang dimasukkan pengguna. Hasil autentikasi akan ditampilkan melalui snackbar, menunjukkan apakah login berhasil atau gagal. Jika berhasil, pengguna akan diarahkan ke halaman utama.

Implementasi di Django

- Saya membuat app baru bernama authentication, yang berisi fungsi-fungsi seperti login dan logout.
- Endpoint ini berbeda dari login biasa karena mengembalikan JSON response sebagai hasil proses login/logout.
- Routing ditambahkan untuk mengakses login di /auth/login dan logout di /auth/logout.
- Saya menggunakan paket django-cors-headers untuk memungkinkan komunikasi antara Flutter dan Django, menambahkan pengaturan CORS di file konfigurasi Django.

Implementasi di Flutter

- Menambahkan dependensi provider dan pbp_django_auth untuk mempermudah autentikasi.
- Pada file main.dart, saya menggunakan Provider untuk menyebarkan instance CookieRequest ke semua widget dalam aplikasi.
- Halaman utama diubah agar menampilkan halaman login saat aplikasi pertama kali dijalankan.
- Logout juga diimplementasikan melalui tombol pada menu, yang menghapus sesi pengguna dan mengarahkan kembali ke halaman login.

* ### Membuat model kustom sesuai dengan proyek aplikasi Django dan membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.

Aplikasi ini membutuhkan model kustom untuk menyimpan dan memproses data yang diambil dari Django. Model ini dibuat dengan mengonversi JSON dari endpoint Django ke dalam bentuk objek Dart.

Langkah-Langkah:

- Mengakses Data JSON: Saya memanfaatkan endpoint /json/ di Django untuk mendapatkan daftar data barang (shop item) yang sudah difilter sesuai pengguna yang login.
- Mengonversi JSON ke Objek Dart: Saya menggunakan alat online seperti Quicktype untuk membuat model Dart berdasarkan struktur JSON.
- Model ini disimpan dalam file lib/models/shop_entry.dart yang mendefinisikan properti seperti name, price, description, dll.
- Menambahkan Dependensi: Menambahkan izin akses internet di AndroidManifest.xml agar aplikasi dapat berkomunikasi dengan server.

* ### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.

Halaman ini menampilkan daftar semua barang yang dimiliki pengguna saat ini. Data diambil dari endpoint /json/ di Django yang sudah difilter berdasarkan user.

- Fungsi fetchShop mengirim permintaan GET ke endpoint /json/ menggunakan CookieRequest. Data JSON yang diterima diubah menjadi objek Dart (ShopEntry).
- Item yang ditekan menggunakan InkWell akan membuka halaman detail dengan Navigator.push
- Halaman ShopDetailPage menerima data barang sebagai parameter melalui Navigator.
- Halaman ini hanya menampilkan informasi seperti nama produk, jumlah, lokasi, harga, dan deskripsi.
- Tombol back default digunakan untuk kembali ke halaman daftar barang.

* ### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.

Endpoint /json/ di Django sudah dirancang untuk hanya mengembalikan data milik pengguna yang sedang login. Pada Flutter, hanya endpoint ini yang dipanggil, sehingga data yang ditampilkan otomatis sesuai pengguna login.

## **Jawaban Tugas 9**

* ### Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Membuat model untuk pengambilan atau pengiriman data JSON penting untuk memastikan struktur data yang konsisten dan dapat dipahami oleh aplikasi, sehingga meminimalkan kesalahan parsing atau penanganan data. Tanpa model, akan lebih sulit mengelola data karena tipe data dan struktur yang tidak jelas, berpotensi menyebabkan error saat data diakses atau digunakan. Model juga mempermudah debugging dan pengembangan karena memberikan dokumentasi eksplisit tentang bagaimana data JSON seharusnya diterjemahkan dan digunakan.

* ### Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library http berfungsi sebagai alat untuk melakukan komunikasi antara aplikasi Flutter dan server melalui protokol HTTP. Dengan library ini, aplikasi dapat mengirim permintaan HTTP (seperti GET, POST, PUT, DELETE) dan menerima respons dari server. Library ini juga menyediakan metode untuk membaca, menulis, dan memproses data yang diterima, seperti menguraikan respons JSON untuk digunakan dalam aplikasi.

* ### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest berfungsi untuk menangani permintaan HTTP dengan manajemen sesi menggunakan cookie, sehingga memungkinkan pengguna tetap masuk (logged in) atau mempertahankan sesi autentikasi tanpa perlu mengulang login. Instance CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter untuk memastikan data sesi yang konsisten diakses di seluruh bagian aplikasi, terutama saat menangani operasi yang memerlukan status autentikasi seperti akses ke data sensitif atau halaman khusus pengguna.

* ### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Pengguna memasukkan data melalui antarmuka Flutter yang dikirim ke server menggunakan HTTP POST atau PUT dalam format JSON. Server memproses data tersebut (misalnya, menyimpannya ke database) dan mengembalikan respons JSON yang relevan. Respons ini diterima oleh aplikasi Flutter melalui permintaan HTTP, diuraikan (parsing) menjadi model data, lalu ditampilkan di antarmuka pengguna melalui widget yang sesuai.

* ### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Saat pengguna menginput data akun di Flutter untuk login atau register, data tersebut dikirimkan ke server Django melalui HTTP POST. Django memvalidasi data: pada login, memastikan kredensial cocok dengan database, dan pada register, memastikan akun baru dapat dibuat. Jika valid, Django mengembalikan respons sukses, termasuk token atau cookie sesi yang dikelola oleh Flutter (dengan CookieRequest). Untuk logout, permintaan HTTP dikirim ke Django untuk menghapus sesi atau token, dan aplikasi Flutter memperbarui antarmuka untuk mengarahkan pengguna kembali ke halaman login.

</details>