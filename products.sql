use belajar_mysql;

-- Menampilkan semua produk dengan harga di atas rata-rata
SELECT *
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

-- Mengambil harga tertinggi dari produk yang termasuk kategori tertentu (join categories dan products)
SELECT MAX(cp.price)
FROM (
    SELECT price
    FROM categories
    INNER JOIN products ON products.id_category = categories.id
) AS cp;