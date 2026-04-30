with

source as (

    select * from {{ ref('stg_postgres__users') }}

),

filtered as (

    select
        user_id,
        registered_at,
        user_email,
        address

    from source

)

select * from filtered