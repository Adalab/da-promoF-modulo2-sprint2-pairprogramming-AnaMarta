USE `Northwind`;

SELECT * 
	FROM `orders`;
    
SELECT * 
	FROM `customers`;

-- 1.
-- Numero de pedidos y id de cliente --> tabla orders
-- Nombre cliente --> tabla customers

SELECT `c`.`company_name` AS `NombreEmpresa`, `c`.`customer_id` AS `Identificador`, `c`.`country`, COUNT(`o`.`customer_id`) AS `NumeroPedidos`
	FROM `customers` AS `c`
    INNER JOIN `orders` AS `o`
	ON `c`.`customer_id`= `o`.`customer_id`
	GROUP BY `o`.`customer_id`
    HAVING `c`.`country` = "UK";

-- 2.
SELECT * 
	FROM `order_details`;
    
-- Tablas usadas: customers y orders
SELECT `c`.`company_name`, YEAR(`o`.`order_date`) AS `año`, `c`.`country`, SUM(`od`.`quantity`) AS `NumObjetos`
	FROM `customers` AS `c`
	INNER JOIN `orders` AS `o`
    ON `c`.`customer_id` = `o`.`customer_id` AND `c`.`country` = "UK"
    -- Tabla a usar: order_details
    INNER JOIN `order_details` AS `od`
    ON `o`.`order_id` = `od`.`order_id`
    GROUP BY `c`.`company_name`, YEAR(`o`.`order_date`);
    
-- 3.    
SELECT `c`.`company_name`, YEAR(`o`.`order_date`) AS `año`, `c`.`country`, SUM(`od`.`quantity`) AS `NumObjetos`, `od`.`unit_price`*`od`.`quantity` - `od`.`unit_price`*`od`.`quantity`*`od`.`discount` AS  `DineroTotal`
	FROM `customers` AS `c`
	INNER JOIN `orders` AS `o`
    ON `c`.`customer_id` = `o`.`customer_id` AND `c`.`country` = "UK"
    -- Tabla a usar: order_details
    INNER JOIN `order_details` AS `od`
    ON `o`.`order_id` = `od`.`order_id`
    GROUP BY `c`.`company_name`, YEAR(`o`.`order_date`);
    


