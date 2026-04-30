with 

source as (

    select * from {{ source('postgres', 'orders') }}

),

renamed as (

    select
        id as order_id,
        user_id,
        method_id,

        created_at,
        updated_at,

        shipping_address,
        shipping_name

    from source

)

select * from renamed