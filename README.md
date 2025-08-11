# UPI-transaction-analysis
SQL Server project analyzing UPI transaction data with fraud detection
# 📊 UPI Transaction Analysis (SQL Server)

## 📌 Project Overview
This project analyzes UPI transaction data to uncover insights, identify trends, and detect anomalies.  
It uses **SQL Server** to perform data analysis on a simulated dataset of UPI transactions, including bank-to-bank transfers, transaction statuses, and monthly/daily breakdowns.  

---

## 📂 Dataset
**File:** `upi_transactions_2024.csv`  
**Rows:** ~100,000  
**Columns:**
- `transaction_id` – Unique transaction identifier  
- `timestamp` – Date and time of transaction  
- `transaction_type` – Type of transaction (P2P, P2M, etc.)  
- `merchant_category` – Category of merchant (Grocery, Fuel, etc.)  
- `amount_inr` – Transaction amount in INR  
- `transaction_status` – Success or Failed  
- `sender_state`, `sender_bank`, `receiver_bank` – Sender/Receiver details  
- `device_type`, `network_type` – Transaction device and network info  
- `day_of_week`, `hour_of_day`, `is_weekend` – Derived time-based columns  

---

## 🔍 Key SQL Analysis
1. **Total Successful Transactions by Bank**  
2. **Total Failed Transactions by Bank**  
3. **Top 5 Bank-to-Bank Transaction Pairs by Amount**  
4. **Monthly Transaction Trends** (amount and count)  
5. **Stored Procedure for Monthly Transactions**  
6. **Average Transaction Value per State**  
7. **Stored Procedure for Day-of-Week Analysis**  

---

## 🛠️ Technologies Used
- **SQL Server**
- **T-SQL Stored Procedures**
- **Window Functions, Aggregations, Grouping**
- **Joins and Filtering**
- CSV data import into SQL Server


