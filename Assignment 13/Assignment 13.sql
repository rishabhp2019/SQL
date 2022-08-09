DROP PROCEDURE IF EXISTS test;
DELIMITER //

CREATE PROCEDURE test()
BEGIN
DECLARE count_products_var INT;

SELECT 
    COUNT(*)
INTO count_products_var FROM
    products;

IF count_products_var >= 7 THEN
    SELECT 'The number of products is greater than or equal to 7' AS message;
ELSE
    SELECT 'The number of products less than 7' AS message;
END IF;
END//
DELIMITER ;
CALL test();

DROP PROCEDURE IF EXISTS test;
DELIMITER //

CREATE PROCEDURE test()
BEGIN
DECLARE count_products_var INT;
DECLARE avg_list_price_var DECIMAL(10,2);

SELECT 
    COUNT(*), avg(list_price)
INTO count_products_var, avg_list_price_var FROM
    products;

IF count_products_var >= 7 THEN
    SELECT count_products_var AS count_products, 
    	   avg_list_price_var AS avg_list_price;
ELSE
    SELECT 'The number of products less than 7' AS message;
END IF;

END//
DELIMITER ;
CALL test();

DROP PROCEDURE IF EXISTS test;

DELIMITER //
CREATE PROCEDURE test()
BEGIN
DECLARE fact_var1 int;
DECLARE fact_var2 int;
DECLARE i int;
DECLARE common_var VARCHAR(400) DEFAULT 'Common factors of 10 and 20: ';

SET fact_var1=10;
SET fact_var2=20;
SET i = 1;

  WHILE (i < fact_var1) DO
    
      IF (fact_var1%i = 0 and fact_var2%i=0) THEN
            SET common_var = CONCAT(common_var, i, ' ');
        END IF;
        set i=i+1;
  END WHILE;
  SELECT common_var AS message;
END//
CALL test();

/* confused on number 4*/

DROP PROCEDURE IF EXISTS test;
DELIMITER //

CREATE PROCEDURE test()
BEGIN

DECLARE insert_duplicate TINYINT DEFAULT FALSE;

DECLARE CONTINUE HANDLER FOR 1062
	SET insert_duplicate = TRUE;
 
INSERT INTO categories
(category_id, category_name)
VALUES (default, 'Guitars');

IF insert_duplicate = TRUE THEN
   SELECT 'Row was not inserted - duplicate entry.' AS message;
ELSE
	SELECT '1 row was inserted.' AS message;
END IF;
END//
DELIMITER ;
CALL test();


