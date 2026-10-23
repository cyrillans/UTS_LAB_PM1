# Quizzy — Aplikasi Kuis Pilihan Ganda

Quizzy adalah aplikasi kuis pilihan ganda berbasis Flutter yang memungkinkan pengguna masuk menggunakan nama, menjawab 10 pertanyaan, melihat skor akhir, serta melihat pembahasan jawaban. Aplikasi menggunakan tema ungu pastel dengan pilihan mode terang dan gelap.

## Identitas Mahasiswa

- **Nama:** Cyrilla Nathania Silalahi
- **NIM:** 241401067
- **Lab:** Lab PM 1

> Pastikan identitas di atas sudah benar dan lengkapi bagian yang masih bertanda kurung sebelum mengumpulkan tugas.

## Informasi Aplikasi

- **Nama aplikasi:** Quizzy
- **Platform:** Flutter
- **Bahasa pemrograman:** Dart
- **State management:** Provider
- **Penyimpanan soal:** Data lokal (tanpa database)

## Fitur Aplikasi

1. **Splash screen** sebagai halaman pembuka aplikasi.
2. **Login dan pendaftaran** untuk memasuki aplikasi.
3. **Beranda** yang menampilkan sapaan berdasarkan nama pengguna dan akses ke fitur aplikasi.
4. **Kuis pilihan ganda** yang terdiri dari 10 soal dengan empat pilihan jawaban.
5. **Indikator progres** untuk menunjukkan posisi pengguna dalam kuis.
6. **Penanda jawaban** untuk membedakan jawaban benar dan salah.
7. **Halaman hasil** yang menampilkan skor akhir, jumlah jawaban benar/salah, dan pembahasan.
8. **Profil pengguna** dan fitur pengeditan profil.
9. **Leaderboard** untuk menampilkan daftar peringkat.
10. **Mode terang dan gelap** yang dapat diatur melalui pengelolaan tema.
11. **Widget reusable** untuk komponen tombol jawaban, tombol utama, dan navigasi bawah.

## Teknologi dan Implementasi

- **Flutter dan Dart** untuk membangun antarmuka aplikasi.
- **Provider** (`ChangeNotifierProvider`) untuk mengelola state kuis, tema, dan sesi pengguna.
- **Navigator dengan named routes** untuk navigasi antarhalaman.
- **StatelessWidget dan StatefulWidget** sesuai kebutuhan tiap halaman.
- **Font kustom QuizSans**, menggunakan berkas DejaVu Sans yang disertakan dalam aset aplikasi.
- **Aset gambar lokal** untuk logo dan ilustrasi respons jawaban.
- **Layout adaptif** menggunakan widget seperti `MediaQuery`, `ListView`, dan `SingleChildScrollView` pada bagian antarmuka yang memerlukannya.

## Struktur Proyek

```text
quiz_app/
├── assets/
│   ├── fonts/
│   │   ├── DejaVuSans.ttf
│   │   └── DejaVuSans-Bold.ttf
│   └── images/
│       ├── logo_quizzy.png
│       ├── react_benar.png
│       └── react_salah.png
├── lib/
│   ├── data/
│   │   └── quiz_data.dart
│   ├── models/
│   │   └── question.dart
│   ├── providers/
│   │   ├── quiz_provider.dart
│   │   ├── theme_provider.dart
│   │   └── user_session.dart
│   ├── routes/
│   │   └── routes_app.dart
│   ├── screens/
│   │   ├── edit_profile_screen.dart
│   │   ├── home_screen.dart
│   │   ├── leaderboard_screen.dart
│   │   ├── login_screen.dart
│   │   ├── profile_screen.dart
│   │   ├── quiz_screen.dart
│   │   ├── result_screen.dart
│   │   ├── signup_screen.dart
│   │   └── splash_screen.dart
│   ├── widgets/
│   │   ├── answer_button.dart
│   │   ├── bottom_nav.dart
│   │   └── primary_button.dart
│   └── main.dart
├── test/
├── pubspec.yaml
└── README.md
```

## Cara Menjalankan Aplikasi

Pastikan Flutter SDK sudah terpasang dan perangkat atau emulator telah tersedia.

1. Buka folder proyek `quiz_app` di Visual Studio Code.
2. Buka terminal pada folder proyek.
3. Jalankan perintah berikut untuk mengunduh dependensi:

   ```bash
   flutter pub get
   ```

4. Jalankan pemeriksaan kode:

   ```bash
   flutter analyze
   ```

5. Jalankan aplikasi:

   ```bash
   flutter run
   ```

## Dokumentasi Aplikasi

### Screenshot Setiap Halaman

Tambahkan screenshot aktual dari aplikasi yang sudah dijalankan. Simpan gambar di folder `screenshots/`, lalu perbarui nama berkas pada tabel berikut.

Halaman (Screenshot)
> Splash screen <img width="381" height="415" alt="Screenshot 2026-10-23 202528" src="https://github.com/user-attachments/assets/75eedf91-4c14-4a46-8f80-d5017778caca" />
> Login  <img width="347" height="433" alt="Screenshot 2026-10-23 185312" src="https://github.com/user-attachments/assets/8215d4d1-e3a1-44a9-a802-ac2fd698320c" />
> Signup <img width="361" height="434" alt="Screenshot 2026-10-23 185323" src="https://github.com/user-attachments/assets/613da612-ee29-4a0e-bb35-2902bf886246" />
> Beranda <img width="379" height="434" alt="Screenshot 2026-10-23 185203" src="https://github.com/user-attachments/assets/a045cbd3-fdc7-4f26-95fa-dd41f12efcde" />
> Kuis <img width="372" height="440" alt="Screenshot 2026-10-23 185213" src="https://github.com/user-attachments/assets/626458ab-0350-4629-a6e3-4129174a04de" />
> Hasil dan pembahasan <img width="374" height="437" alt="Screenshot 2026-10-23 204223" src="https://github.com/user-attachments/assets/4646ebf3-377f-4e83-b0bd-5ec09ed4bb8b" />
> Leaderboard <img width="371" height="431" alt="Screenshot 2026-10-23 185232" src="https://github.com/user-attachments/assets/082790ff-feac-4fa6-a585-2c99fb0222d8" />
> Profil <img width="364" height="438" alt="Screenshot 2026-10-23 185245" src="https://github.com/user-attachments/assets/aa121b76-1afb-4b8b-8e1a-2d3d0bce945b" />
> Edit profil <img width="383" height="368" alt="Screenshot 2026-10-23 204237" src="https://github.com/user-attachments/assets/b5c5c0b1-6ae6-4969-9380-38f5eb118e2c" />
> Mode gelap <img width="371" height="444" alt="Screenshot 2026-10-23 185252" src="https://github.com/user-attachments/assets/ddcacf3a-356c-4a66-a610-b7afd1babcb0" />


### Video Presentasi

- **Link video Google Drive:**(https://drive.google.com/drive/folders/1N0lHVPcUm3Thra2rAfAhCjpY_7xTgKjl)


## Kredit Aset

- **Font DejaVu Sans**
- **Gambar lokal:** logo Quizzy dan ilustrasi respons jawaban berada di folder `assets/images/`.
- **Ikon:** ikon antarmuka menggunakan ikon Material dari Flutter.
- **Gambar soal dari jaringan:** beberapa ilustrasi soal menggunakan URL Unsplash yang didefinisikan pada `lib/data/quiz_data.dart`. 

## Catatan

- Soal kuis disimpan secara lokal di `lib/data/quiz_data.dart` dan dapat diubah sesuai kebutuhan.
- Aplikasi ini tidak menggunakan database, sesuai ketentuan soal UTS.
