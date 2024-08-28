

--Pertama, ketika staff ingin membeli sebuah anime ke studio mereka akan melakukan input Purchase ID 
--Data staff, studio, dan tanggal pembelian diinput ke dalam table transaction header sesuai data yang ada

-- Berikut adalah data yang akan masuk ke tabel transactionHeader
INSERT INTO PurchaseHeader VALUES
('PU001','SF001','SD001','2020-01-01')

--Kemudian detail pembelian tersebut masuk kedalam table  Purchasedetail sebagai berikut
INSERT INTO PurchaseDetail  VALUES
('PU001','AN001'),
('PU001','AN018'),

-- Data yang masuk diatas merupakan kode pembelian yang masuk dan kodee anime yang dibeli

-- Untuk penjualan, customer dapat memilih anime mana saja yang akan dibeli dan durasi peminjaman setiap animenya
-- Ketika customer melakukan pemesanan, mereka dapat memilih metode pembayaran dan
-- orderan tersebut akan masuk ke dalam HeaderTransaction dan dibuatkan ID penjualan.
-- Sementara itu, id customer,tanggal pemesanan, dan metode akan masuk sesuai data yang ada

INSERT INTO SalesHeader VALUES
('SA001','CU001','2022-02-21','Debit'),

--Untuk detail dari penjualan tersebut berupa jenis anime dan durasi peminjaman akan masuk kedalam table SalesDetail, contohnya
INSERT INTO SalesDetail VALUES 
('SA001','AN005',7)



