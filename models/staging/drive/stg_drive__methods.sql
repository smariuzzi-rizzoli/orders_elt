with 

source as (

    select * from {{ source('drive', 'methods') }}

),

renamed as (

    select
        id as method_id,
        name as method,
        fee

    from source

)

select * from renamed