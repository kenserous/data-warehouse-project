# CITS3401 Data Warehousing Project

**Project 1: Building a Data Warehouse**

## Disclaimer
This project is an academic project, and as such should only be used as a guideline to understanding the project, or provide an understanding on data warehouses. **Copying any section of the project in any way risks academic misconduct** at the University of Western Australia. <br>
For commercial use please refer to the *LICENSE.md* file.

## Project Description
Project 1 involves designing and implementing a data warehouse using PostgreSQL, Python, and PowerBI.<br>
The project is based on fatal road crashes and fatalities in Australia as of December 2024.<br>
The full report on the project has been attached in the repository, under the file *CITS3401_Project_Report_Warehouse.pdf*.

## Project Structure
- *dataset*: raw dataset used for the project, both in Excel and CSV format
- *dim_tables*: all dimension and fact tables used for the project
- *notebooks*: all Jupyter notebook files used for the project
- *sql*: all SQL scripts used to build the warehouse, including the schemas, population of data, and business queries
- *visualization*: all visualizations related to the project, including PowerBI visualizations, query footprints, star nets and star schemas

## Tools Used
- **Python (Jupyter Notebook):** ETL, data cleaning, association rules mining
- **PostgreSQL:** data storage, analysis and query engine
- **PowerBI:** data visualisation

## Potential Tech Issues
Should you choose to attempt and run the code in your own machine, the file *populate_data.sql* may contain issues:
- The COPY commands in the SQL may need to use **absolute paths.** Relative paths may not work depending on your PostgreSQL configurations.
  Example:
  ```sql
  COPY dim_time FROM '/local/path/dim_tables/dim_time.csv' WITH (FORMAT csv, HEADER TRUE);```
Otherwise, the code should work as per normal.



 
