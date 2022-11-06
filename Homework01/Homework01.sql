SET SQL_SAFE_UPDATES = 0; # an adjustment for MySQL Workbench that i used for this homework.

create database Bank; # Firstly, I created our database.

use Bank;   # I selected the database where we make our operations on

# This is our first table.
create table Customer(
customer_id int AUTO_INCREMENT, # This is our primary key. Because it must be unique.It will increase itself automatically.
name varchar(50),               #  It represents customer's name whose length can be max 50. 
lastname varchar(50),           #  It represents customer's surname whose length can be max 50. 
registration_date date,         #  It represents date when customer registered into bank.  
Primary Key(customer_id)        # I specified the primary key of table of Customer.
);

create table Branch(
branch_id int AUTO_INCREMENT,  # This is our primary key. Because it must be unique.It will increase itself automatically.
branch_name varchar(50),       # It represents branch's name whose length can be max 50. 
cash_hold float,               # It represents amount of cash that bank holds in that branch. 
foundation_date date,          # It represents date when that branch has been found.
Primary Key(branch_id)         # I specified the primary key of table of Branch.
);

create table Loan(
customer_id int,               # It represents the customer who took out a loan.It is also foreign key.
branch_id int,                 # It represents the branch which loan has been took out.It is also foreign key. 
amount int,                    # It represents the amount of loan.
Foreign Key(customer_id) references Customer(customer_id), # I specified the one of foreign keys of table of Loan.
Foreign Key(branch_id) references Branch(branch_id)        # I specified the one of foreign keys of table of Loan.
);


# 5 Customers
insert into Customer(name, lastname, registration_date) VALUES ("Kazım", "Tulgaroğlu",("2022-01-05"));
insert into Customer(name, lastname, registration_date) VALUES ("Hugh", "Jackman",("2019-10-24"));
insert into Customer(name, lastname, registration_date) VALUES ("Steve", "Carell",("2018-01-04"));
insert into Customer(name, lastname, registration_date) VALUES ("Keira", "Knightley",("2021-11-24"));
insert into Customer(name, lastname, registration_date) VALUES ("Florence ","Pugh",("2020-08-20"));


# 5 Branchs
insert into Branch(branch_name, cash_hold, foundation_date) VALUES ("New York", 20000,("1999-05-15"));
insert into Branch(branch_name, cash_hold, foundation_date) VALUES ("Istanbul", 50000,("1998-06-05"));
insert into Branch(branch_name, cash_hold, foundation_date) VALUES ("Berlin", 100000,("1997-07-23"));
insert into Branch(branch_name, cash_hold, foundation_date) VALUES ("Amsterdam", 5000,("2002-10-24"));
insert into Branch(branch_name, cash_hold, foundation_date) VALUES ("London", 18000,("2003-09-01"));

# 5 Loans
insert into Loan(customer_id, branch_id, amount) VALUES (1, 2,1300);
insert into Loan(customer_id, branch_id, amount) VALUES (2, 5,1300);
insert into Loan(customer_id, branch_id, amount) VALUES (3, 3,1300);
insert into Loan(customer_id, branch_id, amount) VALUES (4, 4,1300);
insert into Loan(customer_id, branch_id, amount) VALUES (5, 1,1300);


# It returns customer's ids who took out loan from branch whose id is 2
select customer_id from Loan where branch_id = 2;

alter table Customer add score float;     # I added attribute of Score into table of Customer
alter table Branch add liability float;   # I added attribute of Liability into table of Branch


# I imlemented formula for attribute of Score
UPDATE Customer SET score = (year(curdate()) - year(Customer.registration_date)) * 10;

# I imlemented formula for attribute of Liability
UPDATE Branch SET liability = ((year(curdate()) - year(Branch.foundation_date))/(Branch.cash_hold)) * 100;




