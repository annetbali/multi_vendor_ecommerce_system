insert into clients(id,name)
values(001,'Charity');

insert into grocery_shops(id,name,client_id)
values(001,"Annies grocery shop", 001);

insert into vendors(id,name,location,email,contact,grocery_id)
values(001,'Cathy','Iganga','cathy145@gmail.com',0701456879,001),
      (002,'Joan','Mutungo','joannaki12@gmail.com',0779584563,001);
	
insert into customers (id, name,email,contact,password,location,product_id,grocery_id)
values(020,'Bridget','bbridget@gmail.com','0756732357','','kireka',011,045),
      (021,'Jessica','jessican@gmail.com',0707985623,'','nakawa',010,104),
	  (022,'Doreen','doreenie@gmail.com',0774568933,'','jinja',001);

	  alter table products
     add posted_by varchar;
	 
insert into categories(id, name)
values(001,'fruits')
      (002,'meat')
	  (003,'snacks');

insert into products(id,name,price,description,image,grocery_shop_id,category_id)
values(001,'apples',2000,'fresh','image',010,011),
      (002,'bananas',5000,'fresh','image',030,050),
	  (003,'cakes',70000,'fresh','image',020,022);

insert into orders(id,status,quantity,customer_id,product_id,grocery_id,vendors_id,client_id)
values(101,'apples','kgs',201,202,203,204,206),
      (099,'meat','kgs',001,002,003,004,005),
	  (100,'snacks','kgs',207,208,209,210,211);
	  
insert into order_statuses(id,pending,confirmed,order_id ,product_id, customer_id)
values(101,'pending','no',201,202,203,204,206),
      (099,'confirmed','yes',001,002,003,004,005),
	  (100,'pending','no',207,208,209,210,211),
	  (102,'confirmed','yes',006,007,008,009,010);
	  
insert into cakes(id,name,category,image,price,description,recipes,vendor_id,customer_id,order_id,order_status_id)
values('chocolate','birthday','image',180000,'chocolate','cocoa powder',001,010,014,111),
      ('redvelvet','wedding','image',250000,'buttercream','butter',002,011,015,112),
	  ('strawberry cake','birthday','image',185000,'strawberries','strawberry syrup',003,012,016,113);

insert into users(id,name,user_type)
values(101,'Ritah','client',001,002,100,102),
      (102,'Irene','vendor',100,401,101,120),
	  (103,'Edgar','delivery_man',201,141,145,152),
	  (104,'Annet','customer',111,235,147,151);

-- (ii)make orders for a few products.
    SELECT name,price FROM products
    where name ='apples' or price=5000;
 
--  (iii)select products posted by the client.
   select *from products
   where posted_by = 'clients';


-- (iv)select all products posted by the vendors
   select *from products
   where posted_by = 'vendors';
 
--   (v)select all users from the system
    select *from users;


-- (vi)select all users with user_type vendors
   select * from users
   where user_type='vendor';


-- (vii)select all users with user type of admin and buyer
    select * from users
    where user_type='admin'or user_type ='buyer';
