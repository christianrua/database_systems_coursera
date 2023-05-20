USE classicmodels;
-- start a new transaction
start transaction;
-- get latest order number
select @orderNumber := max(orderNUmber)
from orders;
-- set new order number
set @orderNumber = @orderNumber + 1;
-- insert a new order for customer 145
insert into orders(orderNumber,
orderDate,
requiredDate,
shippedDate,
status,
customerNumber)
values(@orderNumber,
now(),
date_add(now(), INTERVAL 5 DAY),
date_add(now(), INTERVAL 2 DAY),
'In Process',
145);
-- insert 2 order line items
insert into orderdetails(orderNumber,
productCode,
quantityOrdered,
priceEach,
orderLineNumber)
values(@orderNumber,'S18_1749', 30, '136', 1),
(@orderNumber,'S18_2248', 50, '55.09', 2);
-- commit changes
commit;
-- get the new inserted order
select * from orders a
inner join orderdetails b on a.ordernumber = b.ordernumber
where a.ordernumber = @ordernumber;