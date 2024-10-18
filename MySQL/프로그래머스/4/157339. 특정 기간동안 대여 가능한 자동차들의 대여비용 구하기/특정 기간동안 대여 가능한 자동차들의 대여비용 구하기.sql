with car_list as (
    select car_id
    from car_rental_company_rental_history
    where 1=1
        and start_date <= '2022-11-30'
        and end_date >= '2022-11-01'
)
, car_with_fee as (
    select car.car_id
        , car.car_type  
        , daily_fee * 30 * (1 - discount_rate / 100) as total_fee
    from car_rental_company_car car
        left join car_rental_company_discount_plan price on car.car_type = price.car_type
    where duration_type = '30일 이상'
)
select car_id
    , car_type  
    , round(total_fee, 0) as fee
from car_with_fee 
where 1=1
    and car_id not in (select car_id from car_list)
    and car_type in ('세단', 'SUV')
    and (total_fee >= 500000 and total_fee < 2000000)
order by 3 desc, 2, 1 desc