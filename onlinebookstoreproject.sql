create table book(
Book_ID int,
Title text,
Author text,
Genre text,
Published_Year varchar(10),
Price numeric(10,2),
Stock int
);


--Import data into book table
copy books(Book_ID,Title,Author,Genre,Published_Year,Price,Stock)
from '‪E:/sohail/All Excel Practice Files/Books.csv'
delimiter ','
csv header;


create table customers(
Customer_ID int primary key,
Name varchar(100),
Email varchar(40),
Phone varchar(12),
City varchar(30),
Country varchar(150)
);
--import data from customer table
copy customers(Customer_ID,Name,Email,Phone,City,Country)
from '‪E:/sohail/All Excel Practice Files/Customers.csv'
delimiter ','
csv header;



alter table books
add constraint book_prk  primary key (Book_ID);


create table orders(
Order_ID serial primary key,
Customer_ID int references customers(customer_id),
Book_ID int references books(Book_ID),
Order_Date date,
Quantity int,
Total_Amount numeric(10,2)
);

-- import data from orders table
copy orders(Order_ID,Customer_ID,Book_ID,Order_Date	,Quantity,Total_Amount)	
from '‪E:\sohail\All Excel Practice Files\Orders.csv'
delimiter ','
csv header;

select * from books;
select * from orders;
select * from customers; 

-- 1) Retrieve all books in the "Fiction" genre:
select * from books
where genre='Fiction';

-- 2) Find books published after the year 1950:
select * from books
where published_year>'1950';

-- 3) List all customers from the Canada:
select * from customers
where country='Canada';

-- 4) Show orders placed in November 2023:
select * from orders;

select * from orders
where order_date between '2023-10-1' and '2023-10-30';

-- 5) Retrieve the total stock of books available:
select * from books;
select sum(stock)as total_stock from books;

-- 6) Find the details of the most expensive book:
select * from books
where price=(select max(price)as max_price from books);


select * from books
order by price desc limit 1;


-- 7) Show all customers who ordered more than 1 quantity of a book:
select * from customers c
join orders o
on c.customer_id=o.customer_id
where o.quantity>1;

select * from orders
where quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:
select * from orders
where total_amount>20;


-- 9) List all genres available in the Books table:
select distinct(genre) as total_genre from books;


-- 10) Find the book with the lowest stock:
select * from books
order by price asc limit 1;

select * from books
where price=(select min(price) from books);

select *,dense_rank() over(order by price)as dense_rank from books limit 1;


-- 11) Calculate the total revenue generated from all orders:

select * from orders;
select sum(total_amount)as total_revenue from orders;


-- Advance Questions : 
-- 1) Retrieve the total number of books sold for each genre:
select * from books;
select * from orders;
select * from customers;

select b.genre,sum(o.quantity)as sold_book from books b
join orders o
on b.book_id=o.book_id
group by b.genre

-- 2) Find the average price of books in the "Fantasy" genre:
select avg(price)as avg_price from books
where genre='Fantasy';

-- 3) List customers who have placed at least 2 orders:

select * from customers;
select * from orders

select c.customer_id,c.name,count(o.order_id)as numerber_order 
from customers c
join orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.name
having count(order_id)>=2;


-- 4) Find the most frequently ordered book:
select * from orders
select * from books;

select b.book_id,count(o.order_id)as no_orders from books b
join orders o
on o.book_id=b.book_id
group by b.book_id
order by no_orders desc limit 1;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

select * from books
where genre='Fantasy'
order by price  desc
limit 3

-- 6) Retrieve the total quantity of books sold by each author:
select * from books;
select * from orders;

select b.author,sum(o.quantity)as total_sold from books b
join orders o
on b.book_id=o.book_id
group by b.author;

-- 7) List the cities where customers who spent over $30 are located:

select distinct(c.city),o.total_amount from customers c
join orders o
on c.customer_id=o.customer_id
where o.total_amount>30;


-- 8) Find the customer who spent the most on orders:
select * from orders;

select c.customer_id,c.name,sum(o.total_amount) as total_spend from customers c
join orders o 
on c.customer_id=o.customer_id
group by c.customer_id,c.name
order by total_spend desc limit 1;


--9) Calculate the stock remaining after fulfilling all orders:
select * from books
select * from orders;

select b.book_id,b.title,b.stock,coalesce(sum(o.quantity),0)as order_quantity,
b.stock- coalesce(sum(o.quantity),0) as remaining_quantity
from books b
left join orders o
on b.book_id=o.book_id
group by b.book_id
order by b.book_id;










