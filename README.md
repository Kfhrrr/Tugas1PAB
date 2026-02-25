# Tugas 1 Pemrograman Aplikasi Bergerak
## 1. Penjelasan Struktur Project
<img width="200" height="192" alt="image" src="https://github.com/user-attachments/assets/d50dc946-9b46-4e97-b4a1-53634a6fc4f2" />

Pada project tugas ini, terdapat bagian folder lib yang dibagi menjadi dua bagian utama, yaitu models dan pages, untuk memisahkan logika data dan tampilan agar kode lebih rapi dan mudah dikelola.

Folder models berisi file yang mengatur struktur dan pengelolaan data. product.dart digunakan untuk mendefinisikan data produk seperti nama dan harga. cart_item.dart merepresentasikan satu item dalam keranjang beserta jumlahnya. Sedangkan cart_model.dart berfungsi mengelola seluruh data keranjang, seperti menambah produk, menghapus produk, menghitung total harga, dan mengosongkan keranjang.

Folder pages berisi tampilan atau halaman aplikasi. product_list_page.dart menampilkan daftar produk, cart_page.dart menampilkan isi keranjang belanja, dan checkout_page.dart digunakan untuk proses checkout yang berisi ringkasan pesanan dan form data pengguna.

##  2. Penjelasan Singkat Isi Folder Models
### A. product.dart
<img width="572" height="319" alt="image" src="https://github.com/user-attachments/assets/e41dc3b3-afc4-4e6f-964b-d7f9bf19b678" />

File product.dart berfungsi sebagai model atau representasi data untuk setiap produk dalam aplikasi. Di dalamnya terdapat class Product yang menyimpan atribut seperti id, name, price, emoji, dan description (serta category jika sudah ditambahkan). Class ini digunakan sebagai struktur dasar data produk yang kemudian dipakai di halaman daftar produk (product_list_page.dart) dan juga saat produk dimasukkan ke dalam keranjang melalui CartModel. Dengan adanya model ini, pengelolaan data menjadi lebih terstruktur, konsisten, dan mudah digunakan kembali di berbagai bagian aplikasi.

### B. cart_item.dart
<img width="423" height="215" alt="image" src="https://github.com/user-attachments/assets/84d6a661-b66e-4aab-89a4-e7f9f978c293" />

File cart_item.dart merupakan model yang merepresentasikan item di dalam keranjang. Class CartItem menyimpan objek Product dan jumlah (quantity) dari produk tersebut. Di dalamnya juga terdapat properti totalPrice yang menghitung total harga berdasarkan price × quantity. Model ini digunakan oleh CartModel untuk mengelola data produk yang sudah ditambahkan ke cart.

### C. cart_model.dart
<img width="661" height="520" alt="image" src="https://github.com/user-attachments/assets/99d7b368-cf37-4e78-9427-b77bbeb69e18" />

File cart_model.dart berfungsi sebagai pengelola state keranjang belanja menggunakan ChangeNotifier. Class CartModel menyimpan data item dalam bentuk Map<String, CartItem> agar pencarian lebih cepat. Di dalamnya terdapat method seperti addItem(), removeItem(), increaseQuantity(), decreaseQuantity(), dan clear() untuk mengatur isi keranjang. Selain itu, terdapat getter seperti totalPrice, totalQuantity, dan itemCount untuk menghitung total harga dan jumlah item. Setiap perubahan data akan memanggil notifyListeners() agar tampilan UI otomatis diperbarui.

## 3. Penjelasan Singkat Isi Folder Pages
### A. product_list_page.dart
<img width="602" height="393" alt="image" src="https://github.com/user-attachments/assets/21321a44-36fd-429e-b25c-c809094cd09a" />

File product_list_page.dart merupakan halaman utama yang menampilkan daftar produk dalam bentuk grid. Pada halaman ini terdapat fitur search untuk mencari produk berdasarkan nama, serta filter kategori menggunakan dropdown. Produk yang ditampilkan akan difilter berdasarkan kata kunci dan kategori yang dipilih. Selain itu, terdapat tombol Add to Cart untuk menambahkan produk ke keranjang menggunakan CartModel, serta ikon keranjang dengan badge yang menampilkan jumlah item di cart.

### B. cart_page.dart
<img width="448" height="185" alt="image" src="https://github.com/user-attachments/assets/d92f4a5b-c828-4e6a-984e-83666b820791" />

