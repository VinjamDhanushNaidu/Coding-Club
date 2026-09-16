# Library Lending System

## Overview

The Library Lending System is a relational database project developed using MySQL. It manages books, multiple book copies, library members, librarians, and book borrowing and returning transactions.

The system also maintains loan history and helps identify overdue and currently available books.

## Features

- Manage book information
- Manage multiple physical copies of books
- Manage library members
- Manage librarians
- Issue books to members
- Record returned books
- Maintain loan history
- Identify overdue books
- Find currently available books
- Track borrowed and available copies
- Maintain data integrity using constraints

## Database Tables

### Book

Stores information about books.

### BookCopy

Stores individual physical copies of books and their availability.

### Member

Stores library member information.

### Librarian

Stores librarian information.

### Loan

Stores book borrowing and returning transactions.

## Relationships

- A book can have multiple physical copies.
- A book copy can appear in multiple loan records over time.
- A member can have multiple loans.
- Each loan is associated with one book copy and one member.
- A librarian can be associated with issuing or receiving loans.

## Constraints

The database uses:

- Primary Keys
- Foreign Keys
- NOT NULL constraints
- UNIQUE constraints
- CHECK constraints
- Default values

The availability of book copies is maintained according to their loan status.

## SQL Operations

The project includes queries to:

- Display all books
- Display book copies
- Display members
- Display librarians
- Display loan records
- Find overdue books
- Find currently available books
- Find borrowing history of a member
- Display total, available, and borrowed copies

## Technologies Used

- MySQL
- SQL
- MySQL Workbench

## How to Run

1. Open MySQL Workbench.
2. Open `Library Lending.sql`.
3. Execute the complete SQL script.
4. The `LibraryLendingSystem` database and required tables will be created.
5. Sample data will be inserted automatically.
6. Run the queries to view the results.

## Project Structure

```text
Coding-Club/
│
├── Library Lending.sql
└── Readme.md
