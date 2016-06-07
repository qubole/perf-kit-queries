-- start query 1 in stream 0 using template query55.tpl
select
  i_brand_id brand_id,
  i_brand brand,
  sum(ss_ext_sales_price) ext_price
from
  store_sales,
  item,
  date_dim
where
  d_date_sk = ss_sold_date_sk
  and ss_item_sk = i_item_sk
  and i_manager_id = 36
  and d_moy = 12
  and d_year = 2001
  and ss_sold_date_sk between 2452245 and 2452275 -- partition key filter
group by
  i_brand,
  i_brand_id
order by
  ext_price desc,
  i_brand_id
limit 100 ;
-- end query 1 in stream 0 using template query55.tpl
