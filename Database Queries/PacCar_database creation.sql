--Tabel Mobil
CREATE TABLE Mobil (
	id_mobil INT PRIMARY KEY,
	merek VARCHAR(20) NOT NULL,
    model VARCHAR(50) NOT NULL,
    jenis VARCHAR(15) NOT NULL,
    transmisi VARCHAR(15) NOT NULL,
    tahun INT NOT NULL,
    odometer_km DECIMAL(20) NOT NULL,
    warna VARCHAR(20) NOT NULL
);

--Tabel Pengguna
CREATE TABLE Pengguna (
    id_pengguna INT PRIMARY KEY NOT NULL,
    nama VARCHAR(200) NOT NULL,
    notelp VARCHAR(20) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
	alamat VARCHAR(200) NOT NULL,
    domisili VARCHAR(200) NOT NULL,
    tanggal_bergabung DATE NOT NULL,
	latitude float8 NOT NULL,
	longitude float8 NOT NUL
);

--Tabel Detail Iklan
CREATE TABLE Detail_Iklan(
	id_detail INT PRIMARY KEY,
	deskripsi VARCHAR(200) NOT NULL,
	alamat VARCHAR(200) NOT NULL,
	domisili VARCHAR(200) NOT NULL,
	latitude float8 NOT NULL,
	longitude float8 NOT NUL
);

--Tabel Penawaran
CREATE TABLE Penawaran (
    id_penawaran INT PRIMARY KEY,
    id_pengguna INT NOT NULL,
    harga_penawaran DECIMAL(20) CHECK(harga_penawaran >= 0) NOT NULL,
   	status_penawaran VARCHAR(40) CHECK(status_penawaran IN ('Pending', 'Diterima', 'Ditolak')) NOT NULL,
	tanggal_penawaran DATE NOT NULL,
	CONSTRAINT fk_pengguna
		FOREIGN KEY(id_pengguna)
		REFERENCES pengguna(id_pengguna)
);

--Tabel Iklan
CREATE TABLE Iklan (
    id_iklan INT PRIMARY KEY NOT NULL,
	id_detail INT NOT NULL,
    id_mobil INT NOT NULL,
	id_pengguna INT NOT NULL,
	judul VARCHAR(200) NOT NULL,
    is_bid BOOLEAN NOT NULL,
	id_penawaran INT,
    harga DECIMAL(20) CHECK(harga >= 0) NOT NULL,
    tanggal_dibuat DATE NOT NULL,
	CONSTRAINT fk_detail
		FOREIGN KEY(id_detail)
		REFERENCES detail_iklan(id_detail),
	CONSTRAINT fk_mobil
		FOREIGN KEY(id_mobil)
		REFERENCES mobil(id_mobil),
	CONSTRAINT fk_pengguna
		FOREIGN KEY(id_pengguna)
		REFERENCES pengguna(id_pengguna),
	CONSTRAINT fk_penawaran
		FOREIGN KEY(id_penawaran)
		REFERENCES penawaran(id_penawaran)
);