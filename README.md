# SQL Data Warehouse & Analytics Platform

An end-to-end SQL Server data warehouse built using **Medallion Architecture**, transforming raw ERP and CRM data into clean, integrated, and business-ready analytics.

## Overview

This project consolidates sales data from ERP and CRM source systems into a unified analytical model using Microsoft SQL Server. It covers the complete data lifecycle, including data ingestion, cleansing, standardization, integration, dimensional modeling, and SQL-based analytics.

- **Problem:** Sales data is fragmented across systems, with inconsistent formats and data quality issues.
- **Solution:** A layered data warehouse that transforms raw CSV extracts into a unified analytical model.
- **Outcome:** A single source of truth for analyzing customer behavior, product performance, and sales trends.

## Architecture

The warehouse follows the **Medallion Architecture**, organizing data into three layers.

| Layer | Purpose | Key Operations |
|---|---|---|
| Bronze | Raw data storage | Ingest CSV files without transformation |
| Silver | Cleansed and standardized data | Data cleaning, normalization, deduplication, and quality checks |
| Gold | Business-ready analytical layer | Data integration, dimensional modeling, and analytical views |

### Data Pipeline

```text
ERP / CRM CSV Files
        |
        v
   Bronze Layer
   Raw Ingestion
        |
        v
   Silver Layer
   Data Cleaning
   Standardization
        |
        v
    Gold Layer
   Star Schema
        |
        v
  SQL Analytics
```

## Data Model

The Gold layer exposes a **star schema** designed for analytical queries.

- **FACT_SALES:** Stores sales transactions, including order details, customer and product keys, order dates, quantities, and sales amounts.
- **DIM_CUSTOMERS:** Contains customer attributes such as name, country, and gender.
- **DIM_PRODUCTS:** Contains product attributes such as product name, category, and cost.

The fact table connects to the customer and product dimensions through foreign keys.

See `docs/data_models.drawio` and `docs/data_catalog.md` for the detailed schema and field definitions.

## ETL Pipeline

The pipeline uses a full-load batch strategy to process ERP and CRM CSV files.

1. **Ingestion:** Load source data into Bronze tables using SQL Server `BULK INSERT`.
2. **Transformation:** Clean, standardize, and validate data in the Silver layer.
3. **Integration:** Combine ERP and CRM data into a unified analytical model.
4. **Modeling:** Create Gold-layer views following a star schema.
5. **Validation:** Execute SQL-based data quality checks.

### Key Design Decisions

- Separate layers for raw, transformed, and analytical data.
- Consistent naming conventions across database objects.
- Repeatable full-load processing.
- Dedicated data quality validation scripts.
- Latest-snapshot reporting without historical tracking or Slowly Changing Dimensions (SCDs).

## Analytics

The Gold layer supports SQL-based analysis across three domains:

| Domain | Business Questions |
|---|---|
| Customer Behavior | Who are the customers, where are they located, and how do they purchase? |
| Product Performance | Which products and categories generate the most revenue and margin? |
| Sales Trends | How do sales change over time, and where are the growth opportunities? |

## Tech Stack

- **Database:** Microsoft SQL Server Express
- **Language:** T-SQL
- **Database Client:** SQL Server Management Studio (SSMS)
- **Data Modeling:** Draw.io
- **Version Control:** Git and GitHub

## Getting Started

### Prerequisites

- Microsoft SQL Server (Express edition is sufficient)
- SQL Server Management Studio (SSMS) or another compatible T-SQL client
- Git

### Installation

**1. Clone the repository**

```bash
git clone https://github.com/<your-username>/data-warehouse-project.git
cd data-warehouse-project
```

**2. Add the source datasets**

Place the ERP and CRM CSV files in the `datasets/` directory.

**3. Initialize the database**

Execute the database and schema setup scripts from `scripts/`.

**4. Build the data warehouse**

Run the scripts in the following order:

1. `scripts/bronze/` — Create Bronze tables and load raw data.
2. `scripts/silver/` — Clean and standardize the data.
3. `scripts/gold/` — Create the analytical views and star schema.

**5. Validate the data**

Execute the SQL validation scripts in `tests/`.

**6. Explore the Gold layer**

Run analytical queries against the Gold views to explore customer behavior, product performance, and sales trends.

> **Note:** Update the CSV file paths in the Bronze loading scripts to match your local environment before executing them.

## Repository Structure

```text
data-warehouse-project/
├── datasets/
│   └── ERP and CRM CSV files
├── docs/
│   ├── data_architecture.drawio
│   ├── etl.drawio
│   ├── data_flow.drawio
│   ├── data_models.drawio
│   ├── data_catalog.md
│   ├── naming-conventions.md
│   └── requirements.md
├── scripts/
│   ├── bronze/
│   ├── silver/
│   └── gold/
├── tests/
├── README.md
├── LICENSE
└── .gitignore
```

## Roadmap

- Implement incremental data loading.
- Introduce historical tracking using SCD Type 2.
- Automate pipeline orchestration and scheduling.
- Expand automated data quality testing.
- Integrate a BI dashboard for interactive reporting.

## License

This project is distributed under the MIT License. See the `LICENSE` file for details.

## Author

**[Niharika Singh]**

- [GitHub](https://github.com/<NiharikaSingh306>)
- [LinkedIn](https://linkedin.com/in/<your-profile>)

---

*Inspired by the SQL Data Warehouse project by Baraa Khatib Salkini (Data With Baraa).*