File cart_page.dart merupakan halaman yang menampilkan seluruh item yang sudah ditambahkan ke keranjang. Halaman ini menggunakan Consumer<CartModel> untuk mengambil dan menampilkan data cart secara realtime. Di dalamnya terdapat daftar produk lengkap dengan nama, harga, quantity, serta tombol (+/-) untuk mengubah jumlah item dan tombol hapus untuk menghapus produk dari keranjang. Bagian bawah halaman menampilkan total harga keseluruhan dan tombol Checkout yang akan mengarahkan ke halaman checkout. Jika keranjang kosong, maka akan ditampilkan pesan “Your cart is empty” beserta tombol kembali ke halaman produk.

### C. checkout_page.dart
<img width="560" height="416" alt="image" src="https://github.com/user-attachments/assets/b207a872-a4da-4647-a633-98cb64ae63e0" />

File checkout_page.dart merupakan halaman akhir proses pembelian yang menampilkan order summary dan form data pembeli. Pada bagian atas ditampilkan daftar item yang ada di keranjang beserta jumlah dan subtotal masing-masing produk, serta total harga keseluruhan. Di bawahnya terdapat form yang harus diisi pengguna seperti nama lengkap, alamat, dan nomor HP (menggunakan Form dan TextFormField dengan validasi). Setelah form divalidasi dan tombol Place Order ditekan, data akan diproses, keranjang dikosongkan menggunakan cart.clear(), lalu menampilkan notifikasi bahwa pesanan berhasil dibuat.

## 4. Implementasi Fitur Wajib
### A. Add To Cart
<img width="454" height="226" alt="image" src="https://github.com/user-attachments/assets/266e42ae-3fe0-4756-a6ae-8602202f6af7" />

Kode addItem(Product product) berfungsi untuk menambahkan produk ke dalam keranjang belanja. Pertama, kode mengecek apakah produk dengan product.id sudah ada di dalam _items menggunakan containsKey. Jika produk sudah ada, maka jumlah (quantity) dari produk tersebut akan ditambah satu. Jika belum ada, maka produk baru akan dimasukkan ke dalam _items dengan membuat objek CartItem yang berisi produk tersebut. Setelah proses penambahan atau pembaruan selesai, method notifyListeners() dipanggil untuk memberi tahu UI bahwa terjadi perubahan data, sehingga tampilan dapat diperbarui secara otomatis.


<img width="420" height="263" alt="image" src="https://github.com/user-attachments/assets/35a0cf09-f51e-4e9a-b1af-2b94fb2f2a81" />


Potongan kode tersebut menampilkan sebuah tombol menggunakan ElevatedButton.icon yang dibungkus dengan SizedBox agar lebarnya memenuhi ruang yang tersedia (double.infinity). Tombol ini memiliki ikon keranjang belanja (Icons.add_shopping_cart) dan teks “Add” dengan ukuran font 12. Pada bagian onPressed, ketika tombol ditekan, kode akan memanggil method addItem(product) dari CartModel melalui context.read<CartModel>(). Artinya, produk yang sedang ditampilkan akan ditambahkan ke dalam keranjang, dan karena di dalam addItem() terdapat notifyListeners(), maka tampilan UI yang bergantung pada data keranjang akan otomatis diperbarui.

### B. Menampilkan Item di Cart
<img width="452" height="302" alt="image" src="https://github.com/user-attachments/assets/ec63363b-85d1-4df2-944d-ceb39cdea2ac" />


Berfungsi untuk mendengarkan perubahan data pada CartModel. Jika cart.isEmpty bernilai true, maka akan ditampilkan tampilan tengah (Center) berisi ikon keranjang dan teks “Your cart is empty”. Artinya, bagian ini menangani kondisi ketika keranjang belum memiliki item.


<img width="438" height="149" alt="image" src="https://github.com/user-attachments/assets/3eb90693-416e-45cb-8e0d-af81bd70488b" />


Digunakan untuk menampilkan daftar item yang ada di dalam keranjang. itemCount: cart.itemsList.length menentukan jumlah item yang akan ditampilkan, lalu itemBuilder akan membangun tampilan setiap item berdasarkan data dari cart.itemsList. Variabel cartItem mewakili satu item di keranjang, dan product adalah data produk dari item tersebut yang kemudian digunakan untuk menampilkan nama, harga, quantity, dan subtotal di halaman cart.


Method ini berfungsi untuk mengurangi quantity produk. Jika quantity masih lebih dari 1, maka hanya dikurangi 1. Namun jika quantity tinggal 1 dan dikurangi lagi, maka produk akan langsung dihapus dari cart (_items.remove). Setelah itu notifyListeners() dipanggil agar tampilan ikut berubah.


