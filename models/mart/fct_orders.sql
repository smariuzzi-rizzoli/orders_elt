with 

orders as (

    select * from {{ ref('stg_postgres__orders') }}

),

transactions as (

    select * from {{ ref('stg_postgres__transactions') }}

),

refunds as (

    select * from {{ ref('stg_postgres__refunds') }}

),

methods as (

    select * from {{ ref('stg_drive__methods') }}

),

joined as (

    select
        orders.order_id,
        orders.created_at as order_at,
        orders.user_id,
        orders.method_id,
        orders.shipping_address,

        coalesce(transactions.amount, 0) as paid_amount,
        coalesce(refunds.amount, 0) as refunded_amount,
        refunds.created_at as refunded_at,
        methods.fee


    from orders

    left join transactions on orders.order_id = transactions.order_id

    left join refunds on orders.order_id = refunds.order_id

    left join methods on orders.method_id = methods.method_id

),

adding_gross_fee as (

    select 
        *,
        paid_amount as gross_amount,
        paid_amount * fee as fee_amount

    from joined

),

final as (

    select 
        *,
        gross_amount - fee_amount as net_amount

    from adding_gross_fee

)

select * from final