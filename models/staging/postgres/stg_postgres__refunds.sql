with 

source as (

    select * from {{ source('postgres', 'refunds') }}

),

renamed as (

    select
        id as refund_id,
        order_id,

        created_at,
        amount

    from source

)

select * from renamed