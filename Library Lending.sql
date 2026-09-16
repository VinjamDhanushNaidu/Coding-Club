DROP DATABASE IF EXISTS LibraryLendingSystem;
CREATE DATABASE LibraryLendingSystem;
USE LibraryLendingSystem;

CREATE TABLE Book (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    ISBN VARCHAR(20) NOT NULL,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(200) NOT NULL,
    Publisher VARCHAR(150),
    Year INT,
    Category VARCHAR(100)
);

CREATE TABLE BookCopy (
    CopyID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT NOT NULL,
    Available BOOLEAN NOT NULL DEFAULT TRUE,
    Shelf VARCHAR(50),
    Section VARCHAR(50),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

CREATE TABLE Member (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    MembershipDate DATE NOT NULL
);

CREATE TABLE Librarian (
    LibrarianID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    HireDate DATE NOT NULL
);

CREATE TABLE Loan (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    CopyID INT NOT NULL,
    MemberID INT NOT NULL,
    LibrarianID INT,
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    Status ENUM('borrowed','returned','overdue') NOT NULL DEFAULT 'borrowed',
    FOREIGN KEY (CopyID) REFERENCES BookCopy(CopyID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (LibrarianID) REFERENCES Librarian(LibrarianID),
    CHECK (DueDate >= BorrowDate),
    CHECK (ReturnDate IS NULL OR ReturnDate >= BorrowDate)
);

INSERT INTO Book (ISBN, Title, Author, Publisher, Year, Category) VALUES
('9780131103627','The C Programming Language','Brian Kernighan','Prentice Hall',1988,'Programming'),
('9780262033848','Introduction to Algorithms','Thomas Cormen','MIT Press',2009,'Algorithms'),
('9780132350884','Clean Code','Robert Martin','Prentice Hall',2008,'Programming'),
('9780134685991','Effective Java','Joshua Bloch','Pearson',2018,'Java'),
('9781491957660','Python Crash Course','Eric Matthes','No Starch Press',2019,'Python'),
('9780132121553','Computer Networks','Andrew Tanenbaum','Pearson',2011,'Networking'),
('9781119456339','Operating System Concepts','Abraham Silberschatz','Wiley',2018,'Operating Systems'),
('9780073523323','Digital Design','Morris Mano','McGraw Hill',2017,'Electronics'),
('9780262046305','Artificial Intelligence','Stuart Russell','Pearson',2021,'AI'),
('9780133594140','Database System Concepts','Abraham Silberschatz','McGraw Hill',2019,'Database'),
('9780321125217','Design Patterns','Erich Gamma','Addison Wesley',1994,'Programming'),
('9780134494166','Computer Architecture','John Hennessy','Morgan Kaufmann',2017,'Architecture'),
('9781617294433','Spring in Action','Craig Walls','Manning',2022,'Java'),
('9781492052203','Fluent Python','Luciano Ramalho','O Reilly',2022,'Python'),
('9780135166307','Software Engineering','Ian Sommerville','Pearson',2015,'Software Engineering');

INSERT INTO BookCopy (BookID, Available, Shelf, Section) VALUES
(1,TRUE,'S1','Programming'),
(1,TRUE,'S1','Programming'),
(2,TRUE,'S2','Algorithms'),
(2,TRUE,'S2','Algorithms'),
(3,TRUE,'S3','Programming'),
(3,TRUE,'S3','Programming'),
(4,TRUE,'S4','Java'),
(5,TRUE,'S5','Python'),
(6,TRUE,'S6','Networking'),
(7,TRUE,'S7','Operating Systems'),
(8,TRUE,'S8','Electronics'),
(9,TRUE,'S9','AI'),
(10,TRUE,'S10','Database'),
(11,TRUE,'S11','Programming'),
(12,TRUE,'S12','Architecture');

INSERT INTO Member (FirstName, LastName, Address, Phone, Email, MembershipDate) VALUES
('Rahul','Kumar','Guntur','9876543210','rahul@gmail.com','2026-01-10'),
('Arjun','Reddy','Vijayawada','9876543211','arjun@gmail.com','2026-01-15'),
('Priya','Sharma','Hyderabad','9876543212','priya@gmail.com','2026-01-20'),
('Ananya','Rao','Chennai','9876543213','ananya@gmail.com','2026-02-05'),
('Kiran','Varma','Guntur','9876543214','kiran@gmail.com','2026-02-10'),
('Sneha','Patel','Bangalore','9876543215','sneha@gmail.com','2026-02-15'),
('Vikram','Singh','Delhi','9876543216','vikram@gmail.com','2026-02-20'),
('Neha','Reddy','Vijayawada','9876543217','neha@gmail.com','2026-03-01'),
('Rohit','Kumar','Hyderabad','9876543218','rohit@gmail.com','2026-03-05'),
('Divya','Nair','Kochi','9876543219','divya@gmail.com','2026-03-10'),
('Aditya','Rao','Mumbai','9876543220','aditya@gmail.com','2026-03-15'),
('Pooja','Sharma','Pune','9876543221','pooja@gmail.com','2026-03-20'),
('Manoj','Naidu','Guntur','9876543222','manoj@gmail.com','2026-04-01'),
('Sanjay','Reddy','Tirupati','9876543223','sanjay@gmail.com','2026-04-05'),
('Lakshmi','Devi','Amaravati','9876543224','lakshmi@gmail.com','2026-04-10');

INSERT INTO Librarian (Name, Email, HireDate) VALUES
('Priya Sharma','priya.librarian@gmail.com','2024-01-10'),
('Ravi Kumar','ravi.librarian@gmail.com','2024-02-15'),
('Anita Rao','anita.librarian@gmail.com','2024-03-20'),
('Suresh Reddy','suresh.librarian@gmail.com','2024-04-10'),
('Meena Patel','meena.librarian@gmail.com','2024-05-15'),
('Arun Kumar','arun.librarian@gmail.com','2024-06-20'),
('Divya Sharma','divya.librarian@gmail.com','2024-07-10'),
('Karthik Rao','karthik.librarian@gmail.com','2024-08-15'),
('Nisha Singh','nisha.librarian@gmail.com','2024-09-20'),
('Vijay Kumar','vijay.librarian@gmail.com','2024-10-10'),
('Swathi Reddy','swathi.librarian@gmail.com','2024-11-15'),
('Ramesh Naidu','ramesh.librarian@gmail.com','2024-12-20'),
('Keerthi Rao','keerthi.librarian@gmail.com','2025-01-10'),
('Ajay Sharma','ajay.librarian@gmail.com','2025-02-15'),
('Harsha Kumar','harsha.librarian@gmail.com','2025-03-20');

INSERT INTO Loan (CopyID, MemberID, LibrarianID, BorrowDate, DueDate, ReturnDate, Status) VALUES
(1,1,1,'2026-08-01','2026-08-15','2026-08-12','returned'),
(3,2,2,'2026-08-03','2026-08-17','2026-08-16','returned'),
(5,3,3,'2026-08-05','2026-08-19',NULL,'borrowed'),
(7,4,4,'2026-08-07','2026-08-21','2026-08-20','returned'),
(8,5,5,'2026-08-10','2026-08-24',NULL,'borrowed'),
(9,6,6,'2026-08-12','2026-08-26',NULL,'overdue'),
(10,7,7,'2026-08-15','2026-08-29','2026-08-28','returned'),
(11,8,8,'2026-08-18','2026-09-01',NULL,'overdue'),
(12,9,9,'2026-08-20','2026-09-03',NULL,'borrowed'),
(13,10,10,'2026-08-22','2026-09-05','2026-09-04','returned'),
(14,11,11,'2026-08-25','2026-09-08',NULL,'overdue'),
(15,12,12,'2026-08-27','2026-09-10',NULL,'borrowed'),
(2,13,13,'2026-08-29','2026-09-12','2026-09-11','returned'),
(4,14,14,'2026-09-01','2026-09-15',NULL,'overdue'),
(6,15,15,'2026-09-02','2026-09-16',NULL,'borrowed');

UPDATE BookCopy
SET Available = FALSE
WHERE CopyID IN (5,8,9,11,12,14,15,4,6);

UPDATE Loan
SET Status = 'overdue'
WHERE LoanID > 0
AND ReturnDate IS NULL
AND DueDate < CURDATE();

SELECT * FROM Book;

SELECT * FROM BookCopy;

SELECT * FROM Member;

SELECT * FROM Librarian;

SELECT * FROM Loan;

SELECT
    l.LoanID,
    b.Title,
    m.FirstName,
    m.LastName,
    l.BorrowDate,
    l.DueDate,
    l.Status
FROM Loan l
JOIN BookCopy bc ON l.CopyID = bc.CopyID
JOIN Book b ON bc.BookID = b.BookID
JOIN Member m ON l.MemberID = m.MemberID
WHERE l.ReturnDate IS NULL
AND l.DueDate < CURDATE();

SELECT
    b.BookID,
    b.ISBN,
    b.Title,
    b.Author,
    bc.CopyID,
    bc.Shelf,
    bc.Section
FROM Book b
JOIN BookCopy bc ON b.BookID = bc.BookID
WHERE bc.Available = TRUE;

SELECT
    l.LoanID,
    b.Title,
    bc.CopyID,
    l.BorrowDate,
    l.DueDate,
    l.ReturnDate,
    l.Status
FROM Loan l
JOIN BookCopy bc ON l.CopyID = bc.CopyID
JOIN Book b ON bc.BookID = b.BookID
WHERE l.MemberID = 1
ORDER BY l.BorrowDate DESC;

SELECT
    b.Title,
    COUNT(bc.CopyID) AS TotalCopies,
    SUM(CASE WHEN bc.Available = TRUE THEN 1 ELSE 0 END) AS AvailableCopies,
    SUM(CASE WHEN bc.Available = FALSE THEN 1 ELSE 0 END) AS BorrowedCopies
FROM Book b
LEFT JOIN BookCopy bc ON b.BookID = bc.BookID
GROUP BY b.BookID, b.Title;