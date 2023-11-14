USE northwind;

SELECT * FROM northwind.orders; -- order_id, customer_id, order_date,required_date, employee_id

-- 1.
SELECT max(order_date)
	FROM orders
    WHERE employee_id = 2;
    
SELECT order_id, customer_id, o1.employee_id, order_date, required_date
	FROM orders AS o1
    WHERE order_date = (SELECT max(order_date)
						FROM orders AS o2
						WHERE o2.employee_id = o1.employee_id);

-- 2.



-- 3.
SELECT category_name, category_id
	FROM categories
    WHERE category_name = "Beverages";
    
    
SELECT product_id, product_name, category_id
	FROM products
    WHERE category_id = (SELECT category_id
							FROM categories
							WHERE category_name = "Beverages");

-- 4.
SELECT DISTINCT(`country`)
    FROM `customers`
	WHERE `country` NOT IN (SELECT `country`
					FROM `suppliers`);

-- 5. 
SELECT * FROM northwind.products; -- product_name: Grandma's Boysenberry Spread, product_id
SELECT * FROM northwind.order_details; -- quantity, order_id, product_id
SELECT * FROM northwind.orders; -- order_ID, customer_id

SELECT order_ID, customer_id
	FROM orders
    WHERE `order_id`IN (SELECT `order_id` 
						FROM `order_details`
						WHERE `product_id` = (SELECT `product_id`
												FROM `products`
												WHERE `product_name` = "Grandma's Boysenberry Spread") -- = 6
												AND quantity > 20)
	ORDER BY `customer_id`;

-- 6.
SELECT product_name AS Ten_Most_Expensive_Products, Unit_price AS UnitPrice
	FROM products
    ORDER BY unit_price DESC
    LIMIT 10;
