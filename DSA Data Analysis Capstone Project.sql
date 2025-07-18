 Create database capstone_project

Use Capstone_Project
 
--Case Sceneario I
Select * from [dbo].[KMS Sql Case Study]

--1. Which product category had the highest sales? 
Select Product_Category, Sales from [dbo].[KMS Sql Case Study]
 where Sales = (select MAX(sales) from [dbo].[KMS Sql Case Study])
 
--2. What are the Top 3 and Bottom 3 regions in terms of sales?
Select top 3 Region, SUM(Sales) as totalsales from [dbo].[KMS Sql Case Study]
 GROUP BY Region 
 ORDER BY totalsales DESC

Select top 3 Region, SUM(Sales) as totalsales from [dbo].[KMS Sql Case Study]
 GROUP BY Region 
 ORDER BY totalsales ASC

--3. What were the total sales of appliances in Ontario?
Select SUM(sales) as totalSales
 from  [dbo].[KMS Sql Case Study]
 where [Region] = 'Ontario'
 AND Product_Sub_Category = 'Appliances'

--4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers.
 Select Top 10 * from [dbo].[KMS Sql Case Study]
 ORDER BY Sales ASC

 Select Top 10 * from [dbo].[KMS Sql Case Study]
 ORDER BY Sales DESC
 
 -- I will advise KMS to reduce shipping cost for the bottom 10 customers as their order is not high relative to their shipping cost 
 -- incurred in comparism to the top 10 customers. I will also advise KMS to increase advertisement to attract those customers.
 -- Unit Price can also be considered or reduced to increase order quantity of the bottom customers

--5. KMS incurred the most shipping cost using which shipping method?
--Select Max(Shipping_Cost), Ship_Mode from [dbo].[KMS Sql Case Study]
--GROUP BY Ship_Mode

Select [shipping_cost], [Ship_Mode] from [dbo].[KMS Sql Case Study]
where shipping_Cost = (Select Max(Shipping_Cost) as Max_Shipping_Cost from [dbo].[KMS Sql Case Study])

--Case Scenario II

--6. Who are the most valuable customers, and what products or services do they typically purchase?
Select * from [dbo].[KMS Sql Case Study]
 SELECT Top 5 Profit, Product_Name, Customer_Name 
 FROM [dbo].[KMS Sql Case Study]
 ORDER BY Profit DESC

--7. Which small business customer had the highest sales?
 
 SELECT TOP 1 Customer_Name, SUM(Sales) AS Total_Sales
 from [dbo].[KMS Sql Case Study]
 WHERE Customer_Segment ='Small Business'
 GROUP BY Customer_Name
 ORDER BY Total_Sales DESC

 --8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
 SELECT Top 1 Customer_Name, COUNT (Order_ID) AS Order_Count
 FROM [dbo].[KMS Sql Case Study]
 WHERE Customer_Segment = 'Corporate'
 GROUP BY Customer_Name
 ORDER BY Order_Count DESC

--9. Which consumer customer was the most profitable one?
 SELECT TOP 1 Customer_Name, SUM(Profit) AS Total_Profit
 FROM [dbo].[KMS Sql Case Study]
 WHERE Customer_Segment = 'Consumer'
 GROUP BY Customer_Name
 ORDER BY Total_Profit DESC

--10. Which customer returned items, and what segment do they belong to?
   SELECT DISTINCT Customer_Name, Customer_Segment [Status]
   FROM [dbo].[KMS Sql Case Study]
   JOIN [dbo].[Order_Status]
   ON [dbo].[KMS Sql Case Study].Order_ID = [dbo].[Order_Status].[Order_ID]


 --11. If the delivery truck is the most economical but the slowest shipping method and 
 -- Express Air is the fastest but the most expensive one, do you think the company 
 -- appropriately spent shipping costs based on the Order Priority? Explain your answer
  -- appropriately spent shipping costs based on the Order Priority? Explain your answer

 SELECT Order_Priority, Ship_Mode, 
 COUNT([Order_ID]) AS [Order Count],
 ROUND(SUM(Sales - Profit),2) AS [Estimated Shipping Cost],
 AVG(DATEDIFF(DAY, [Order_Date], [Ship_Date])) AS [AVG Ship Date]
 FROM [dbo].[KMS Sql Case Study]
 GROUP BY Order_Priority, Ship_Mode
 ORDER BY Order_Priority, Ship_Mode DESC








