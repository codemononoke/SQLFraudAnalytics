# 💰🔍 Synthetic Financial Data Analysis

## 📝 Overview

This project involves advanced SQL queries designed to analyze a synthetic financial transaction dataset 📊. The dataset contains over 6.3 million entries and simulates 30 days 🗓️ of transactions, including various transaction types and indicators for fraudulent activity 🚨. The main objective is to gain insights into transaction patterns, identify high-risk accounts, and detect potential fraud ⚠️.

## 🗂️ Dataset Information

This project uses the **Synthetic Financial Datasets For Fraud Detection** sourced from Kaggle. You can find the dataset [here](https://www.kaggle.com/datasets/ealaxi/paysim1).

- **Entries**: 6,362,620
- **Columns**:
  - `step` ⏳: Simulated hour (1 step = 1 hour)
  - `type` 💳: Type of transaction (e.g., PAYMENT, CASH-IN)
  - `amount` 💵: Transaction amount
  - `nameOrig` 👤: Origin account ID
  - `oldbalanceOrg` 💰: Initial balance of the origin account
  - `newbalanceOrig` 💸: New balance of the origin account
  - `nameDest` 🏦: Destination account ID
  - `oldbalanceDest` 🏧: Initial balance of the destination account
  - `newbalanceDest` 💹: New balance of the destination account
  - `isFraud` 🚫: Indicator for fraudulent transactions (1 = fraud, 0 = non-fraud)
  - `isFlaggedFraud` ⚠️: Indicator for flagged fraudulent attempts (1 = flagged, 0 = not flagged)

## ⚙️ Data Import and Setup

The CSV data was imported into MySQL Workbench using Python 🐍 and the `pymysql` library. The `SQLAlchemy` package was used to create an engine for seamless integration 🔗.

## 🎯 Key Analysis Objectives

- Understand the distribution and financial volume of various transaction types.
- Detect and analyze high-value transactions and potential fraud.
- Identify high-risk accounts involved in fraudulent activity.

## 🏆 SQL Queries

### 1. **🔢 Identify the Total Number of Transactions by Type**

**Objective**: Understand the distribution of transaction types.

**✅ Solution**: Provides the count of transactions for each type (e.g., PAYMENT, CASH-IN).

| type      | total_transactions   |
|-----------|---------------------:|
| CASH_OUT	| 2,237,500            |
| PAYMENT	  | 2,151,495            |
| CASH_IN	  | 1,399,284            |
| TRANSFER	| 532,909              |
| DEBIT	    | 41,432               |

### 2. **💰 Find the Total Amount Transacted for Each Transaction Type**

**Objective**: Analyze monetary flow by transaction type.

**✅ Solution**: Identifies which transaction types involve the most money.

| type             | total_amount                           |
|------------------|---------------------------------------:|
| TRANSFER         | 485,291,987,263.16                     |
| CASH_OUT         | 394,412,995,224.49                     |
| CASH_IN          | 236,367,391,912.46                     |
| PAYMENT          | 28,093,371,138.37                      |
| DEBIT            | 227,199,221.28                         |



### 3. **📊 Calculate Average Transaction Amount by Type**

**Objective**: Determine the average transaction size for each type.

**✅ Solution**: Shows the typical size of transactions for each type.

| type             | avg_amount           |
|------------------|---------------------:|
| TRANSFER         | 910,647.01           |
| CASH_OUT         | 176,273.96           |
| CASH_IN          | 168,920.24           |
| PAYMENT          | 13,057.60            |
| DEBIT            | 5,483.67             |


### 4. **🔝 Find Top 10 Transactions by Amount**

**Objective**: Locate the highest value transactions.

**✅ Solution**: Returns the top 10 largest transactions for further review.

| step | type     | amount      | nameOrig    | oldbalanceOrg | newbalanceOrig | nameDest    | oldbalanceDest | newbalanceDest | isFraud | isFlaggedFraud |
|----- |----------|-------------|-------------|---------------|----------------|-------------|----------------|----------------|---------|---------------:|
| 276	 | TRANSFER	| 92445516.64	| C1715283297	| 0	            | 0	             | C439737079	 | 9595.98	      | 92455112.62	   | 0	     | 0              |
| 300	 | TRANSFER	| 73823490.36	| C2127282686	| 0	            | 0	             | C753026640	 | 93624010.19	  | 167447500.55   | 0       | 0              |
| 303	 | TRANSFER	| 71172480.42	| C2044643633	| 0	            | 0	             | C84111522   | 113461513.64   | 184633994.07	 | 0	     | 0              |
| 286	 | TRANSFER	| 69886731.3	| C1425667947	| 0	            | 0	             | C167875008	 | 151538710.86   | 221425442.16	 | 0	     | 0              |
| 284	 | TRANSFER	| 69337316.27	| C1584456031	| 0	            | 0	             | C1472140329 | 113007240.28   | 182344556.54	 | 0	     | 0              |
| 286	 | TRANSFER	| 67500761.29	| C811810230	| 0           	| 0	             | C1757599079 | 86356149.52	  | 153856910.81	 | 0	     | 0              |
| 302	 | TRANSFER	| 66761272.21	| C420748282	| 0	            | 0	             | C1073241084 | 68742058.42	  | 135503330.62	 | 0	     | 0              |
| 284	 | TRANSFER	| 64234448.19	| C1139847449	| 0	            | 0	             | C65111466   | 65976908.56	  | 166302068.86	 | 0	     | 0              |
| 298	 | TRANSFER	| 63847992.58	| C300140823	| 0	            | 0	             | C514940761	 | 72171494.33	  | 136019486.91	 | 0	     | 0              |
| 303	 | TRANSFER	| 63294839.63	| C372535854	| 0	            | 0	             | C1871605747 | 75125284.21	  | 138420123.84	 | 0	     | 0              |

### 5. **⚠️ Detect Suspicious High-Value Transactions**

**Objective**: Flag transactions exceeding the 200,000 threshold.

**✅ Solution**: Identifies transactions that may be flagged for review.

| step | type     | amount      | nameOrig    | oldbalanceOrg | newbalanceOrig | nameDest    | oldbalanceDest | newbalanceDest | isFraud | isFlaggedFraud |
|----- |----------|-------------|-------------|---------------|----------------|-------------|----------------|----------------|---------|---------------:|
| 1	   | CASH_OUT	| 229133.94	  | C905080434	| 15325	        | 0	             | C476402209	 | 5083	          | 51513.44	     | 0	     | 0              | 
| 1	   | TRANSFER	| 215310.3	  | C1670993182	| 705	          | 0	             | C1100439041 | 22425	        | 0	             | 0	     | 0              |
| 1 	 | TRANSFER	| 311685.89	  | C1984094095	| 10835	        | 0	             | C932583850	 | 6267	          | 2719172.89	   | 0	     | 0              |
| 1	   | TRANSFER	| 224606.64	  | C873175411	| 0	            | 0	             | C766572210	 | 354678.92	    | 0	             | 0	     | 0              |
| 1	   | TRANSFER	| 379856.23	  | C1449772539	| 0	            | 0	             | C1590550415 | 900180	        | 19169204.93	   | 0	     | 0              |
| 1	   | TRANSFER	| 1505626.01	| C926859124	| 0	            | 0	             | C665576141	 | 29031	        | 5515763.34	   | 0	     | 0              |
| 1	   | TRANSFER	| 554026.99	  | C1603696865	| 0	            | 0	             | C766572210	 | 579285.56	    | 0	             | 0	     | 0              |

**More...**

### 6. **🔍 Count Number of Fraudulent Transactions**

**Objective**: Measure fraudulent activity.

**✅ Solution**: Provides the total count of fraudulent transactions.

| total_fraudulent_transactions |
|------------------------------:|
| 8213                          |

### 7. **💣 Analyze Fraud Rate by Transaction Type**

**Objective**: Determine which types have the highest fraud rates.

**✅ Solution**: Highlights transaction types most associated with fraud.

| type     | total_fraud | fraud_rate |
|----------|-------------|-----------:|
| TRANSFER | 4097	       | 0.76880    |
| CASH_OUT | 4116	       | 0.18396    |

### 8. **💵 Determine the Average Old Balance for Fraudulent Transactions**

**Objective**: Check initial balances before fraudulent transactions.

**✅ Solution**: Indicates the average starting balance in fraudulent cases.

| avg_old_balance_fraud |
|----------------------:|
| 1649667.61            |

### 9. **🚫 Identify Transactions with Zero Balance After Payment**

**Objective**: Detect accounts that were emptied during a transaction.

**✅ Solution**: Finds cases where the origin account balance reached zero post-transaction.

| step | type     | amount      | nameOrig    | oldbalanceOrg | newbalanceOrig | nameDest    | oldbalanceDest | newbalanceDest | isFraud | isFlaggedFraud |
|----- |----------|-------------|-------------|---------------|----------------|-------------|----------------|----------------|---------|---------------:|
| 1	   | TRANSFER	| 181	        | C1305486145 | 181	          | 0	             | C553264065	 | 0	            | 0	             | 1	     | 0              |
| 1	   | CASH_OUT | 181	        | C840083671	| 181	          | 0	             | C38997010	 | 21182	        | 0	             | 1	     | 0              |
| 1	   | PAYMENT	| 4024.36	    | C1265012928	| 2671	        | 0	             | M1176932104 | 0	            | 0	             | 0	     | 0              |
| 1	   | DEBIT	  | 9644.94	    | C1900366749	| 4465	        | 0	             | C997608398	 | 10845	        | 157982.12	     | 0	     | 0              |
| 1	   | PAYMENT	| 11633.76	  | C1716932897	| 10127	        | 0	             | M801569151	 | 0	            | 0	             | 0	     | 0              |
| 1	   | CASH_OUT	| 229133.94	  | C905080434	| 15325	        | 0	             | C476402209	 | 5083	          | 51513.44	     | 0	     | 0              |
| 1	   | PAYMENT	| 1563.82	    | C761750706	| 450	          | 0	             | M1731217984 | 0	            | 0	             | 0	     | 0              |

**More...**

### 10. **🧮 Analyze High-Risk Accounts by Total Fraudulent Amounts**

**Objective**: Find accounts with the highest fraudulent transaction sums.

**✅ Solution**: Highlights accounts significantly contributing to fraud.

| nameOrig     | total_fraud_amount     |
|--------------|-----------------------:|
| C466387318	 | 10000000               |
| C430326245	 | 10000000               |
| C127338416	 | 10000000               |
| C1981814103	 | 10000000               |
| C1131684691	 | 10000000               |
| C628072559	 | 10000000               |
| C523152614	 | 10000000               |
| C1174163617	 | 10000000               |

**More...**

### 11. **📈 Identify Recipients with Unusual Balance Changes**

**Objective**: Spot recipients with sudden balance discrepancies.

**✅ Solution**: Points out accounts that receive large sums unexpectedly.

| nameDest     | unusual_balance_count     |
|--------------|--------------------------:|
| C469716915	 | 6                         |
| C619120762	 | 6                         |
| C577628476	 | 6                         |
| C1831028819	 | 6                         |
| C1487105431	 | 5                         |
| C1141894041	 | 5                         |
| C934225099	 | 5                         |
| C1158705084	 | 5                         |

**More...**

### 12. **🔗 Correlation Analysis of Fraudulent and Flagged Transactions**

**Objective**: Examine the overlap between fraudulent and flagged transactions.

**✅ Solution**: Checks how many fraudulent transactions were also flagged.

| flagged_and_fraud_count |
|------------------------:|
| 16                      |

### 13. **💡 Detect Large Transactions with Zero Initial Balance**

**Objective**: Identify large transactions by accounts starting with zero balance.

**✅ Solution**: Finds suspicious large transactions initiated with no initial funds.

| step | type     | amount      | nameOrig    | oldbalanceOrg | newbalanceOrig | nameDest    | oldbalanceDest | newbalanceDest | isFraud | isFlaggedFraud |
|----- |----------|-------------|-------------|---------------|----------------|-------------|----------------|----------------|---------|---------------:|
| 1	   | TRANSFER	| 224606.64	  | C873175411	| 0	            | 0	             | C766572210	 | 354678.92	    | 0	             | 0	     | 0              |
| 1	   | TRANSFER	| 125872.53	  | C1443967876	| 0	            | 0	             | C392292416	 | 348512	        | 3420103.09	   | 0	     | 0              |
| 1	   | TRANSFER	| 379856.23	  | C1449772539	| 0	            | 0	             | C1590550415 | 900180	        | 19169204.93	   | 0 	     | 0              |
| 1	   | TRANSFER	| 1505626.01	| C926859124	| 0	            | 0	             | C665576141	 | 29031	        | 5515763.34	   | 0	     | 0              |
| 1	   | TRANSFER	| 554026.99	  | C1603696865	| 0	            | 0	             | C766572210	 | 579285.56     	| 0	             | 0	     | 0              |
| 1	   | TRANSFER	| 147543.1	  | C12905860	  | 0	            | 0	             | C1359044626 | 223220	        | 16518.36	     | 0	     | 0              |
| 1	   | TRANSFER	| 761507.39	  | C412788346	| 0	            | 0	             | C1590550415 | 1280036.23	    | 19169204.93	   | 0	     | 0              |

**More...**

## 🚀 Conclusion

This project showcases the power of advanced SQL queries for in-depth analysis of financial data. Through strategic data exploration, you can uncover valuable insights, identify high-risk behaviors, and improve fraud detection strategies. The provided SQL scripts serve as a foundation for building more robust financial analyses and data-driven solutions.

Thank you for exploring this financial data analysis project! If you have any questions or suggestions for further enhancement, feel free to reach out or contribute. Happy analyzing! 📝✨
