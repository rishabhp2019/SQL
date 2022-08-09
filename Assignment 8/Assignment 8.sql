SELECT list_price, FORMAT(list_price, 1), CONVERT(list_price, SIGNED), CAST(list_price AS SIGNED)
FROM products;

SELECT date_added, CAST(date_added as date), CAST(date_added AS CHAR (7)), CAST(date_added AS TIME)
FROM products;