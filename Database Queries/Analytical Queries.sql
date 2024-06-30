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
	   AVG(i.harga) as avg_car_city --harusnya ada window function over partition by
FROM mobil m
JOIN iklan i USING(id_mobil)
JOIN detail_iklan di USING(id_detail)
--WHERE di.domisili = 'Solok'
GROUP BY di.domisili, m.merek, m.model, m.tahun, i.harga


select domisili from detail_iklan
group by 1
having count(domisili) > 0