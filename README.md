# QuizUp — Aplikasi Kuis Flutter

QuizUp adalah aplikasi kuis pilihan ganda dengan tampilan ungu pastel, input nama pengguna, indikator progres, penanda jawaban benar/salah, skor akhir, halaman pembahasan, serta pengaturan tema terang/gelap.

## Fitur
- Halaman awal untuk memasukkan nama peserta.
- Kuis pilihan ganda dengan 10 soal dari data lokal.
- Progres soal dan penyimpanan jawaban selama perpindahan halaman.
- Jawaban benar berwarna hijau dan jawaban salah berwarna merah.
- Halaman hasil dengan skor, jumlah benar/salah, dan pembahasan.
- Halaman pengaturan untuk mengganti tema Terang, Gelap, atau Ikuti Sistem.
- Layout responsif menggunakan `MediaQuery`, `Center`, `ConstrainedBox`, dan `SingleChildScrollView`.
- State management menggunakan Provider.
- Komponen UI reusable disimpan di folder `widgets/`.

## Struktur Folder
```text
lib/
├── main.dart
├── data/questions.dart
├── models/question.dart
├── providers/
│   ├── quiz_provider.dart
│   └── theme_provider.dart
├── screens/
│   ├── welcome_screen.dart
│   ├── quiz_screen.dart
│   ├── result_screen.dart
│   ├── review_screen.dart
│   └── profile_screen.dart
└── widgets/
    ├── answer_option.dart
    ├── question_card.dart
    └── quiz_progress.dart
```

## Cara Menjalankan
1. Ekstrak ZIP.
2. Buka folder `quiz_app` di VS Code.
3. Jalankan `flutter pub get`.
4. Jalankan `flutter run`.

## Catatan Penyesuaian Tugas
- Isi identitas mahasiswa, NIM, kelas/lab, tautan mockup, tautan video, dan screenshot aplikasi sebelum dikumpulkan.
- Ilustrasi pada poster desain hanya referensi visual; UI aplikasi dibangun dengan widget Flutter dan ikon Material.
- Dataset soal berada di `lib/data/questions.dart`, jadi soal bisa diganti sesuai materi kuis.
