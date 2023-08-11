-- Members Table
CREATE TABLE Members (
    Member_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone_Number VARCHAR(20),
    Join_Date DATE,
    Address VARCHAR(200),
    Borrowed_status VARCHAR(3)
);

-- Books Table
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(200),
    ISBN VARCHAR(20),
    Publication_Year INT,
    Category_ID INT, -- Reference to Category table
    Availability VARCHAR(10)
);

-- Authors Table
CREATE TABLE Authors (
    Author_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone_Number VARCHAR(20),
    Address VARCHAR(200)
);

-- Authored_By Table (for the many-to-many relationship)
CREATE TABLE Authored_By (
    Author_ID INT,
    Book_ID INT,
    PRIMARY KEY (Author_ID, Book_ID),
    FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

-- Category Table
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(50)
);

-- Staff Table
CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone_Number VARCHAR(20),
    Address VARCHAR(200),
    Position VARCHAR(50),
    Hire_Date DATE
);

-- Shifts Table
CREATE TABLE Shifts (
    Shift_ID INT PRIMARY KEY,
    Shift_Name VARCHAR(20)
);

-- Staff_Shift Table (for the relationship between Staff and Shifts)
CREATE TABLE Staff_Shift (
    Staff_ID INT,
    Shift_ID INT,
    PRIMARY KEY (Staff_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
    FOREIGN KEY (Shift_ID) REFERENCES Shifts(Shift_ID)
);


-- Inserting relevant data in the library database

-- Insert data into Members
INSERT INTO Members (Member_ID, First_Name, Last_Name, Email, Phone_Number, Join_Date, Address, Borrowed_status)
VALUES
    (1, 'Chandan', 'Yadav', 'Yadav@gmail.com', '9854146836', '2022-01-15', '123 Main St', 'Yes'),
    (2, 'Spandan', 'Bhattrai', 'Bhattrai@gmail.com', '9854621554', '2023-03-10', '456 Elm St', 'No'),
    (4, 'bigyan', 'khalaketi', 'khalaketi@gmail.com', '9854246836', '2022-01-15', '012 Main St', 'Yes'),
    (5, 'Shubham', 'Bhattrai', 'Bhattrai@gmail.com', '9854621554', '2023-03-10', '235 Elm St', 'No'),
    (3, 'Spandan', 'Rai', 'Rai@gmail.com', '9826421554', '2023-03-10', '496 Elm St', 'Yes');
    -- ... (insert more records)

-- Insert data into Category
INSERT INTO Category (Category_ID, Category_Name)
VALUES
    (1, 'Computer Science'),
    (2, 'History'),
    (4, 'Math'),
    (5, 'English'),
    (3, 'Literature');
    -- ... (insert more records)

-- Insert data into Books
INSERT INTO Books (Book_ID, Title, ISBN, Publication_Year, Category_ID, Availability)
VALUES
    (1, 'Introduction to Programming', '978-1234567890', 2020, 1, 'Available'),
    (2, 'History of Literature', '978-9876543210', 2018, 2, 'Available'),
    (3, 'Math', '978-1234567890', 2020, 4, 'Available'),
    (4, 'English', '978-987141577', 2018, 5, 'Available'),
    (5, 'Biology', '978-98414457720', 2018, 3, 'Available');
    -- ... (insert more records)

-- Insert data into Authors
INSERT INTO Authors (Author_ID, First_Name, Last_Name, Email, Phone_Number, Address)
VALUES
    (1, 'Aman', 'Gupta', 'gupta@gmail.com', '555-123-4567', '789 Oak St'),
    (2, 'Aryan', 'Tiwary', 'tiwary@gmail.com', '555-987-6543', '321 Maple Ave'),
    (3, 'Amar', 'Gupta', 'gupta@gmail.com', '665-123-4567', '725 Oak St'),
    (4, 'Amal', 'Tiwary', 'tiwary@gmail.com', '775-987-6663', '324 Maple Ave'),
    (5, 'Aryan', 'Shrestha', 'shrestha@gmail.com', '555-987-4567', '321 Stealth Ave');
    -- ... (insert more records)

-- Insert data into Authored_By
INSERT INTO Authored_By (Author_ID, Book_ID)
VALUES
    (1, 1),
    (1, 2),
    (4, 3),
    (5, 2),
    (2, 4);
    -- ... (insert more records)

-- Insert data into Staff
INSERT INTO Staff (Staff_ID, First_Name, Last_Name, Email, Phone_Number, Address, Position, Hire_Date)
VALUES
    (1, 'Diya', 'Regmi', 'regmi@gmail.com', '777-555-1234', '567 Pine St', 'Librarian', '2021-05-20'),
    (2, 'Suvani', 'Basnet', 'basnet@gmail.com', '777-555-9876', '890 Cedar Rd', 'Assistant Librarian', '2022-02-10'),
    (3, 'Simran', 'Sha', 'sha@gmail.com', '777-656-1234', '987 Pine St', 'Librarian', '2021-05-20'),
    (4, 'Suvani', 'Shrestha', 'shreastha@gmail.com', '777-5145-9876', '845 Cedar Rd', 'Assistant Librarian', '2022-02-10'),
    (5, 'Samana', 'Adhikari', 'adhikari@gmail.com', '777-555-9876', '890 Cedar Rd', 'Assistant Librarian', '2022-02-10');
    -- ... (insert more records)

-- Insert data into Shifts
INSERT INTO Shifts (Shift_ID, Shift_Name)
VALUES
    (1, 'Morning'),
    (2, 'Day'),
    (3, 'Evening');
    -- ... (insert more records)

-- Insert data into Staff_Shift
INSERT INTO Staff_Shift (Staff_ID, Shift_ID)
VALUES
    (1, 1),
    (2, 2),
    (1, 3),
    (3, 2),
    (3, 3);
    -- ... (insert more records)


--3
SELECT * FROM Members WHERE Borrowed_status = 'Yes';


--4
SELECT A.Author_ID, A.First_Name AS Author_First_Name, A.Last_Name AS Author_Last_Name,
       B.Book_ID, B.Title AS Book_Title
FROM Authors A
JOIN Authored_By AB ON A.Author_ID = AB.Author_ID
JOIN Books B ON AB.Book_ID = B.Book_ID;


--5
SELECT COUNT(*) AS Total_Books
FROM Books;

--6
SELECT S.Staff_ID, S.First_Name, S.Last_Name, SS.Shift_ID, Sh.Shift_Name
FROM Staff S
JOIN Staff_Shift SS ON S.Staff_ID = SS.Staff_ID
JOIN Shifts Sh ON SS.Shift_ID = Sh.Shift_ID
WHERE Sh.Shift_Name IN ('Morning', 'Day');

--7
UPDATE Staff_Shift
SET Shift_ID = 2 -- Day Shift ID
WHERE Staff_ID = 1; -- Replace 1 with the desired Staff_ID

--8
DELETE FROM Members
WHERE Join_Date < '2021-01-01';


