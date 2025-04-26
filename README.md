# 👩‍💼 HR Management Data Analysis 

![images hr](https://github.com/user-attachments/assets/f22ed247-7e61-422e-8d99-ee2221c63c99)

# 💻 Table of content

- [Introduction](#introduction)
- [Dataset Overview](#dataset-overview)
- [Project Objectives](#project-objectives)
- [Data Cleaning](#data-cleaning)
- [Data Exploration and Insight](#data-exploration-and-insight)
- [Recommendation](#recommendation)
- [Conclusion](#conclusion)
- [Tech Stack](#tech-stack)
  

---

## 📌 Introduction

This project focuses on analyzing human resources data using SQL to help the HR department uncover trends, patterns, and insights that support better decision-making around employee management, hiring, diversity, and retention. The project simulates a real-world HR dataset and applies data exploration and business intelligence techniques.

---

## 📊 Dataset Overview

The dataset used in the analysis consists of 14 columns and 22,195 rows

![Screenshot 2025-04-25 hr](https://github.com/user-attachments/assets/44f33b33-1032-4975-bce8-5d29ee9b063b)

The dataset consists of records for employees in various departments, including their demographics, job location (remote or HQ), tenure, employment status, race, age, and more.

### Key Columns:
- `Employee_ID` – Unique identifier
- `First_Name`, `Last_Name` – Personal info
- `Gender`, `Race`, `Age`, `State` – Demographics
- `Employment_Status` – Active/Terminated
- `Location` – HQ or Remote
- `Department`, `Hire_Date` – Job-related details
- `Tenure_Years` – Duration of employment



---

## 🎯 Project Objectives

- Perform data cleaning to ensure consistency and reliability
- Analyze demographic distribution (gender, race, state)
- Examine employment types and work location trends
- Determine employee retention and tenure
- Track hiring patterns over time
- Identify the longest-serving employees
- Evaluate termination data and diversity factors

### 📋 Problem Statement

 
Using the HR Management data, your company requires you to delve into data analysis using SQL to
uncover insights for HR department 
NOTE: Clean data if required
1. What is the gender breakdown in the Company?
2. How many employees work remotely for each department?
3. What is the distribution of employees who work remotely and HQ
4. What is the race distribution in the Company?
5. What is the distribution of employee across different states?
6. What is the number of employees whose employment has been terminated
7. Who is/are the longest serving employee in the organization.
8. Return the terminated employees by their race
9. What is the age distribution in the Company?
10. How have employee hire counts varied over time?
11. What is the tenure distribution for each department?
12. What is the average length of employment in the company?

---

## 🧹 Data Cleaning

Before analysis, the following cleaning steps were applied:

- Removed duplicate employee records (if any)
- Standardized categorical values (e.g., gender, department names)
- Converted date columns into appropriate formats for analysis
- Checked for nulls in critical columns like `Employment_Status`, `Department`, and `Hire_Date`
- Added derived columns such as `Tenure_Years` and age brackets where needed

---

## 🔍 Data Exploration and Insight

### 🧑‍🤝‍🧑 Demographics
- Gender distribution across the company
- Race breakdown and representation across departments
- Age group classification and its distribution

### 💼 Employment Type & Location
- Count of remote workers by department
- Overall HQ vs Remote employee distribution
- State-by-state employee distribution

### 📈 Employment Status
- Total number of terminated employees
- Breakdown of terminated employees by race
- Tenure analysis by department and employment status

### 🕰 Retention & Hiring Trends
- Identification of the longest-serving employee(s)
- Average tenure of employees across the company
- Yearly hire trends to identify growth or attrition patterns

---

## ✅ Recommendations

Based on the insights gathered:

1. **Diversity Monitoring**: Ensure departments maintain balanced gender and racial diversity.
2. **Remote Work Strategy**: Evaluate productivity and preferences in departments with high remote workforce ratios.
3. **Retention Focus**: Investigate reasons for terminations in high-turnover departments.
4. **Age-Inclusive Policies**: With a varied age distribution, adapt policies to accommodate both younger and older workers.
5. **Talent Acquisition**: Boost hiring efforts in underrepresented states or departments with lower headcount.

---

## 🧾 Conclusion

This HR data analysis project demonstrates how SQL can be leveraged to surface critical HR insights. From workforce diversity to tenure trends, the project covers a wide range of factors that influence employee experience and organizational growth. By acting on these insights, companies can strengthen their HR strategies, improve employee retention, and foster a more inclusive workplace.

---

## 🛠 Tech Stack

- SQL (MySQL / PostgreSQL)
- Git & GitHub
- MySQL Workbench

---

> 💬 *Feel free to explore the queries, clone the project, or adapt the approach for your own HR data analysis tasks.*

