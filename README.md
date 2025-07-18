# SQL-KMS-Case-Study--DSA-project
This contains a detailed step-by-step analysis using SQL, a project organized by Digital Skill-Up Africa.  
Throughout the three-month program, I have learnt a lot on the use of SQL to perform various analytical 
and visualization operations on datasets. I also learnt about portfolio building to showcase the project worked upon.

## Project Topic: Kulta Mega Stores Inventory Analysis

### Project Overview
This is an analysis of the order data between 2009 and 2012 of Kulta Mega Stores. Kultra Mega Stores (KMS), 
headquartered in Lagos, specialises in office supplies and furniture. Its customer base includes individual consumers, 
small businesses (retail), and large corporate clients (wholesale) across Lagos, Nigeria.

### Data Source
The primary data source used for this analysis was KMS sql case study.csv. This was sent by the DSA team to be used in completing 
the project to be submitted. It was uploaded to the Canvas site of each student and made available for download.

### Dataset Summary
- Total records: 8399
- Total Columns: 21
- Key fields: Order priority, Product Name, Product Category, Unit price, Order quantity, Ship mode, Customer segment, Sales

### Tools Used
- Microsoft Excel for Data Cleaning [Download Here](https://www.microsoft.com), version 1808 was used used for data cleaning, which involved data manipulation.
- SQL Server Management Studio 20  [Download Here](https://www.microsoft.com/en-us/sql-server/sql-server-downloads?msockid=0e2eb74be29567e13adfa24ce38566b1),
  version 20 was used for data querying.

### Data Cleaning and Preparation
In the initial phase of the Data cleaning and preparation, the following actions were performed:

  1. Data loading and inspection.
  2. Missing variables in the data was identified and handled.
  3. Data was cleaned and formatted.

### Data Query and Key Questions Answered
SQL queries were used to answer some key questions pertaining to the order between 2009 and 2012. These questions include:
  1. Which product category had the highest sales?
  2. What are the Top 3 and Bottom 3 regions in terms of sales?
  3. What were the total sales of appliances in Ontario?
  4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
  5. KMS incurred the most shipping cost using which shipping method?
  6. Who are the most valuable customers, and what products or services do they typically purchase?
  7. Which small business customer had the highest sales?
  8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
  9. Which consumer customer was the most profitable one?
  10. Which customer returned items, and what segment do they belong to?
  11. If the delivery truck is the most economical but the slowest shipping method and Express Air is
      the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer

### Key insights
There were 14 questions that needed to be answered in the excel project. These were answered through 
the creation of calculated columns for some and the use of pivot tables.

From the above, some key insights generated include:
  1. The product category with the highest sales was Technology. This showed a steady customer demand for the products.
  2. The Top 3 regions showed the highest total sales within the four-year period, while the Bottom 3 regions recorded the
     lowest in terms of sales. This shows the need to ensure that sales is increased in other regions.
  3. Total sales of appliances in Ontario: The sales in this region was moderate and it can be improved through focused promotions and advertisements.
  4. Bottom 10 customers by Sales: My advise My advise to the management of KMS to increase the revenue from the bottom 10 customers is that they should reduce shipping
     cost as their order is not high relative to their shipping cost, they should also reduce the unit price of the goods being sold in these customer segments.
     They could also target these customers to encourage their purchase through onboarding campaigns and other taiored offers.
  5. Shipping method with the most shipping cost was Delivery truck. This ship mode should be used for only goods
     that are bulky and those with low order priority to ensure cost effectiveness.
  6. The most valuable customers should be encouraged to continue purchasing from the organization. In order to retain them,
     incentives and other promotional offers should be put in place and the products or services do they typically purchase should not be allowed to go out of stock.
  7. Small business customer that had the highest sales was identified. This shows that there should be dedicated relationship management.
  8. The Corporate Customer that placed the most number of orders in 2009 – 2012 should be encouraged to continue purchase. This can be through special discounts.
  9. The most profitable consumer customer should be targeted and given exclusive deals to encourage increase in purchase.
  10. Customers returned items mostly from the corporate segment. The resons for item being returned should be looked into for all the
      segments and resolved to reduce loss and meet customers' expectations.
  11. Shipping cost alignment with order priority: The company did not appropriately spend shipping cost based on order priority.
      This is because express air, which should be for citical order priority, requiring urgency, was used for low order priority in
      some cases and Delivery truck is also used for critical order priority in some cases. This shows a disalignment between order priority,
      the ship mode and even the order count.

  - **Recommendation**: Policies should be enforced so that the shipping method used aligns with the order priority and the order quantity.

### Project Files
  - DSA Data Analysis Capstone Project.sql:  This contains all the SQL queries used
  - Readme.md- Contains a summarry report of key findings

### Contributor
Deborah Shonubi

Data Analyst in Training




