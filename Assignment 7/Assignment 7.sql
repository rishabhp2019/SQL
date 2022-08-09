SELECT DISTINCT category_name FROM categories
WHERE category_id IN (SELECT DISTINCT category_id FROM products)
ORDER BY category_name;

SELECT product_name, list_price FROM products
WHERE list_price > (SELECT AVG(list_price) FROM products)
ORDER BY list_price DESC;

SELECT category_name FROM categories 
WHERE NOT EXISTS(SELECT * FROM products WHERE category_id = categories.category_id);

SELECT c.email_address, o.order_id, SUM((oi.item_price - oi.discount_amount) * quantity) AS order_total
FROM customers c JOIN orders o ON c.customer_id = o.customer_id JOIN order_items oi ON o.order_id = oi_order_id
GROUP BY c.email_address, o.order_id;

SELECT p.product_name, ROUND(((o.discount_amount * 100) / o.item_price),2) AS Discount_Percent
FROM order_items o INNER JOIN products p ON o.product_id = p.product_id
GROUP BY Discount_Percent
HAVING COUNT(*) = 1
order by p.product_name;

SELECT c.email_address, o.order_id, o.order_date FROM customers c INNER JOIN orders o ON o.o.customer_id = c.customer_id
WHERE o.order_date IN (SELECT MIN(o.order_date) FROM orders o
GROUP BY o.customer_id);