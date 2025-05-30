# 📚 Library Management System - RESTful API

## 📝 Overview
Welcome to the **Library Management System API**, a robust **Spring Boot-based** RESTful service that streamlines book and patron management. This API enables users to perform CRUD operations on books and manage patron interactions efficiently.

## 🔧 Prerequisites
Before setting up the project, ensure you have the following installed:
- **Java 17+** (Essential for running the application)
- **Maven** (For building and dependency management)
- **MySQL** (or another SQL database)
- **Git** (Version control for managing project versions)

---

## 🚀 Project Setup
Follow these steps to clone and configure the project

### ✏️ Clone the repository

```shell
   git clone https://github.com/your-username/library-management-system.git
   cd library-management-system
 ```

---

### 🔍 Configure the database

Import the Library Management database to your (MySQL) database instance
```shell
  cmd.exe /c "mysql -u root -p librarymanagement < ./DB_Data/librarymanagement.sql"
```

Update `src/main/resources/application.properties` with your database details.
```
spring.datasource.url=jdbc:postgresql://localhost:5432/librarydb
spring.datasource.username=your_username
spring.datasource.password=your_password
 ```

---

### 🛠️ Build the project
```shell
  mvn clean install
```

---

### ▶️ Running the Application
```shell
  mvn spring-boot:run
```

## 🔗 API Endpoints
### 📖 Book API Endpoints Overview

The Book API provides a robust set of RESTful endpoints for managing books within a library system. It allows users to retrieve, add, update, and delete book records efficiently. With structured data handling, the API ensures seamless integration, supporting CRUD operations to maintain book availability and metadata. Each endpoint is designed for optimal performance, ensuring secure and intuitive interactions.

Libraries can use these endpoints to streamline catalog management. The `GET /api/books` endpoint retrieves all available books, aiding librarians in inventory tracking. The `POST /api/books` endpoint allows adding new books, ensuring that the catalog remains up-to-date. If a book’s information changes, the `PUT /api/books/{id}` endpoint modifies the necessary details, while the `DELETE /api/books/{id}` endpoint removes obsolete records. For example, if a librarian wants to update a book’s edition details, they send a request with the modified attributes, ensuring accurate records for future lending. These endpoints enhance operational efficiency, making library management more accessible and automated.

### 📖 Books API in a Nutshell

 Method | Endpoint | Description 
-|--------|-
GET | /books	 | Get all books
GET |	/books/{id}	| Get book by ID
POST |	/books	| Add a new book
PUT |	/books/{id}	| Update book details
DELETE |	/books/{id}	| Delete a book

---

## 🛠️ Sample Requests

### ➕ Add a New Book 
**POST /books**

#### 📝 Description
This endpoint allows users to add a new book to the library database. The request body must include the book's **title**, **author**, **ISBN**, and **published date**. Upon successful creation, the API returns the newly added book with its assigned **unique identifier**.

#### 🔖 Request Format
- **Method:** `POST`
- **Endpoint:** `/books`
- **Content-Type:** `application/json`
- **Authorization:** None (public endpoint)


#### 📌 Sample Request Body:
```JSON
{
  "title": "Spring Boot Essentials",
  "author": "Roberto García",
  "isbn": "978-1234567890",
  "publishedDate": "2025-05-30T00:00:00"
}
```
#### 🔖 Response Format
**Status Code:** `201 Created`
#### 📌 Sample Response Body:
```JSON
{
    "id": 19,
    "title": "Spring Boot Essentials",
    "author": "Roberto García",
    "isbn": "978-1234567890",
    "publishedDate": "2025-05-30T00:00:00.000+00:00",
    "createdAt": "2025-05-30T18:16:05.559+00:00",
    "updatedAt": "2025-05-30T18:16:05.559+00:00"
}
```
#### ⚠️ Possible Error Responses
Status Code | Description
:-|:-
400 Bad Request |	Missing required fields or invalid data format
409 Conflict |	Duplicate ISBN detected, book already exists
500 Internal Server Error |	Server encountered an unexpected error

---

### 📚 Retrieve All Books
**GET /books**
#### 📝 Description
This endpoint fetches a list of all books available in the library database. It returns detailed information about each book, including **title**, **author**, **ISBN**, **published date**, and timestamps for record creation and last update.

#### 🔖 Request Format
- **Method:** `GET`
- **Endpoint:** `/api/books`
- **Content-Type:** `application/json`
- **Authorization:** None (public endpoint)

#### ✅ Response Format
**Status Code:** `200 OK`

