COPY pengguna(id_pengguna, nama, notelp, email, alamat, domisili, latitude, longitude, tanggal_bergabung)
FROM 'E:\Pacmann Final Project - Database\Dummy Data\CSV\pengguna.csv'
DELIMITER ';'
CSV HEADER;

select * from pengguna

COPY mobil(id_mobil, merek, model, jenis, transmisi, tahun, odometer_km, warna)
FROM 'E:\Pacmann Final Project - Database\Dummy Data\CSV\mobil.csv'
DELIMITER ';'
CSV HEADER;

select * from mobil

COPY detail_iklan(id_detail, deskripsi, alamat, latitude, longitude, domisili)
FROM 'E:\Pacmann Final Project - Database\Dummy Data\CSV\detail_iklan.csv'
DELIMITER ';'
CSV HEADER;

select * from detail_iklan

COPY penawaran(id_penawaran, id_pengguna, harga_penawaran, status_penawaran, tanggal_penawaran)
FROM 'E:\Pacmann Final Project - Database\Dummy Data\CSV\penawaran.csv'
DELIMITER ';'
CSV HEADER;

select * from penawaran

COPY iklan(id_iklan, id_detail, id_pengguna, id_mobil, judul, is_bid, id_penawaran, harga, tanggal_dibuat)
FROM 'E:\Pacmann Final Project - Database\Dummy Data\CSV\iklan.csv'
DELIMITER ';'
CSV HEADER;

select * from iklan