### C. Update Quantity
- Mengurangi
<img width="426" height="222" alt="image" src="https://github.com/user-attachments/assets/1633a71a-87dd-4f10-b608-2fa10677d14f" />

Method ini berfungsi untuk mengurangi quantity produk. Jika quantity masih lebih dari 1, maka hanya dikurangi 1. Namun jika quantity tinggal 1 dan dikurangi lagi, maka produk akan langsung dihapus dari cart (_items.remove). Setelah itu notifyListeners() dipanggil agar tampilan ikut berubah.


<img width="351" height="202" alt="image" src="https://github.com/user-attachments/assets/3e3ceb89-4578-4dad-bc74-0d44af57d374" />


Bagian ini adalah tombol ikon minus (remove_circle_outline) pada halaman cart. Saat ditekan, tombol akan memanggil method decreaseQuantity() dengan parameter product.id. Artinya, tombol ini berfungsi untuk mengurangi jumlah (quantity) produk tertentu di dalam keranjang.

- Menambahkan
<img width="412" height="128" alt="image" src="https://github.com/user-attachments/assets/3157164c-f4d6-405e-9ee8-450d54411616" />


Method ini digunakan untuk menambah jumlah produk di dalam cart. Program akan mengecek apakah produk dengan productId tersebut ada di dalam _items. Jika ada, maka nilai quantity ditambah 1. Setelah itu, notifyListeners() dipanggil agar UI otomatis diperbarui sesuai perubahan data.

<img width="340" height="178" alt="image" src="https://github.com/user-attachments/assets/b2baf110-e18d-4f54-b6eb-e6c364ae9e00" />


Tombol ini adalah ikon plus (add_circle_outline). Ketika ditekan, ia memanggil method increaseQuantity() untuk menambah jumlah produk yang dipilih. Jadi tombol ini adalah pasangan dari tombol minus sebelumnya.

### D. Remove Item
<img width="337" height="91" alt="image" src="https://github.com/user-attachments/assets/e63a950f-5d2f-478a-ad4d-2b4ed0db3797" />

Method ini langsung menghapus produk dari keranjang tanpa melihat jumlah quantity. Biasanya digunakan untuk tombol hapus permanen (delete). Setelah item dihapus, UI diperbarui melalui notifyListeners().


<img width="396" height="321" alt="image" src="https://github.com/user-attachments/assets/5f1eac32-c32f-4881-8858-b44d247c0a8a" />

Bagian ini adalah tombol hapus (delete) di UI. Saat ditekan, produk langsung dihapus dari cart dengan removeItem(). Muncul notifikasi kecil (SnackBar) di bagian bawah layar yang menampilkan pesan bahwa produk tersebut telah dihapus.

### E. Total Price
<img width="616" height="69" alt="image" src="https://github.com/user-attachments/assets/628afc40-6473-4afb-b118-b10a20c6fcf9" />


Kode ini adalah getter untuk menghitung total harga seluruh isi keranjang. _items.values mengambil semua item dalam cart, lalu fold() digunakan untuk menjumlahkannya mulai dari nilai awal 0.0. Setiap item.totalPrice biasanya merupakan hasil dari price × quantity. Jadi method ini otomatis menghitung total belanja keseluruhan setiap kali dipanggil.


<img width="370" height="164" alt="image" src="https://github.com/user-attachments/assets/1d06c3bb-293c-4439-8672-0d7c4e6f0eba" />


Bagian ini menampilkan harga produk di UI. product.price → mengambil nilai harga, toStringAsFixed(0) → menghilangkan angka desimal (misalnya 10000.0 menjadi 10000),
'Rp' → menambahkan format mata uang rupiah. Style warna hijau dan fontWeight semi-bold digunakan agar harga terlihat lebih menonjol.

## 6. Implementasi Fitur Tambahan
### A. Search/Filter by Name
<img width="397" height="238" alt="image" src="https://github.com/user-attachments/assets/a4abd83e-66f3-44d0-8d78-9ab55f5f7add" />

TextField ini digunakan untuk fitur pencarian produk, onChanged akan berjalan setiap kali pengguna mengetik. Nilai yang diketik disimpan ke variabel searchQuery, setState() dipanggil agar UI rebuild dan daftar produk difilter sesuai kata kunci dan pencarian dilakukan secara real-time saat user mengetik.

### B. Filter by Category
<img width="548" height="280" alt="image" src="https://github.com/user-attachments/assets/24710183-11da-4f9d-92e6-61f186969240" />

