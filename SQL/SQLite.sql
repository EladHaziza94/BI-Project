SELECT seller_id, product_id, SUM(amount_of_sales) AS "sum of orders per store and product"
FROM FactSales AS A,
FactCustomerPurchase AS B
WHERE A.customer_id=B.customer_id
Group by seller_id,product_id

SELECT product_id,count(distinct seller_id) AS "amount of stores per product"
FROM FactSales AS A,
FactCustomerPurchase AS B
WHERE A.customer_id=B.customer_id
Group by product_id
ORDER BY count(distinct seller_id) DESC

SELECT seller_id, A.order_id , product_id,  AVG(total_spend) OVER (PARTITION BY product_id) AS "AVG cost per product"
FROM FactSales AS A,
FactCustomerPurchase AS B
WHERE A.customer_id=B.customer_id


SELECT customer_id,order_item_id , SUM(amount_of_itmes_purchase) OVER (PARTITION BY customer_id) AS "amount_of_itmes_purchase per customer"
FROM FactCustomerPurchase

SELECT seller_id,A.order_id , product_id, SUM(amount_of_sales) OVER (PARTITION BY A.customer_id) AS "amount of orders per customer"
FROM FactSales AS A,
FactCustomerPurchase AS B
WHERE A.customer_id=B.customer_id
Group by product_id

SELECT customer_id , AVG(total_spend) OVER (PARTITION BY customer_id) AS "AVG total_spend per customer"
FROM FactCustomerPurchase
