select orderid as order_id, amount 
from {{ source('jaffle_shop', 'payments') }}
where status = "success"