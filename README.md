# Online-Bookstore-using-SQL-Project

## About the Project

This is a SQL project on an online bookstore. There are three tables — books, customers, and orders — and I wrote queries to answer basic and advanced business questions about sales, revenue, stock, and customer behavior.

## Objective

I wanted to practice setting up a small relational database from scratch (creating tables, adding primary/foreign keys, importing CSV data) and then writing SQL queries to actually answer business-style questions instead of just running SELECT * on everything.

## Tools Used

- PostgreSQL
- SQL (Joins, Group By, Having, Subqueries, Window Function, COALESCE)

## Dataset

The data comes from 3 CSV files: `Books.csv`, `Customers.csv`, and `Orders.csv`, imported into PostgreSQL using the `COPY` command.

**Books table:** Book_ID, Title, Author, Genre, Published_Year, Price, Stock

**Customers table:** Customer_ID, Name, Email, Phone, City, Country

**Orders table:** Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount

Orders is connected to both Books and Customers through foreign keys (Book_ID and Customer_ID).

## Data Cleaning and Preparation

- Created the three tables with proper data types before importing anything.
- Added a primary key constraint on `Book_ID` in the books table after import (`book_prk`), since it wasn't set at table creation.
- Set `Customer_ID` as primary key on customers and `Order_ID` as an auto-incrementing primary key on orders.
- Added foreign keys on orders (`Customer_ID` → customers, `Book_ID` → books) to keep the tables linked properly.

## Analysis

**Basic questions:**

1. All books in the "Fiction" genre.
2. Books published after 1950.
3. All customers from Canada.
4. Orders placed in a given month.
5. Total stock of books available.
6. Details of the most expensive book.
7. Customers who ordered more than 1 quantity of a book.
8. Orders where the total amount is more than $20.
9. All distinct genres in the books table.
10. The book with the lowest stock/price.
11. Total revenue generated from all orders.

**Advanced questions:**

1. Total number of books sold per genre.
2. Average price of books in the "Fantasy" genre.
3. Customers who placed at least 2 orders.
4. The most frequently ordered book.
5. Top 3 most expensive books in the "Fantasy" genre.
6. Total quantity of books sold by each author.
7. Cities where customers who spent over $30 are located.
8. The customer who spent the most overall.
9. Remaining stock for each book after fulfilling all orders (using a left join and COALESCE so books with zero orders still show up).

## Key Insights

- Joining orders with books and grouping by genre gives a breakdown of how many books were sold per genre.
- The "customer who spent the most" query sorts customers by total order amount, so the top row is the biggest spender.
- For the remaining stock question, a regular join isn't enough — books that never got ordered would disappear from the results. A left join with `COALESCE(sum(quantity), 0)` keeps them in and treats no orders as zero.
- Used `DENSE_RANK()` as another way to find the lowest-priced book, alongside a simple `ORDER BY ... LIMIT 1`.



## How to Run

1. Create the `books`, `customers`, and `orders` tables using the CREATE TABLE statements in the SQL file.
2. Update the file paths in the `COPY` commands to point to where your CSV files are saved, then run them to load the data.
3. Add the primary key and foreign key constraints as shown in the file.
4. Run the queries one by one — each is labeled with the question it answers.

## What I Learned

- How to set up primary and foreign key relationships between tables instead of just creating flat tables.
- Importing CSV data into PostgreSQL using `COPY`.
- Using `GROUP BY` with `HAVING` to filter on aggregated results (like customers with 2+ orders).
- Using a left join with `COALESCE` so rows with no matching orders still show up with a 0 instead of disappearing.
- Using `DENSE_RANK()` as an alternative to `ORDER BY ... LIMIT` for ranking-type questions.

