---------------------------Supplier Table-------------------------------------------------------------
create table Suppliers
( 
	supplier_id int primary key,
    supplier_name varchar(355),
    other_supplier_details varchar(400)
)

insert into Suppliers(supplier_id,"supplier_name","other_supplier_details")
values
(10,'NinJakart', 'Null'),
(20,'Modern Electonics', 'Flipkart'),
(30,'Infiity electrics Service','Amazon'),
(40,'Croma India','Amazon,Flipkart'),
(50, 'pizza centre','null')

Select * from suppliers

insert into Suppliers(supplier_id,"supplier_name","other_supplier_details")
values
(60,'Kishan Konnect', 'Fruits & Vegetable'),
(70,'Panasonic India','Home Appliances'),
(80,'TVS Supply Chain','Spare Parts'),
(90,'KSH Logistics','Logistics'),
(100,'Yamaha automotive','Automobile')

----------------------------------Customer Table----------------------------------------------------------
Create table customers
(
	customer_id int primary key,
	customer_name varchar(400),
	customer_phone varchar(50) not null,
	customer_email varchar(80) unique not null,
	other_customer_details varchar(500)
)

insert into customers(customer_id,"customer_name","customer_phone","customer_email","other_customer_details")
values
(101,'Shams Irshad','98-81998647-70','shams@gmail.com','working'),
(102,'Jayvan Kumar','82-78852255852','jay@gmail.com','graduate'),
(103,'Kishan Kumar','93-45555555','kishan@gmail.com','post graduate'),
(104,'Minhaz Alam','84-725854654','minhaz@gmail.com','government'),
(105,'Nirbhay','8-85647852222','nirbhay@gmail.com','business'),
(106,'Aftab Alam','78888-4552','afteab@gmail.com','shop'),
(107,'Yash Karandhikar','892-22222222','yash@gmail.com','yuotuber'),
(108,'vijay togarge','586-44444','vijay@outlook.com','IT'),
(109,'anurag kashyap','4589-85266','anurag@gmail.com','cricketer'),
(110,'Rahul Dravid','45875544255','dravid@gmail.com','actor')

select * from customers

------------------------------------Addresses Table-------------------------------------------------------
create table Addresses
(
	address_id int primary key unique,
	line_1_number_building varchar(20) not null,
	line_2_number_street varchar(20) not null,
	line_3_area_locality varchar(50)not null,
	city varchar(50) not null,
	Zip_postcode int not null,
	state_province_county varchar(150) not null,
	iso_country_code varchar(80),
	other_address_details varchar(80)
)
insert into Addresses (address_id,"line_1_number_building","line_2_number_street","line_3_area_locality","city",
						Zip_postcode,"state_province_county","iso_country_code","other_address_details")
values
(1001,'200A','2A','Warje','Pune',411058,'Maharashtra','+91','India'),
(1002,'300B','3B','Wagholi','Pune',411027,'Maharashtra','+91','India'),
(1003,'300A','3C','Lakarmara','Godda',814160,'Jharkhand','+92','USA'),
(1004,'400A','4D','delhi','Washington',65821,'USA','+45','USA'),
(1005,'500E','4D','','london',5276,'newyork','+21','UK'),
(1006,'600G','56F','Dongri','Mumbai',911058,'Mumbai','+15','India'),
(1007,'700A','4D','Jalgaon','Washington',65821,'USA','+45','USA'),
(1009,'800A','8D','Doi','Mahagama',858965,'godaa','+25','Dubai'),
(1010,'900B','9D','madrid','Finland',62001,'krwen','+051','USA'),
(1011,'100G','10F','Jalanhar','uttaarakhand',52135,'uttarkhand','+105','UAE')

Update Addresses set line_3_area_locality='VimanNagar' where address_id=1005

Select * from Addresses

--------------------------------------- Products Table----------------------------------------------------
----Getting error----Require key confirmation------
Create table products
(
	product_id int primary key,
	product_type_code varchar(40),
	supplier_id int not null,
	product_price int,
	other_product_details varchar(100)
)

alter table products alter column product_type_code type int USING product_type_code::integer
alter table products add foreign key (supplier_id) references suppliers(supplier_id)
alter table products add foreign key (product_type_code) references suppliers(supplier_id)
Select * from products
select * from suppliers
insert into products(product_id,product_type_code,supplier_id,product_price,"other_product_details")
values
--(301,20,20,1500,'Electronics'),
--(302,50,10,1150,'Electronics'),
--(303,10,70,1200,'spare parts'),
(304,20,60,1250,'Fruits & Vegetable'),
(305,30,50,1250,'Home Appliances'),
(311,40,30,1300,'Fruits & Vegetable'),
(306,70,80,1400,'Pizza'),
(307,90,20,1450,'Fruits & Vegetable'),
(308,60,40,1550,'Medical Equipments'),
(309,50,100,1650,'Fruits & Vegetable'),
(310,20,70,1750,'Spare Parts')

