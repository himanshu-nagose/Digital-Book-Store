# Digital-BookStore

---

# 📚 Digital BookStore

A full-fledged **Online Bookstore Management System** built using **Spring MVC, Hibernate, JSP, and MySQL**. The project includes features for both **users** and **administrators**, allowing book browsing, cart functionality, order management, and admin controls like adding/editing books and tracking orders.

---

## 🌐 Live Demo

> *Coming Soon...* (Optional: Deploy using platforms like [Render](https://render.com), [Vercel](https://vercel.com/), or \[AWS EC2] if applicable)

---

## 🛠️ Tech Stack

| Layer      | Technology Used                         |
| ---------- | --------------------------------------- |
| Backend    | Spring MVC, Spring Core, Hibernate ORM  |
| Frontend   | JSP, HTML5, CSS3, JavaScript, Bootstrap |
| Database   | MySQL                                   |
| Build Tool | Apache Maven                            |
| Server     | Apache Tomcat (v9+)                     |
| IDE        | Eclipse / IntelliJ                      |

---

## 📦 Dependencies & Libraries

Make sure to include the following in your `pom.xml` file:

* **Spring Framework**

  * spring-webmvc
  * spring-context
* **Hibernate Core**
* **MySQL Connector/J**
* **JSTL (Java Standard Tag Library)**
* **Servlet API**
* **Jakarta Annotations**
* **Bootstrap** (for styling in `jsp`)

---

## 📁 Folder Structure

```bash
Digital-BookStore/
│
├── src/main/java/com/Jan/
│   ├── controller/       # All Spring MVC controllers (Admin/User)
│   ├── dao/              # DAO layer for data access
│   ├── model/            # JavaBeans/Entities
│   └── repository/       # JPA repositories
│
├── src/main/webapp/
│   ├── css/              # CSS styling files
│   ├── js/               # JavaScript files
│   ├── jsp/              # JSP files (views)
│   └── WEB-INF/          # Config files, web.xml
│
├── pom.xml               # Maven configuration
└── README.md             # Project documentation
```

---

## 🧰 Software Requirements

Make sure the following tools are installed:

* **Java JDK 8 or above**
* **Apache Maven**
* **Apache Tomcat 9+**
* **MySQL Server**
* **Eclipse IDE / IntelliJ IDEA**
* **Postman** (for API testing if applicable)

---

## 🚀 Setup & Installation Guide

Follow these steps to run the project locally:

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/himanshu-nagose/Digital-BookStore.git
cd Digital-BookStore
```

### 2️⃣ Import the Project in Eclipse/IntelliJ

* Choose: **File > Import > Maven > Existing Maven Projects**
* Select the root folder and finish.

### 3️⃣ Create the MySQL Database

Open MySQL and run:

```sql
CREATE DATABASE bookstore;
```

Update your `hibernate.cfg.xml` or `application.properties` to reflect your DB credentials.

### 4️⃣ Install Dependencies

Maven will automatically download dependencies on build.

Or you can run:

```bash
mvn clean install
```

### 5️⃣ Deploy on Apache Tomcat

* Right-click project > Run As > Run on Server
* Select Apache Tomcat v9
* Go to `http://localhost:8080/Digital-BookStore`

---

## 👥 User Roles

### 🔹 User

* Sign up / login
* Browse books
* Add to cart
* Place orders
* Track order history

### 🔸 Admin

* Add / update / delete books
* View user info
* Track and update order status
* View total sales, order count

---

## 🗺️ Project Roadmap

### ✅ Phase 1: User Features

* [x] Signup/Login
* [x] Browse books (by title/author)
* [x] Cart functionality
* [x] Order placement
* [x] Order history tracking

### ✅ Phase 2: Admin Features

* [x] Admin login
* [x] Book management (add/edit/delete)
* [x] View all orders
* [x] Update order status
* [x] Sales dashboard

### 🔄 Phase 3: Enhancements (Planned/Future)

* [ ] REST APIs for frontend/backend separation
* [ ] Deploy to cloud (AWS/Heroku)
* [ ] Advanced search/filter
* [ ] OTP/email-based authentication
* [ ] Coupon code system

---

## 🖼️ Screenshots

> *You can add screenshots from your project’s UI here to make it visually appealing.*

---

## 🧑‍💻 Author

**Himanshu Nagose**

* GitHub: [@himanshu-nagose](https://github.com/himanshu-nagose)
* LinkedIn: *Add your LinkedIn link here*
* Portfolio: *Add if available*

---

## 💡 Contribution

Contributions are welcome! Follow these steps:

1. Fork the repo
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---



