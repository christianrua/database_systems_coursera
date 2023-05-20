use BookShop;

insert into Publisher (Publisherid, PublisherName, PublisherAddress, PublisherPhone, URL)
values(01, 'Penguin Random House', 'Luchana 23 Madrid Spain',535819,'http://www.penguinrandomhouse.com/');
insert into Publisher (Publisherid, PublisherName, PublisherAddress, PublisherPhone, URL)
values(02, 'Hachette Livre','50 Victoria Embankment',227000, 'https://www.hachette.com');
insert into Publisher (Publisherid, PublisherName, PublisherAddress, PublisherPhone, URL)
values(03, 'HarperCollins','The News Building London Bridge Street',2427737,'https://www.harpercollins.com/');

insert into Author values (01,'Cat Sebastian','9296 Henry St. Auburndale FL 33823');
insert into Author values (02,'Lorraine Heath','974 Broad Dr. Marcus Hook PA 19061');
insert into Author values (03,'Jill Shalvis','187 Cherry Rd. Reston VA 20191');
insert into Author values (04,'Kevin Kwan','13 Locust St. Round Lake IL 60073');
insert into Author values (05,'Elisabeth Noreback','26 Rock Creek Dr. Tuscaloosa AL 35405');
insert into Author values (06,'Pamela Brown', '409 Santa Clara Ave. Cedar Rapids IA 52402');

insert into Book (isbn, title, year,price, publisherid, authorid) values ('9706279318','A Gentleman
Never Keeps Score',2018,384.00,03,01);
insert into Book (isbn, title, year,price, publisherid, authorid) values ('9728304828','Texas
Glory',2015,94.50,03,02);
insert into Book (isbn, title, year,price, publisherid, authorid) values ('9702833373','Rainy day
friends',2017,45.00,03,03);
insert into Book (isbn, title, year,price, publisherid, authorid) values ('9703859383','Crazy Rich
Asians',2018,234.50,01,04);
insert into Book (isbn, title, year,price, publisherid, authorid) values ('9793937483','Tell me you are
mine',2015,23.60,01,05);
insert into Book (isbn, title, year,price, publisherid, authorid) values ('9729473047','The spy and
the traitor', 2010,200.00,01, 05);
insert into Book (isbn, title, year,price, publisherid, authorid) values ('9703746264','Paradise Sky by
Joe Lansdale',2016,145.00,02,06);
insert into Book (isbn, title, year,price, publisherid, authorid) values ('9739482733','Meet Camaro
from The Night Charter',2010,165.99,02,06);

insert into Customer values ('emkw@mail.com','Karol Wilson', 115099561, '75 Poplar Court
Eugene OR 97402');
insert into Customer values ('rior@mail.com','Richard Orson', 45528305, '33 Richardson Dr.
Chandler AZ 85224');
insert into Customer values ('lowi@mail.com','Loraine Williams', 2211600,'8 Market St.
Portsmouth VA 23703');
insert into Customer values ('sclu@mail.com','Scott Luka', 649373,'412 Pawnee Lane Kenosha, WI
53140');

insert into Warehouse values (01, 5393544,'530 Roosevelt Lane Hopewell Junction NY 12533');
insert into Warehouse values (02, 9759583,'9592 Applegate Road Bedford OH 44146');
insert into Warehouse values (03, 9958484,'21 Arch Ave. Grand Haven MI 49417');

insert into ShoppingBasket values (01,'emkw@mail.com');
insert into ShoppingBasket values (02,'rior@mail.com');
insert into ShoppingBasket values (03,'lowi@mail.com');
insert into ShoppingBasket values (04,'sclu@mail.com');

insert into ShoppingBaskets_have_Books values('9706279318',01,1);
insert into ShoppingBaskets_have_Books values('9703746264',01,1);
insert into ShoppingBaskets_have_Books values('9729473047',01,1);
insert into ShoppingBaskets_have_Books values('9739482733',02,1);
insert into ShoppingBaskets_have_Books values('9728304828',02,1);
insert into ShoppingBaskets_have_Books values('9702833373',02,2);
insert into ShoppingBaskets_have_Books values('9703859383',02,1);
insert into ShoppingBaskets_have_Books values('9793937483',03,1);
insert into ShoppingBaskets_have_Books values('9703859383',03,1);
insert into ShoppingBaskets_have_Books values('9702833373',03,1);
insert into ShoppingBaskets_have_Books values('9739482733',04,1);
insert into ShoppingBaskets_have_Books values('9702833373',04,1);
insert into ShoppingBaskets_have_Books values('9729473047',04,1);
insert into ShoppingBaskets_have_Books values('9793937483',04,1);

insert into Warehouses_have_Books (warehouse_code,Book_ISBN,count)
values(01,'9728304828',15);
insert into Warehouses_have_Books (warehouse_code,Book_ISBN,count)
values(01,'9739482733',29);
insert into Warehouses_have_Books (warehouse_code,Book_ISBN,count)
values(01,'9729473047',151);
insert into Warehouses_have_Books (warehouse_code,Book_ISBN,count)
values(02,'9703859383',20);

insert into Warehouses_have_Books (warehouse_code,Book_ISBN,count)
values(02,'9793937483',383);
insert into Warehouses_have_Books (warehouse_code,Book_ISBN,count)
values(02,'9706279318',293);
insert into Warehouses_have_Books (warehouse_code,Book_ISBN,count)
values(03,'9702833373',393);
insert into Warehouses_have_Books(warehouse_code,Book_ISBN,count)
values(03,'9729473047',38);
insert into Warehouses_have_Books (warehouse_code,Book_ISBN,count)
values(03,'9706279318',48);
insert into Warehouses_have_Books (warehouse_code,Book_ISBN,count)
values(03,'9739482733',29);

USE BookShop;

SELECT *
FROM ShoppingBaskets_have_Books
LIMIT 10;