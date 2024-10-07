{{
    config(
        materialized='table'
    )
}}
with customers as (

<<<<<<< HEAD
    select
        id as customer_id,
        first_name,
        last_name

    from {{ref('stg_jaffle_shop__customers')}}
=======
    select * from {{ ref('stg_jaffle_shop__customers') }}
>>>>>>> 28dd81ec834d12b3e13abce953baadf200306b52

),

orders as (

<<<<<<< HEAD
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status,
        _etl_loaded_at

    from {{ref('stg_jaffle_shop__orders')}}
=======
    select * from {{ ref('stg_jaffle_shop__orders') }}
>>>>>>> 28dd81ec834d12b3e13abce953baadf200306b52

),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by 1

),


final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (customer_id)

)

select * from final
