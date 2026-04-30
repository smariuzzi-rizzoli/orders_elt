with 

source as (

    select * from {{ source('postgres', 'transactions') }}

),

renamed as (

    select
        id as transaction_id,
        order_id,

        created_at,

        amount

    from source

)

select * from renamed