----------------------------------Customers Orders Table--------------------------------------------------
create table Customer_orders
(
	order_id int unique primary key,
	customer_id int not null,
	customer_payment_method_id int,
	order_status_code varchar(50),
	date_order_placed  date not null,
	date_order_paid date not null,
	der_order_price int,
	other_order_details varchar(200)
)
	alter table customer_orders add FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
	alter table customer_orders add FOREIGN KEY (customer_payment_method_id) REFERENCES customers(customer_id)
    alter table customer_orders alter column order_status_code type int USING order_status_code::integer
	alter table customer_orders add FOREIGN KEY (order_status_code) REFERENCES customers(customer_id)
	
insert into customer_orders(order_id,customer_id,customer_payment_method_id,order_status_code,
date_order_placed,date_order_paid,der_order_price,other_order_details)
values
--(601,101,102,101,'12-01-2020','12-01-2020',450,'Electronics')
(602,102,103,104,'18-11-2020','19-11-2020',450,'Books'),
(603,103,105,105,'10-11-2020','11-11-2020',4511,'CDs'),
(604,104,104,110,'10-01-2020','12-01-2020',550,'Coffee'),
(605,105,106,101,'18-11-2020','19-11-2020',4550,'Electronics'),
(606,106,107,103,'14-10-2020','15-11-2020',250,'Fruits'),
(607,107,108,105,'20-11-2020','22-11-2020',350,'Books'),
(608,108,109,103,'25-11-2020','26-11-2020',14550,'Home Appliance'),
(609,109,107,106,'27-11-2020','28-11-2020',24550,'Mobile'),
(610,110,108,109,'05-11-2020','06-11-2020',3550,'Electronics'),
(611,108,106,101,'18-11-2020','29-11-2020',1550,'Kitchen Appliance')

Select * from customer_orders	
--alter table teachers alter column teacher_id type int USING teacher_id::integer
--select * from customer_orders

---------------------------------Customer Addresses Table-----------------------------------------------
create table customer_Addresses
(
	customer_id int unique, --primary key, 
	Foreign key (customer_id) references customers(customer_id),
	address_id int unique  not null,-- primary key, 
	foreign key (address_id) references Addresses(address_id),
	date_from date, --primary key,
	address_type_code int not null,
	foreign key (address_type_code) references Addresses(address_id),
	date_to date,
	constraint PK_customer_Addresses Primary key(customer_id,address_id,date_from)
	--CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
)
select * from customer_Addresses

insert into customer_addresses(customer_id,address_id,date_from,address_type_code,date_to)
--values(102,1001,'20-01-2021',1001,'20-01-2021')
--values(101,1002,'22-11-2021',1003,'23-11-2021'),
values(103,1004,'04-12-2021',1005,'06-12-2021'),
(104,1005,'08-12-2021',1010,'09-12-2021'),
(105,1006,'12-12-2021',1007,'13-12-2021'),
(106,1003,'16-12-2021',1007,'17-12-2021'),
(107,1007,'07-12-2021',1010,'08-12-2021'),
(109,1009,'11-12-2021',1006,'14-12-2021'),
(110,1010,'04-09-2021',1009,'06-09-2021')


---------------------------------------Customer_order_Products Table-------------------------------------
create table Customer_Orders_Products
(
	order_id int not null unique,
	foreign key (order_id) references Customer_orders(order_id),
	product_id int not null unique,
	foreign key (product_id) references products(product_id),
	quantity int not null,
	comments varchar(150),
    Constraint PK_Customer_Orders_Products primary key (order_id,product_id)
)

Select * from Customer_Orders_Products 
insert into customer_orders_Products (order_id,product_id,quantity,comments)
values(601,301,18,'Required urgently'),
(602,302,19,'Electronics'),
(603,303,21,'Fruits & Vegetable'),
(604,304,100,'transmitter'),
(605,305,40,'Mobile'),
(606,306,25,'Electronics'),
(607,307,10,'Furniture'),
(608,308,90,'Home Appliances'),
(609,309,100,'Shoes'),
(610,310,41,'Clothes')

-------------------------------------Customer_Orders_Delivery--------------------------------------------

create table Customer_Orders_Delivery
(
	order_id int not null, 
	foreign key(order_id) references Customer_orders(order_id),
	date_reported date not null,
	delivery_status_code int not null,
	foreign key(delivery_status_code) references Customer_orders(order_id),
	constraint PK_Customer_Orders_Delivery primary key (order_id,date_reported)
)

select * from Customer_Orders_Delivery

insert into Customer_Orders_Delivery(order_id,date_reported,delivery_status_code)
values(601,'10-03-2021',610),
(602,'11-03-2021',609),
(603,'12-03-2021',610),
(604,'13-03-2021',608),
(605,'14-03-2021',607),
(606,'15-03-2021',606),
(607,'16-03-2021',605),
(608,'17-03-2021',604),
(609,'18-03-2021',603),
(610,'19-03-2021',602)


-----------------------------------Ref_Address_Types------------------------------------------------------

create table Ref_Address_Types
(
	address_type_code int primary key,
	address_type_description varchar(100) not null
)

Select * from Ref_Address_Types
insert into Ref_Address_Types(address_type_code, address_type_description)
values (901,'Billing Address'),
(902,'Resience Address'),
(903,'Delivery Address'),
(904,'Office Address'),
(905,'Delivery Address'),
(906,'Home Address'),
(907,'Restaurant Address'),
(908,'Warehouse Address'),
(909,'Shop  Address'),
(910,'Delivery Address')
 


























