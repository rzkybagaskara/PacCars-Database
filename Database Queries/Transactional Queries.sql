--Transactional Queries
--1. Cari mobil keluaran 2015 ke atas
SELECT * FROM mobil
WHERE tahun >= 2015

--2. tambah satu data bid (penawaran) produk baru
INSERT INTO penawaran (id_penawaran, id_pengguna, harga_penawaran, status_penawaran, tanggal_penawaran)
VALUES (51, 19, 100000000, 'Pending', '2024-01-01')
SELECT * FROM penawaran

--3. Melihat semua mobil yang dijual oleh 1 akun (random) dari yang paling baru (earliest post)
-- cari pengguna bernama "Tugiman Tamba"
SELECT m.id_mobil,
	   i.id_iklan,
	   m.merek,
	   m.model,
	   m.tahun,
	   i.harga,
	   i.tanggal_dibuat
FROM mobil m
JOIN iklan i USING(id_mobil)
JOIN pengguna p USING(id_pengguna)
WHERE p.nama = 'Tugiman Tamba'
ORDER BY i.tanggal_dibuat

--4. Mencari mobil bekas termurah berdasarkan keyword
SELECT m.id_mobil,
	   m.merek,
	   m.model,
	   m.tahun,
	   MIN(i.harga) as harga
FROM mobil m
JOIN iklan i USING(id_mobil)
WHERE model LIKE 'Honda%'
GROUP BY m.id_mobil, m.merek, m.model, m.tahun
ORDER BY harga

--5. Mencari mobil bekas terdekat berdasarkan sebuah id kota/nama kota, dihitung berdasarkan latitude dan longitude
-- menggunakan rumus jarak eucledian
CREATE OR REPLACE FUNCTION euclidean_distance(lat1 float, lon1 float, lat2 float, lon2 float)
RETURNS float AS $$
BEGIN
    RETURN sqrt(pow(lat2 - lat1, 2) + pow(lon2 - lon1, 2));
END;
$$ LANGUAGE plpgsql;

-- misalnya mencari merk Toyota Yaris
WITH yaris_data AS(
	SELECT m.id_mobil,
		   m.merek,
		   m.model,
		   m.tahun,
		   di.domisili,
		   di.latitude,
		   di.longitude,
		   MIN(i.harga) as harga
	FROM mobil m
	JOIN iklan i USING(id_mobil)
	JOIN detail_iklan di USING(id_detail)
	WHERE m.model = 'Toyota Yaris'
	GROUP BY m.id_mobil, m.merek, m.model, m.tahun, di.domisili, di.latitude, di.longitude
	ORDER BY harga
)
SELECT yd1.id_mobil,
	   yd1.merek,
       yd1.model,
       yd1.tahun,
	   yd1.harga,
       yd1.domisili,
       euclidean_distance(yd1.latitude, yd1.longitude, yd2.latitude, yd2.longitude) AS distance
FROM yaris_data yd1, yaris_data yd2
WHERE euclidean_distance(yd1.latitude, yd1.longitude, yd2.latitude, yd2.longitude) != 0


