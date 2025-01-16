select order_id,customer_id, SUM(payment) as amount
from dbt-tutorial.stripe.payment