#### 📌 Sample Response Body:
```JSON
[
  {
    "id": 1,
    "title": "The Pragmatic Programmer",
    "author": "Andrew Hunt, David Thomas",
    "isbn": "978-0201616224",
    "publishedDate": "1999-10-20T05:00:00.000+00:00",
    "createdAt": "2025-05-30T16:00:31.000+00:00",
    "updatedAt": "2025-05-30T16:00:31.000+00:00"
  },
  {
    "id": 9,
    "title": "Introduction to the Theory of Computation",
    "author": "Michael Sipser",
    "isbn": "978-1133187790",
    "publishedDate": "1996-01-01T06:00:00.000+00:00",
    "createdAt": "2025-05-30T16:00:31.000+00:00",
    "updatedAt": "2025-05-30T16:00:31.000+00:00"
  }
]
```
#### ⚠️ Possible Error Responses
Status Code | Description
:-|:-
404 Not Found|	No books found in the database
500 Internal Server Error|	Server encountered an unexpected issue while processing the request

---

### 🔍 Retrieve a Book by ID

**GET /books/{id}**

#### 📝 Description
This endpoint allows users to fetch details of a specific book using its **unique identifier** (`id`). The response provides comprehensive information about the book, including its **title**, **author**, **ISBN**, **published date**, and timestamps for when the record was created and last updated.

#### 🔖 Request Format
- **Method:** `GET`
- **Endpoint:** `/api/books/{id}`
- **Content-Type:** `application/json`
- **Authorization:** None (public endpoint)
- **Path Parameter:**
  - `id` (integer) - The unique identifier of the book to retrieve

#### ✅ Response Format
**Status Code:** `200 OK`

##### 📌 Sample Response Body:
```JSON
{
    "id": 1,
    "title": "The Pragmatic Programmer",
    "author": "Andrew Hunt, David Thomas",
    "isbn": "978-0201616224",
    "publishedDate": "1999-10-20T05:00:00.000+00:00",
    "createdAt": "2025-05-30T16:00:31.000+00:00",
    "updatedAt": "2025-05-30T16:00:31.000+00:00"
}
```
#### ⚠️ Possible Error Responses
Status Code | Description
:-|:-
404 Not Found|	No book found for the given ID
400 Bad Request|	Invalid ID format or missing ID in request
500 Internal Server Error|	Server encountered an unexpected issue

---

### ✏️ Update Book Details
**PUT /books/{id}**

#### 📝 Description
This endpoint allows users to update the details of an existing book in the library database. The request must include the **title**, **author**, **ISBN**, and **published date**. The API will modify the book's information and return the updated record.

#### 🔖 Request Format
- **Method:** `PUT`
- **Endpoint:** `/api/books/{id}`
- **Content-Type:** `application/json`
- **Authorization:** None (public endpoint)
- **Path Parameter:**
  - `id` (integer) - The unique identifier of the book to update

#### 📌 Sample Request Body:
```JSON
{
  "title": "The Future of AI in Everyday Life",
  "author": "Sophia Alvarez",
  "isbn": "978-9876543210",
  "publishedDate": "2025-06-15T00:00:00"
}
```
#### 🔖 Response Format
**Status Code:** `200 OK`

#### 📌 Sample Response Body:
```JSON
{
    "id": 19,
    "title": "The Future of AI in Everyday Life",
    "author": "Sophia Alvarez",
    "isbn": "978-9876543210",
    "publishedDate": "2025-06-15T00:00:00.000+00:00",
    "createdAt": "2025-05-30T18:16:06.000+00:00",
    "updatedAt": "2025-05-30T18:17:51.929+00:00"
}
```
#### ⚠️ Possible Error Responses
Status Code | Description
:-|:-
400 Bad Request|	Missing required fields or invalid data format
404 Not Found|	No book found for the given ID
409 Conflict|	Duplicate ISBN detected, book already exists
500 Internal Server Error|	Server encountered an unexpected issue


---

### ❌ Delete Book
**DELETE /books/{id}**

#### 📝 Description
This endpoint allows users to **permanently remove** a book from the library database using its **unique identifier** (`id`). Once deleted, the book **cannot be recovered**, so use this operation with caution.

#### 🔖 Request Format
- **Method:** `DELETE`
- **Endpoint:** `/api/books/{id}`
- **Content-Type:** `application/json`
- **Authorization:** None (public endpoint)
- **Path Parameter:**
  - `id` (integer) - The unique identifier of the book to delete

#### ✅ Response Format
**Status Code:** `204 No Content`

##### 📌 Expected Behavior:
- If the book exists, it will be deleted, and the response will contain **no content**.
- If the book does not exist, an error response will be returned.

#### ⚠️ Possible Error Responses
| Status Code  | Description |
|-------------|------------|
| `404 Not Found` | No book found for the given ID |
| `400 Bad Request` | Invalid ID format or missing ID in request |
| `500 Internal Server Error` | Server encountered an unexpected issue |

---

## 👥 Contributors
- BlueOCN

## ⚖️ License
This project is licensed under the MIT License.
