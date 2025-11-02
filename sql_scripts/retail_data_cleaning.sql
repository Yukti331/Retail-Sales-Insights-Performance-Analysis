CREATE TABLE daily_kpi AS
SELECT
  order_date::date AS order_date,
  SUM(sales) AS total_sales,
  SUM(profit) AS total_profit,
  ROUND(
    (SUM(profit)::numeric / SUM(sales)::numeric) * 100,
    2
  ) AS profit_margin
FROM sales_cleaned
GROUP BY order_date
ORDER BY order_date;

select * from daily_kpi



CREATE TABLE region_summary AS
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
	(SUM(profit)::numeric/SUM(sales)::numeric) * 100, 2)
	AS profit_margin
FROM sales_cleaned
GROUP BY region
ORDER BY total_sales DESC;

select * from region_summary


CREATE TABLE category_region_summary AS
SELECT
    category,
    region,
    SUM(sales) AS sales,
    SUM(profit) AS profit
FROM sales_cleaned
GROUP BY category, region;


select * from category_region_summary