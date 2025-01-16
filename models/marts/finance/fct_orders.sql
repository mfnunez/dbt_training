with orders as (
    select *
    from {{ref('stg_jaffle_shop__orders')}}
),

with payments as(
    select *
    from {{ref('stg_stripe__payments')}}
),

with final(
    select orders.order_id, orders.customer_id, SUM(payments.payment) as amount
    from orders
        left join payments using (order_id)
)

select * from final

