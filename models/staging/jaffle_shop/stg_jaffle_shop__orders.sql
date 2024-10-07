with 

source as (

    select * from {{ source('jaffle_shop', 'orders') }}

),

renamed as (

    select
<<<<<<< HEAD
        id,
        user_id,
=======
        id as order_id,
        user_id as customer_id,
>>>>>>> 28dd81ec834d12b3e13abce953baadf200306b52
        order_date,
        status,
        _etl_loaded_at

    from source

)

select * from renamed
