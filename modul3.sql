--1
SELECT * FROM kedaikopi_nuri.transaksi
WHERE tanggal_transaksi > '2023-10-10' AND tanggal_transaksi < '2023-10-20';

--2
    SELECT transaksi_minuman.tm_transaksi_id, SUM(transaksi_minuman.jumlah_minuman * menu_minuman.harga_minuman) AS Total_Harga
    FROM kedaikopi_nuri.transaksi_minuman
    Join menu_minuman ON menu_minuman.id_minuman = transaksi_minuman.tm_menu_minuman_id
    group by transaksi_minuman.tm_transaksi_id;

--3
SELECT transaksi.customer_id_customer,SUM(Total.Total_Harga) AS Total_Belanja
FROM (    SELECT transaksi_minuman.tm_transaksi_id, SUM(transaksi_minuman.jumlah_minuman * menu_minuman.harga_minuman) AS Total_Harga
    FROM kedaikopi_nuri.transaksi_minuman
    Join menu_minuman ON menu_minuman.id_minuman = transaksi_minuman.tm_menu_minuman_id
    group by transaksi_minuman.tm_transaksi_id) AS Total
JOIN  transaksi ON transaksi.id_transaksi = Total.tm_transaksi_id
where transaksi.tanggal_transaksi BETWEEN '2023-10-03' AND '2023-10-22'
group by transaksi.customer_id_customer;


--4
SELECT pegawai.* FROM pegawai
JOIN transaksi ON pegawai.nik = transaksi.pegawai_nik
JOIN customer ON customer.id_customer = transaksi.customer_id_customer
WHERE customer.nama_customer IN('Davi Liam','Sisil Triana','Hendra Asto');

--5
SELECT YEAR(transaksi.tanggal_transaksi) AS TAHUN, MONTH(transaksi.tanggal_transaksi) AS BULAN,SUM(transaksi_minuman.jumlah_minuman) AS JUMLAH_CUP
FROM transaksi
JOIN transaksi_minuman ON transaksi_minuman.tm_transaksi_id = transaksi.id_transaksi;

--6
    SELECT SUM(transaksi_minuman.jumlah_minuman * menu_minuman.harga_minuman) / 7 AS Total_Harga
    FROM kedaikopi_nuri.transaksi_minuman
    Join menu_minuman ON menu_minuman.id_minuman = transaksi_minuman.tm_menu_minuman_id;
--7



--8
SELECT customer.* FROM customer
LEFT JOIN membership ON membership.m_id_customer = customer.id_customer
WHERE membership.m_id_customer IS NULL;

--9
SELECT COUNT(DISTINCT(transaksi.customer_id_customer)) AS Pemesan_Latte FROM transaksi
JOIN transaksi_minuman ON transaksi_minuman.tm_transaksi_id = transaksi.id_transaksi
JOIN menu_minuman ON menu_minuman.id_minuman = transaksi_minuman.tm_menu_minuman_id
WHERE menu_minuman.nama_minuman LIKE 'Latte';

--10
SELECT customer.nama_customer,menu_minuman.nama_minuman,SUM(transaksi_minuman.jumlah_minuman) AS Jumlah
FROM customer
JOIN transaksi ON transaksi.customer_id_customer = customer.id_customer
JOIN transaksi_minuman ON transaksi_minuman.tm_transaksi_id = transaksi.id_transaksi
JOIN menu_minuman ON menu_minuman.id_minuman = transaksi_minuman.tm_menu_minuman_id
WHERE customer.nama_customer LIKE 'S%'
group by menu_minuman.nama_minuman ; 


