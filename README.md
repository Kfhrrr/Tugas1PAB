Tugas 1 Pemrograman Aplikasi Bergerak
Penjelasan Struktur Project
<img width="200" height="192" alt="image" src="https://github.com/user-attachments/assets/d50dc946-9b46-4e97-b4a1-53634a6fc4f2" />

Pada project tugas ini, terdapat bagian folder lib yang dibagi menjadi dua bagian utama, yaitu models dan pages, untuk memisahkan logika data dan tampilan agar kode lebih rapi dan mudah dikelola.

Folder models berisi file yang mengatur struktur dan pengelolaan data. product.dart digunakan untuk mendefinisikan data produk seperti nama dan harga. cart_item.dart merepresentasikan satu item dalam keranjang beserta jumlahnya. Sedangkan cart_model.dart berfungsi mengelola seluruh data keranjang, seperti menambah produk, menghapus produk, menghitung total harga, dan mengosongkan keranjang.

Folder pages berisi tampilan atau halaman aplikasi. product_list_page.dart menampilkan daftar produk, cart_page.dart menampilkan isi keranjang belanja, dan checkout_page.dart digunakan untuk proses checkout yang berisi ringkasan pesanan dan form data pengguna.

Penjelasan Singkat Isi Folder Models
product.dart
<img width="572" height="319" alt="image" src="https://github.com/user-attachments/assets/e41dc3b3-afc4-4e6f-964b-d7f9bf19b678" />

File product.dart berfungsi sebagai model atau representasi data untuk setiap produk dalam aplikasi. Di dalamnya terdapat class Product yang menyimpan atribut seperti id, name, price, emoji, dan description (serta category jika sudah ditambahkan). Class ini digunakan sebagai struktur dasar data produk yang kemudian dipakai di halaman daftar produk (product_list_page.dart) dan juga saat produk dimasukkan ke dalam keranjang melalui CartModel. Dengan adanya model ini, pengelolaan data menjadi lebih terstruktur, konsisten, dan mudah digunakan kembali di berbagai bagian aplikasi.

cart_item.dart
<img width="423" height="215" alt="image" src="https://github.com/user-attachments/assets/84d6a661-b66e-4aab-89a4-e7f9f978c293" />

File cart_item.dart merupakan model yang merepresentasikan item di dalam keranjang. Class CartItem menyimpan objek Product dan jumlah (quantity) dari produk tersebut. Di dalamnya juga terdapat properti totalPrice yang menghitung total harga berdasarkan price × quantity. Model ini digunakan oleh CartModel untuk mengelola data produk yang sudah ditambahkan ke cart.

cart_model.dart
<img width="661" height="520" alt="image" src="https://github.com/user-attachments/assets/99d7b368-cf37-4e78-9427-b77bbeb69e18" />

File cart_model.dart berfungsi sebagai pengelola state keranjang belanja menggunakan ChangeNotifier. Class CartModel menyimpan data item dalam bentuk Map<String, CartItem> agar pencarian lebih cepat. Di dalamnya terdapat method seperti addItem(), removeItem(), increaseQuantity(), decreaseQuantity(), dan clear() untuk mengatur isi keranjang. Selain itu, terdapat getter seperti totalPrice, totalQuantity, dan itemCount untuk menghitung total harga dan jumlah item. Setiap perubahan data akan memanggil notifyListeners() agar tampilan UI otomatis diperbarui.

Penjelasan Singkat Isi Folder Pages
product_list_page.dart
<img width="602" height="393" alt="image" src="https://github.com/user-attachments/assets/21321a44-36fd-429e-b25c-c809094cd09a" />

File product_list_page.dart merupakan halaman utama yang menampilkan daftar produk dalam bentuk grid. Pada halaman ini terdapat fitur search untuk mencari produk berdasarkan nama, serta filter kategori menggunakan dropdown. Produk yang ditampilkan akan difilter berdasarkan kata kunci dan kategori yang dipilih. Selain itu, terdapat tombol Add to Cart untuk menambahkan produk ke keranjang menggunakan CartModel, serta ikon keranjang dengan badge yang menampilkan jumlah item di cart.

cart_page.dart
<img width="448" height="185" alt="image" src="https://github.com/user-attachments/assets/d92f4a5b-c828-4e6a-984e-83666b820791" />

