with first_order_date as(
    select customer_id, min(order_date) as first_order_date
    from delivery 
    group by customer_id
),
first_and_immediate_order AS (
    select d.customer_id
    from Delivery as d inner join first_order_date as f
    ON d.customer_id = f.customer_id
    AND d.order_date = f.first_order_date
    WHERE d.order_date = d.customer_pref_delivery_date
)

select round(
        (count(*)) *100 /
        (select count(distinct customer_id) from delivery),
        2) as immediate_percentage
from first_and_immediate_order
