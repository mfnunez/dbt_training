with orders as (
    select *
    from {{ref('stg_jaffle_shop__orders')}}
),

payments as(
    select *
    from {{ref('stg_stripe__payments')}}
),

final as(
    select orders.order_id, orders.customer_id, SUM(amount) as livetime_value
    from orders
        left join payments using (order_id)
    group by 2
)

select * from final