# 📚 Digital BookStore

A full-featured **Online Bookstore Management System** built using **Spring Boot, Spring MVC, Hibernate, JSP, and MySQL**. It supports user operations like browsing books, adding to cart, placing orders, and admin operations like managing inventory, updating orders, and monitoring sales.

---

## 🌐 Live Demo

> _Coming Soon..._

---

## 🛠️ Tech Stack

| Layer           | Technology Used                          |
|-----------------|------------------------------------------|
| Backend         | Spring Boot, Spring MVC, Hibernate ORM   |
| Frontend        | JSP, HTML5, CSS3, Bootstrap, JavaScript  |
| Database        | MySQL                                    |
| Build Tool      | Apache Maven                             |
| Server          | Embedded Tomcat via Spring Boot          |
| IDE             | Spring Tool Suite (STS)                  |
| Java Version    | Java 17                                  |

---

## 🧱 Project Setup via Spring Tool Suite

You can recreate this project using the following steps:

### 🔧 Project Creation Steps:

1. **Open STS** → `File > New > Spring Starter Project`
2. Configure:
   - **Type**: Maven
   - **Language**: Java
   - **Java Version**: 17
   - **Group**: `com.Jan`
   - **Artifact**: `Digital-BookStore`
3. Select the following **dependencies**:
   - Spring Web
   - Spring Boot DevTools
   - MySQL Driver
   - Spring Data JPA
   - Thymeleaf (optional, if used)
4. Click **Finish**.

### ▶️ Run the Project

```bash
Right click on project → Run As → Spring Boot App
````

---

## 📁 Folder Structure

```
Digital-BookStore/
│
├── src/main/java/com/Jan/
│   ├── controller/       # Spring MVC controllers (User/Admin)
│   ├── dao/              # DAO implementations (optional if not using Spring Data)
│   ├── model/            # JPA entity classes
│   └── repository/       # JPA repository interfaces
│
├── src/main/webapp/
│   ├── css/              # CSS styling files
│   └── WEB-INF/views/    # All JSP files (views)
│
├── src/main/resources/
│   ├── application.properties  # DB and server configurations
│
├── pom.xml               # Maven dependencies
└── README.md             # Project documentation
```

---

## 📦 Dependencies in `pom.xml`

Ensure you include the following:

* `spring-boot-starter-web`
* `spring-boot-devtools`
* `spring-boot-starter-data-jpa`
* `mysql-connector-java`
* `javax.servlet-api`
* `jstl`

Example:

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-devtools</artifactId>
</dependency>
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <scope>runtime</scope>
</dependency>
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <scope>provided</scope>
</dependency>
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jstl</artifactId>
</dependency>
```

---

## 🧰 Software Requirements

* Java 17
* Spring Tool Suite (STS) or Eclipse
* Apache Maven
* MySQL Server
* Tomcat (Embedded in Spring Boot)

---

## 🚀 Setup Guide

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/himanshu-nagose/Digital-BookStore.git
cd Digital-BookStore
```

### 2️⃣ Open in Spring Tool Suite

* File > Import > Maven > Existing Maven Projects > Select folder

### 3️⃣ Configure MySQL Database

```sql
CREATE DATABASE bookstore;
```

Edit your `application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/bookstore
spring.datasource.username=root
spring.datasource.password=your_password
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
```

### 4️⃣ Run the Application

```bash
Right-click project → Run As → Spring Boot App
```

Visit: `http://localhost:8080/`

---

## 👥 User Roles

### 👤 User

* Register & login
* Browse/search books
* Add to cart
* Place orders
* Track orders (status: placed → shipped → delivered)

### 🛠️ Admin

* Manage books (add, edit, delete)
* View all users & orders
* Update order status
* View total sales and order count

---

## 🗺️ Roadmap

### ✅ Phase 1

* [x] User authentication
* [x] Book browsing
* [x] Cart and order placement
* [x] Order history

### ✅ Phase 2

* [x] Admin login
* [x] Book management
* [x] Order tracking
* [x] Dashboard for analytics

### 🔄 Future Enhancements

* [ ] REST APIs for frontend/backend split
* [ ] JWT-based authentication
* [ ] Deployment to cloud
* [ ] Coupon support
* [ ] Email notifications

---

## 📸 Screenshots

> Add images for homepage, cart, admin panel, order status, etc.

---

## 🙋 Author

**Himanshu Nagose**

* GitHub: [@himanshu-nagose](https://github.com/himanshu-nagose)
* LinkedIn: [@himanshu-nagose](www.linkedin.com/in/himanshu-nagose)

---

## 💡 Contributing

1. Fork the repository
2. Create a new branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---
