# 🏢 HR Attrition Analysis — SQL Project

## 📌 Project Overview
Analyzed employee attrition patterns using SQL on a self-built 
HR database (HRAttritionDB) with 3 related tables and 20 employee records.

## 🗄️ Database Schema
```
employees ──< performance
employees → department (string column)
```

## 🔧 Tools Used
- MySQL 8.0
- MySQL Workbench

## 📊 Key Business Questions Answered
| # | Question | SQL Concepts Used |
|---|---|---|
| 1 | Total attrition count | COUNT, WHERE |
| 2 | Department-wise headcount | GROUP BY |
| 3 | Attrition rate % per department | CASE WHEN, ROUND |
| 4 | Avg salary — left vs stayed | AVG, GROUP BY |
| 5 | Early exits (tenure < 2 years) | Multi-condition WHERE |
| 6 | Top 3 high-attrition job roles | ORDER BY, LIMIT |
| 7 | Satisfaction score — left vs stayed | JOIN, AVG |
| 8 | Department-wise salary ranking | ORDER BY DESC |
| 9 | Top earner per department | CTE, DENSE_RANK |
| 10 | Below-avg salary + attrition | CTE, JOIN, Subquery |

## 💡 Key Insights
- **Sales department** highest attrition rate — 80%
- **Employees with tenure < 2 years** most likely to leave
- **Satisfaction score** of attrited employees avg lower than retained
- **Employees below dept avg salary** — higher attrition pattern

## 📁 File Structure
```
├── schema/create_tables.sql     → Table creation
├── data/insert_data.sql         → Sample data
└── queries/analysis_queries.sql → All 10 queries
```

## 🔗 Connect
[LinkedIn](https://linkedin.com/in/sathiya-priyan-da) | 
[GitHub](https://github.com/priyan5295)