Dropdown ini digunakan untuk memfilter produk berdasarkan kategori, categories → daftar kategori yang tersedia, selectedCategory → kategori yang sedang dipilih. Saat user memilih kategori baru, setState() dipanggil dan UI akan menampilkan produk sesuai kategori tersebut.

### C. Checkout Page
<img width="471" height="182" alt="image" src="https://github.com/user-attachments/assets/f270e139-6730-4f61-b145-7f1f6fec37fc" />

Tombol ini digunakan untuk berpindah ke halaman checkout. Navigator.push() → berfungsi untuk berpindah ke halaman baru, MaterialPageRoute → menentukan halaman tujuan, CheckoutPage() → halaman yang akan dibuka, jadi ketika tombol ditekan akan masuk ke halaman pembayaran atau konfirmasi pesanan.

## 7. Tampilan Keseluruhan
### A. Tampilan Katalog Produk
<img width="959" height="1019" alt="image" src="https://github.com/user-attachments/assets/fa005d2f-8499-44af-be6c-696a9690dc4b" />

<img width="957" height="1016" alt="image" src="https://github.com/user-attachments/assets/8b453579-c36f-43e5-a38d-cc8b5b53a5cc" />

<img width="958" height="1015" alt="image" src="https://github.com/user-attachments/assets/65c1f8ff-efaf-4589-a274-e277ba752224" />

### B. Fitur Search by Name
<img width="955" height="1018" alt="image" src="https://github.com/user-attachments/assets/f5c95472-d887-4aa4-9e23-7718675b4b77" />

### C. Fitur Filter by Categories
<img width="955" height="1027" alt="image" src="https://github.com/user-attachments/assets/d7627331-82fc-407e-8c80-2f01db2fcb76" />

<img width="959" height="1019" alt="image" src="https://github.com/user-attachments/assets/6bc4bc39-6109-4235-ae14-e9c784f525be" />

### D. Add to Cart
<img width="957" height="1018" alt="image" src="https://github.com/user-attachments/assets/d9c49412-251b-45c5-af7c-4a88796769ac" />

### E. Go to Cart Page
<img width="956" height="969" alt="image" src="https://github.com/user-attachments/assets/be8ffcfa-69df-400d-8f81-ab3847ae30ef" />

### F. Tampilan Cart Page
<img width="957" height="1020" alt="image" src="https://github.com/user-attachments/assets/42491687-f92d-4dfe-8b22-ac6b8cb1d759" />

### G. Tambah Jumlah Produk
<img width="956" height="1015" alt="image" src="https://github.com/user-attachments/assets/707abb32-592d-46a4-b63f-f89623285d61" />

### H. Menghapus Salah Satu Produk Dari Cart Page
<img width="959" height="1016" alt="image" src="https://github.com/user-attachments/assets/a2494272-c8b9-4a54-8691-59d5649723e0" />

<img width="957" height="1014" alt="image" src="https://github.com/user-attachments/assets/d92ebfab-482b-4dbe-a56a-7a38365323b2" />

### I. Menghapus Seluruh Produk Yang Ada di Cart Page
<img width="958" height="1019" alt="image" src="https://github.com/user-attachments/assets/3b206ae9-ee67-497c-9b63-5ef472ca951f" />

<img width="955" height="1017" alt="image" src="https://github.com/user-attachments/assets/f877a0ce-c033-4c87-9264-9c266dab76c6" />

<img width="959" height="1018" alt="image" src="https://github.com/user-attachments/assets/9d3cddce-aaba-4fe7-ba60-3e0e2153edea" />

### J. Button Menuju Checkout Page
<img width="956" height="1017" alt="image" src="https://github.com/user-attachments/assets/dd353f0c-a5e1-4f8c-9d1b-db7fac8b43ea" />

### K. Tampilan Checkout Page
<img width="958" height="805" alt="image" src="https://github.com/user-attachments/assets/05e6c28c-c753-4f74-b176-f90b2a23bed7" />

<img width="956" height="692" alt="image" src="https://github.com/user-attachments/assets/58caadbe-aa9b-46d9-9851-0e2d26a658e4" />

<img width="955" height="1009" alt="image" src="https://github.com/user-attachments/assets/90b50969-8a7d-4936-b1d7-8c9a81b3792c" />

<img width="960" height="1017" alt="image" src="https://github.com/user-attachments/assets/fff43239-0912-424a-b9f1-16c19e6010d0" />

<img width="960" height="1021" alt="image" src="https://github.com/user-attachments/assets/51138c1e-01eb-4743-9186-05cf4e045cc5" />
