with 

source as (

    select * from {{ source('postgres', 'users') }}

),

renamed as (

    select
        id as user_id,
        email as user_email,
        firstname,
        lastname,
        address,
        created_at as registered_at

    from source

)

select * from renamed