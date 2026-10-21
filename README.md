# Online Bookstore Analysis Using SQL

## 📌 About the Project

This project focuses on analyzing an online bookstore database using PostgreSQL. The database consists of three tables: `Books`, `Customers`, and `Orders`.

I wrote basic and advanced SQL queries to answer business-related questions about book sales, revenue, inventory, and customer purchasing behavior.

The project demonstrates how SQL can be used to retrieve, organize, and analyze relational data to generate meaningful business insights.

## 🎯 Project Objectives

- Create a relational database using PostgreSQL.
- Design tables with appropriate data types and constraints.
- Import CSV files using the `COPY` command.
- Establish primary key and foreign key relationships.
- Perform basic and advanced data analysis using SQL.
- Analyze book sales, revenue, inventory, and customer behavior.
- Practice joins, aggregations, subqueries, and window functions.

## 🛠️ Tools and Technologies

- **Database:** PostgreSQL
- **Query Language:** SQL
- **Data Import:** CSV files using the `COPY` command

### SQL Concepts Used

- SELECT, WHERE, and ORDER BY
- GROUP BY and HAVING
- INNER JOIN and LEFT JOIN
- Aggregate functions such as SUM, AVG, and COUNT
- Subqueries
- Window functions: `DENSE_RANK()`
- NULL handling using `COALESCE()`
- Primary and foreign key constraints

## 📂 Dataset Description

The project uses three CSV files: `Books.csv`, `Customers.csv`, and `Orders.csv`.

### 1. Books Table

Stores information about the books available in the bookstore.

| Column | Description |
|---|---|
| `Book_ID` | Unique book identifier |
| `Title` | Book title |
| `Author` | Book author |
| `Genre` | Book genre |
| `Published_Year` | Year of publication |
| `Price` | Price of the book |
| `Stock` | Available stock |

### 2. Customers Table

Stores customer information.

| Column | Description |
|---|---|
| `Customer_ID` | Unique customer identifier |
| `Name` | Customer name |
| `Email` | Customer email |
| `Phone` | Customer phone number |
| `City` | Customer city |
| `Country` | Customer country |

### 3. Orders Table

Stores information about customer orders.

| Column | Description |
|---|---|
| `Order_ID` | Unique order identifier |
| `Customer_ID` | Customer reference |
| `Book_ID` | Book reference |
| `Order_Date` | Date of the order |
| `Quantity` | Number of books ordered |
| `Total_Amount` | Total order amount |

## 🔗 Database Relationships

The database uses primary and foreign keys to maintain relationships between tables.

- `Books.Book_ID` is the primary key of the Books table.
- `Customers.Customer_ID` is the primary key of the Customers table.
- `Orders.Order_ID` is the primary key of the Orders table.
- `Orders.Customer_ID` references `Customers.Customer_ID`.
- `Orders.Book_ID` references `Books.Book_ID`.

These relationships allow customer and book information to be combined with order data for analysis.

## 🧹 Data Preparation

The following database preparation steps were performed:

1. Created the three tables with appropriate data types.
2. Imported the CSV files into PostgreSQL.
3. Added a
