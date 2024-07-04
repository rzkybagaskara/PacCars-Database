--Analytical Queries
--1.Ranking popularitas model mobil berdasarkan jumlah bid
SELECT m.model,
	   COUNT(m.model) as count_product,
	   COUNT(i.id_penawaran) as count_bid
FROM mobil m
JOIN iklan i USING(id_mobil)
GROUP BY m.model
HAVING COUNT(i.id_penawaran) > 0
ORDER BY count_product DESC

--2. Membandingkan harga mobil berdasarkan harga rata-rata per kota
SELECT di.domisili,
	   m.merek,
	   m.model,
	   m.tahun,
	   i.harga,
	   AVG(i.harga) OVER(PARTITION BY di.domisili) as avg_car_city
FROM mobil m
JOIN iklan i USING(id_mobil)
JOIN detail_iklan di USING(id_detail)
GROUP BY di.domisili, m.merek, m.model, m.tahun, i.harga

--3. Membandingkan tanggal user melakukan bid terhadap suatu mobil
-- Mazda CX-9
-- Join 4 tabel (mobil, iklan, pengguna, dan penawaran)
-- CLUE = gunakan fungsi LEAD() pada tanggal_penawaran dan harga_penawaran
SELECT m.model,
       pg.id_pengguna as user_id,
       pe.tanggal_penawaran AS first_bid_date,
       LEAD(pe.tanggal_penawaran, 1) OVER(
            ORDER BY pe.tanggal_penawaran
       ) AS next_bid,
       pe.harga_penawaran AS first_bid_price,
       LEAD(pe.harga_penawaran, 1) OVER(
            ORDER BY pe.harga_penawaran
       ) AS next_bid_price
FROM mobil m
JOIN iklan i USING(id_mobil)
JOIN penawaran pe ON i.id_penawaran = pe.id_penawaran --harus di specified joinnya make kolom yang mana
JOIN pengguna pg ON pe.id_pengguna = pg.id_pengguna
WHERE m.model = 'Mazda CX-9';

--4. Perbandingan persentase perbedaan rata-rata harga mobil berdasarkan modelnya dari rata-rata
--harga bid yang ditawarkan oleh customer selama 6 bulan terakhir
SELECT m.model,
	   AVG(i.harga) as avg_price,
	   AVG(i.harga) OVER(
		   			PARTITION BY m.model
	   				ORDER BY i.tanggal_dibuat
	   				RANGE INTERVAL '6' MONTH PRECEDING) as avg_bid_6month,
		AVG(i.harga) -  AVG(pe.harga_penawaran) OVER(
		   			PARTITION BY m.model
	   				ORDER BY pe.tanggal_penawaran
	   				RANGE INTERVAL '6' MONTH PRECEDING) as difference,
		(AVG(i.harga) -  AVG(pe.harga_penawaran) OVER(
		   			PARTITION BY m.model
	   				ORDER BY pe.tanggal_penawaran
	   				RANGE INTERVAL '6' MONTH PRECEDING)) / AVG(i.harga) * 100 as difference_percent
FROM mobil m
JOIN iklan i USING(id_mobil)
JOIN penawaran pe ON i.id_penawaran = pe.id_penawaran
GROUP BY m.model, i.harga, pe.harga_penawaran, i.tanggal_dibuat, pe.tanggal_penawaran

--5. Window function untuk rata-rata harga bid sebuah merek dan model mobil selama 6 bulan terakhir
-- Mazda CX-9
SELECT m.merek,
	   m.model,
	    AVG(i.harga) OVER(
		   			PARTITION BY m.model
	   				ORDER BY i.tanggal_dibuat
	   				RANGE INTERVAL '6' MONTH PRECEDING) as m_min_6,
		 AVG(i.harga) OVER(
		   			PARTITION BY m.model
	   				ORDER BY i.tanggal_dibuat
	   				RANGE INTERVAL '5' MONTH PRECEDING) as m_min_5,
		 AVG(i.harga) OVER(
		   			PARTITION BY m.model
	   				ORDER BY i.tanggal_dibuat
	   				RANGE INTERVAL '4' MONTH PRECEDING) as m_min_4,
		 AVG(i.harga) OVER(
		   			PARTITION BY m.model
	   				ORDER BY i.tanggal_dibuat
	   				RANGE INTERVAL '3' MONTH PRECEDING) as m_min_3,
		 AVG(i.harga) OVER(
		   			PARTITION BY m.model
	   				ORDER BY i.tanggal_dibuat
	   				RANGE INTERVAL '2' MONTH PRECEDING) as m_min_2,
		 AVG(i.harga) OVER(
		   			PARTITION BY m.model
	   				ORDER BY i.tanggal_dibuat
	   				RANGE INTERVAL '1' MONTH PRECEDING) as m_min_1
FROM mobil m
JOIN iklan i USING(id_mobil)
JOIN penawaran pe ON i.id_penawaran = pe.id_penawaran --harus di specified joinnya make kolom yang mana
WHERE m.model = 'Mazda CX-9'
GROUP BY m.merek, m.model, i.harga, i.tanggal_dibuat
	   