File cart_page.dart merupakan halaman yang menampilkan seluruh item yang sudah ditambahkan ke keranjang. Halaman ini menggunakan Consumer<CartModel> untuk mengambil dan menampilkan data cart secara realtime. Di dalamnya terdapat daftar produk lengkap dengan nama, harga, quantity, serta tombol (+/-) untuk mengubah jumlah item dan tombol hapus untuk menghapus produk dari keranjang. Bagian bawah halaman menampilkan total harga keseluruhan dan tombol Checkout yang akan mengarahkan ke halaman checkout. Jika keranjang kosong, maka akan ditampilkan pesan “Your cart is empty” beserta tombol kembali ke halaman produk.

checkout_page.dart
<img width="560" height="416" alt="image" src="https://github.com/user-attachments/assets/b207a872-a4da-4647-a633-98cb64ae63e0" />

File checkout_page.dart merupakan halaman akhir proses pembelian yang menampilkan order summary dan form data pembeli. Pada bagian atas ditampilkan daftar item yang ada di keranjang beserta jumlah dan subtotal masing-masing produk, serta total harga keseluruhan. Di bawahnya terdapat form yang harus diisi pengguna seperti nama lengkap, alamat, dan nomor HP (menggunakan Form dan TextFormField dengan validasi). Setelah form divalidasi dan tombol Place Order ditekan, data akan diproses, keranjang dikosongkan menggunakan cart.clear(), lalu menampilkan notifikasi bahwa pesanan berhasil dibuat.

Implementasi Fitur Wajib
Add To Cart
<img width="454" height="226" alt="image" src="https://github.com/user-attachments/assets/266e42ae-3fe0-4756-a6ae-8602202f6af7" />

Kode addItem(Product product) berfungsi untuk menambahkan produk ke dalam keranjang belanja. Pertama, kode mengecek apakah produk dengan product.id sudah ada di dalam _items menggunakan containsKey. Jika produk sudah ada, maka jumlah (quantity) dari produk tersebut akan ditambah satu. Jika belum ada, maka produk baru akan dimasukkan ke dalam _items dengan membuat objek CartItem yang berisi produk tersebut. Setelah proses penambahan atau pembaruan selesai, method notifyListeners() dipanggil untuk memberi tahu UI bahwa terjadi perubahan data, sehingga tampilan dapat diperbarui secara otomatis.

<img width="420" height="263" alt="image" src="https://github.com/user-attachments/assets/35a0cf09-f51e-4e9a-b1af-2b94fb2f2a81" />

Potongan kode tersebut menampilkan sebuah tombol menggunakan ElevatedButton.icon yang dibungkus dengan SizedBox agar lebarnya memenuhi ruang yang tersedia (double.infinity). Tombol ini memiliki ikon keranjang belanja (Icons.add_shopping_cart) dan teks “Add” dengan ukuran font 12. Pada bagian onPressed, ketika tombol ditekan, kode akan memanggil method addItem(product) dari CartModel melalui context.read<CartModel>(). Artinya, produk yang sedang ditampilkan akan ditambahkan ke dalam keranjang, dan karena di dalam addItem() terdapat notifyListeners(), maka tampilan UI yang bergantung pada data keranjang akan otomatis diperbarui.

Menampilkan Item di Cart
<img width="452" height="302" alt="image" src="https://github.com/user-attachments/assets/ec63363b-85d1-4df2-944d-ceb39cdea2ac" />

Berfungsi untuk mendengarkan perubahan data pada CartModel. Jika cart.isEmpty bernilai true, maka akan ditampilkan tampilan tengah (Center) berisi ikon keranjang dan teks “Your cart is empty”. Artinya, bagian ini menangani kondisi ketika keranjang belum memiliki item.

<img width="438" height="149" alt="image" src="https://github.com/user-attachments/assets/3eb90693-416e-45cb-8e0d-af81bd70488b" />

Digunakan untuk menampilkan daftar item yang ada di dalam keranjang. itemCount: cart.itemsList.length menentukan jumlah item yang akan ditampilkan, lalu itemBuilder akan membangun tampilan setiap item berdasarkan data dari cart.itemsList. Variabel cartItem mewakili satu item di keranjang, dan product adalah data produk dari item tersebut yang kemudian digunakan untuk menampilkan nama, harga, quantity, dan subtotal di halaman cart.

Method ini berfungsi untuk mengurangi quantity produk. Jika quantity masih lebih dari 1, maka hanya dikurangi 1. Namun jika quantity tinggal 1 dan dikurangi lagi, maka produk akan langsung dihapus dari cart (_items.remove). Setelah itu notifyListeners() dipanggil agar tampilan ikut berubah.

Update Quantity
<img width="351" height="202" alt="image" src="https://github.com/user-attachments/assets/3e3ceb89-4578-4dad-bc74-0d44af57d374" />

