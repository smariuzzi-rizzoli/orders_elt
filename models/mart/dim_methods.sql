with

source as (

    select * from {{ ref('stg_drive__methods') }}

)

select * from source