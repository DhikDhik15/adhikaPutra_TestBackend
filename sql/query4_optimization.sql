-- question
SELECT *
FROM reservations
WHERE
    status = 'ordered'
    AND start_time >= NOW() - INTERVAL '30 days';
-- analisis => query lambat disebabkan oleh pemanggilan semua data yang berjumlah 588 data
-- solusi => diberkan pembatasan agar tidal semua data ditampilkan
SELECT *
FROM reservations
WHERE
    status = 'ordered'
    AND start_time >= NOW() - INTERVAL '30 days'
limit 100;
-- indexing => indexing adalah salah satu cara untuk menggabungkan antar tabel selain menggunakan primary key,
-- indexing dapat dibuat setelah kita membuat primary key. indexing berfungsi mempercepat saat kita melakukan pemanggilan dan pengambilan data
-- dari tabel yang berelasi
-- strategi pengukuran => 1. Melakukan analisa terlebih dahulu waktu eksekusi pertama menggunakan EXPLAIN ANALYZE dari query tersebut
-- 2. Jika dirasa kurang optimal dilakukan analisa terhadap query yang dieksekusi dan membuat indexing