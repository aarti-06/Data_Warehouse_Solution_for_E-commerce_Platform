--dim_product
SELECT p.product_id, p.product_name, p.product_vendor_id
    ,p.product_department
    ,p.product_is_active
  FROM fm_products p; 


-- dim_customer
select c.customer_id
    ,concat(c.customer_firstname ,' ' , c.customer_lastname) as customer_name
    ,c.customer_address
    ,c.customer_city
    ,c.customer_state
    ,c.customer_zip
    ,c.customer_phone
    ,c.customer_fax
    ,c.customer_email
from fm_customers c;

-- dim_vendor
select v.vendor_id
    ,v.vendor_name
    ,v.vendor_phone
    ,v.vendor_website
from fm_vendors v;

-- fact_sales
select o.customer_id
    ,o.order_date, od.product_id
    ,o.order_id, od.order_qty
    , p.product_retail_price
    ,od.order_qty * p.product_retail_price as extendedpriceamount
from [fm_orders] o
    join [fm_order_details] od on o.order_id = od.order_id
    join fm_products p on od.product_id = p.product_id
order by o.customer_id, od.product_id;




