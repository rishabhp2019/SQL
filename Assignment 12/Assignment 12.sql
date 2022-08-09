
/* code provided */
CREATE OR REPLACE VIEW customer_addresses
AS
SELECT c.customer_id, email_address, last_name, first_name, 
    ba.line1 AS bill_line1, ba.line2 AS bill_line2, 
    ba.city AS bill_city, ba.state AS bill_state, ba.zip_code AS bill_zip, 
    sa.line1 AS ship_line1, sa.line2 AS ship_line2, 
    sa.city AS ship_city, sa.state AS ship_state, sa.zip_code AS ship_zip 
FROM customers c 
    JOIN addresses ba ON c.billing_address_id  = ba.address_id
    JOIN addresses sa ON c.shipping_address_id = sa.address_id;
    
SELECT 
    customer_id, last_name, first_name, bill_line1
FROM
    customer_addresses;
    
UPDATE customer_addresses 
SET 
    ship_line1 = '1990 Westwood Blvd.'
WHERE
    customer_id = 8;
    
CREATE OR REPLACE VIEW order_item_products AS
    SELECT 
        o.order_id,
        o.order_date,
        o.tax_amount,
        o.ship_date,
        oi.item_price,
        oi.discount_amount,
        (oi.item_price - oi.discount_amount) AS final_price,
        oi.quantity,
        (oi.item_price - oi.discount_amount) * oi.quantity as item_total,
        p.product_name
    FROM
        orders o
            INNER JOIN
        order_items oi ON o.order_id = oi.order_id
            INNER JOIN
        products p ON oi.product_id = p.product_id;
    
select * from   order_item_products;      

CREATE OR REPLACE VIEW product_summary AS
    SELECT 
        product_name,
        SUM(quantity) AS order_count,
        SUM(item_total) AS order_total
    FROM
        order_item_products
    GROUP BY product_name;
    
SELECT 
    SUM(order_total)
FROM
    (SELECT 
        order_total
    FROM
        product_summary
    ORDER BY order_total DESC
    LIMIT 5) t;