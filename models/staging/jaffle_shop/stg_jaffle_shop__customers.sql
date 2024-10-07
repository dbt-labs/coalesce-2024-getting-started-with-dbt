with 

source as (

    select * from {{ source('jaffle_shop', 'customers') }}

),

renamed as (

    select
<<<<<<< HEAD
        id,
=======
        id as customer_id,
>>>>>>> 28dd81ec834d12b3e13abce953baadf200306b52
        first_name,
        last_name

    from source

)

select * from renamed
