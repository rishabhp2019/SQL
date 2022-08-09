SELECT c.category_name, p.product_name, p.list_price FROM categories AS c INNER JOIN products AS p ON c.category_id = p.category_id ORDER BY c.category_name, p.product_name ASC;

SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code FROM customers AS c INNER JOIN addresses AS a ON c.customer_id = a.customer_id WHERE c.email_address = "allan.sherwood@yahoo.com";

SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code FROM customers AS c INNER JOIN addresses AS a ON c.customer_id = a.customer_id WHERE c.shipping_address_id = a.address_id;

SELECT c.last_name, c.first_name, o.order_date, p.product_name, oi.item_price, oi.discount_amount, oi.quantity FROM customers AS c INNER JOIN orders o ON c.customer_id = o.customer_id INNER JOIN order_items oi ON o.order_id = oi.order_id INNER JOIN products p ON oi.product_id = p.product_id ORDER BY c.last_name, o.order_date, p.product_name;

SELECT p.product_name, p.list_price FROM products p JOIN products p2 on p.product_id != p2.product_id AND p.list_price = p2.list_price ORDER BY p.product_name ASC;

SELECT c.category_name, p.product_id FROM categories c LEFT JOIN products p on c.category_id = p.category_id WHERE p.product_id IS NULL;

SELECT "NOT SHIPPED " AS "Shipped Status", order_id, order_date FROM Orders WHERE ship_date IS NULL UNION SELECT "SHIPPED" AS "Shipped Status", order_id, order_date FROM Orders WHERE ship_date IS NOT NULL ORDER BY order_date;
