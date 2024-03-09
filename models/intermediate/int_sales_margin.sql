

select *
from (
    select
        products_id,
        date_date,
        orders_id,
        revenue,
        quantity,
        cast(purchase_price as float64) as purchase_price,
        round(s.quantity * cast(p.purchase_price as float64), 2) as purchase_cost,
        s.revenue - round(s.quantity * cast(p.purchase_price as float64), 2) as margin,
        round( SAFE_DIVIDE( (s.revenue - s.quantity * CAST(p.purchase_price AS float64)) , s.revenue ) , 2) as margin_percentage
    from `river-cocoa-414101`.`dbt_mohrah`.`stg_raw_sales` s
    left join `river-cocoa-414101`.`dbt_mohrah`.`stg_raw_product` p using (products_id)
) as model_limit_subq
limit 500