Bagian ini adalah tombol ikon minus (remove_circle_outline) pada halaman cart. Saat ditekan, tombol akan memanggil method decreaseQuantity() dengan parameter product.id. Artinya, tombol ini berfungsi untuk mengurangi jumlah (quantity) produk tertentu di dalam keranjang.

<img width="340" height="178" alt="image" src="https://github.com/user-attachments/assets/b2baf110-e18d-4f54-b6eb-e6c364ae9e00" />

Tombol ini adalah ikon plus (add_circle_outline). Ketika ditekan, ia memanggil method increaseQuantity() untuk menambah jumlah produk yang dipilih. Jadi tombol ini adalah pasangan dari tombol minus sebelumnya.

Method ini digunakan untuk menambah jumlah produk di dalam cart. Program akan mengecek apakah produk dengan productId tersebut ada di dalam _items. Jika ada, maka nilai quantity ditambah 1. Setelah itu, notifyListeners() dipanggil agar UI otomatis diperbarui sesuai perubahan data.

Remove Item
<img width="337" height="91" alt="image" src="https://github.com/user-attachments/assets/e63a950f-5d2f-478a-ad4d-2b4ed0db3797" />

Method ini langsung menghapus produk dari keranjang tanpa melihat jumlah quantity. Biasanya digunakan untuk tombol hapus permanen (delete). Setelah item dihapus, UI diperbarui melalui notifyListeners().

<img width="396" height="321" alt="image" src="https://github.com/user-attachments/assets/5f1eac32-c32f-4881-8858-b44d247c0a8a" />

Bagian ini adalah tombol hapus (delete) di UI. Saat ditekan:

Produk langsung dihapus dari cart dengan removeItem().

Muncul notifikasi kecil (SnackBar) di bagian bawah layar yang menampilkan pesan bahwa produk tersebut telah dihapus.

Total Price
<img width="616" height="69" alt="image" src="https://github.com/user-attachments/assets/628afc40-6473-4afb-b118-b10a20c6fcf9" />

Kode ini adalah getter untuk menghitung total harga seluruh isi keranjang. _items.values mengambil semua item dalam cart, lalu fold() digunakan untuk menjumlahkannya mulai dari nilai awal 0.0.

Setiap item.totalPrice biasanya merupakan hasil dari price × quantity. Jadi method ini otomatis menghitung total belanja keseluruhan setiap kali dipanggil.

<img width="370" height="164" alt="image" src="https://github.com/user-attachments/assets/1d06c3bb-293c-4439-8672-0d7c4e6f0eba" />

Bagian ini menampilkan harga produk di UI.

product.price → mengambil nilai harga

toStringAsFixed(0) → menghilangkan angka desimal (misalnya 10000.0 menjadi 10000)

'Rp' → menambahkan format mata uang rupiah

Style warna hijau dan fontWeight semi-bold digunakan agar harga terlihat lebih menonjol.

Implementasi Fitur Tambahan
Search/Filter by Name
<img width="397" height="238" alt="image" src="https://github.com/user-attachments/assets/a4abd83e-66f3-44d0-8d78-9ab55f5f7add" />

TextField ini digunakan untuk fitur pencarian produk.

onChanged akan berjalan setiap kali pengguna mengetik.

Nilai yang diketik disimpan ke variabel searchQuery.

setState() dipanggil agar UI rebuild dan daftar produk difilter sesuai kata kunci.

Artinya, pencarian dilakukan secara real-time saat user mengetik.

Filter by Category
<img width="548" height="280" alt="image" src="https://github.com/user-attachments/assets/24710183-11da-4f9d-92e6-61f186969240" />

Dropdown ini digunakan untuk memfilter produk berdasarkan kategori.

categories → daftar kategori yang tersedia

selectedCategory → kategori yang sedang dipilih

Saat user memilih kategori baru, setState() dipanggil

UI akan menampilkan produk sesuai kategori tersebut. Jadi ini adalah fitur filter berbasis kategori.

Checkout Page
<img width="471" height="182" alt="image" src="https://github.com/user-attachments/assets/f270e139-6730-4f61-b145-7f1f6fec37fc" />

Tombol ini digunakan untuk berpindah ke halaman checkout.

Navigator.push() → berpindah ke halaman baru

MaterialPageRoute → menentukan halaman tujuan

CheckoutPage() → halaman yang akan dibuka

Jadi ketika tombol ditekan, aplikasi akan masuk ke halaman pembayaran/konfirmasi pesanan.

Tampilan Keseluruhan
