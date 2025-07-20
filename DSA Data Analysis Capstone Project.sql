 Create database capstone_project

Use Capstone_Project
 
--Case Sceneario I

Select * from [dbo].[KMS Sql Case Study]

--1. Which product category had the highest sales? 

Select Product_Category, Sales from [dbo].[KMS Sql Case Study]
 where Sales = (select MAX(sales) from [dbo].[KMS Sql Case Study])

 --Answer: Technology - 89061.046875
 
--2. What are the Top 3 and Bottom 3 regions in terms of sales?
-- Top Regions

Select top 3 Region, SUM(Sales) as totalsales from [dbo].[KMS Sql Case Study]
 GROUP BY Region 
 ORDER BY totalsales DESC
 
 --Answer     
--   Region            TotalSales
--i.  West	          3597549.269871
--ii. Ontario	      3063212.47638369
--iii. Prarie	      2837304.60503292

-- Bottom Regions

Select top 3 Region, SUM(Sales) as totalsales from [dbo].[KMS Sql Case Study]
 GROUP BY Region 
 ORDER BY totalsales ASC

--Answer: 
--i. Nunavut	              116376.48383522
--ii. Northwest Territories	  800847.330903053
--iii. Yukon	              975867.375723362

--3. What were the total sales of appliances in Ontario?

Select SUM(sales) as totalSales
 from  [dbo].[KMS Sql Case Study]
 where [Region] = 'Ontario'
 AND Product_Sub_Category = 'Appliances'

 --Answer: 20,2346.839630127 

--4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers.
 
 Select Top 10 * from [dbo].[KMS Sql Case Study]
 ORDER BY Sales ASC

 Select Top 10 * from [dbo].[KMS Sql Case Study]
 ORDER BY Sales DESC
 
 -- I will advise KMS to reduce shipping cost for the bottom 10 customers as their order is not high relative to their shipping cost 
 -- incurred in comparism to the top 10 customers. I will also advise KMS to increase advertisement to attract those customers.
 -- Unit Price can also be considered or reduced to increase order quantity of the bottom customers.

--5. KMS incurred the most shipping cost using which shipping method?

--Select Max(Shipping_Cost), Ship_Mode from [dbo].[KMS Sql Case Study]
--GROUP BY Ship_Mode

 Select [shipping_cost], [Ship_Mode] from [dbo].[KMS Sql Case Study]
 where shipping_Cost = (Select Max(Shipping_Cost) as Max_Shipping_Cost from [dbo].[KMS Sql Case Study])

--Answer: 164.73(Ship Cost),   Delivery Truck (Ship Mode)

--Case Scenario II

--6. Who are the most valuable customers, and what products or services do they typically purchase?

Select * from [dbo].[KMS Sql Case Study]
 
 SELECT Top 5 Profit, Product_Name, Customer_Name 
 FROM [dbo].[KMS Sql Case Study]
 ORDER BY Profit DESC

 --Answer: 
 --Profit           Product_Name                                                     Customer_Name
--27220.69	  Polycom ViewStation™ ISDN Videoconferencing Unit	                     Emily Phan
--14440.39	  Polycom ViaVideo™ Desktop Video Communications Unit	                 Andy Reiter
--13340.26	  Hewlett Packard LaserJet 3310 Copier	                                 Deborah Brumfield
--12748.86	  Canon Image Class D660 Copier	                                          Karen Carlisle
--12606.81	  Hewlett-Packard Business Color Inkjet 3000 [N, DTN] Series Printers     Rick Wilson

--7. Which small business customer had the highest sales?
 
 SELECT TOP 1 Customer_Name, SUM(Sales) AS Total_Sales
 from [dbo].[KMS Sql Case Study]
 WHERE Customer_Segment ='Small Business'
 GROUP BY Customer_Name
 ORDER BY Total_Sales DESC

 --Answer: Dennis Kane (Customer_Name)	75967.5932159424 (Total Sales)

 --8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
 
 SELECT Top 1 Customer_Name, COUNT (Order_ID) AS Order_Count
 FROM [dbo].[KMS Sql Case Study]
 WHERE Customer_Segment = 'Corporate'
 GROUP BY Customer_Name
 ORDER BY Order_Count DESC

 -- Answer: Adam Hart (Customer_Name)	27 (Order_Count)

--9. Which consumer customer was the most profitable one?
 
 SELECT TOP 1 Customer_Name, SUM(Profit) AS Total_Profit
 FROM [dbo].[KMS Sql Case Study]
 WHERE Customer_Segment = 'Consumer'
 GROUP BY Customer_Name
 ORDER BY Total_Profit DESC

 --Answer: Emily Phan (Customer_Name)	34005.44 (Total_Profit)

--10. Which customer returned items, and what segment do they belong to?

----- Imported CSV file (Order Status)

Select * from Order_Status
Select * from [dbo].[KMS Sql Case Study]
   
   SELECT DISTINCT Customer_Name, Customer_Segment [Status]
   FROM [dbo].[KMS Sql Case Study]
   JOIN [dbo].[Order_Status]
   ON [dbo].[KMS Sql Case Study].Order_ID = [dbo].[Order_Status].[Order_ID]

 --Answer: A count of 419 customers returned items across the various Customer Segments.
  
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

 --Answer:
--    Order_Priority     Ship_Mode          Order_Count    Estimated Shipping Cost   AVG Ship Date
-- a. Critical	         Regular Air	    1180	       1122603.29	               1
-- b. Critical	         Express Air	    200	           198005.4	                   1
-- c. Critical	         Delivery Truck	    228	           1221313.12	               1
-- d. High	             Regular Air	    1308	       1315653.55	               1
-- e. High	             Express Air	    212	           206125.18	               1
-- f. High	             Delivery Truck	    248	           1338507.98	               1
-- g. Low	             Regular Air	    1280	       1372177.2	               4
-- h. Low	             Express Air	    190	           191312.13	               4
-- i. Low	             Delivery Truck	    250	           1332956.14	               3
-- j. Medium	         Regular Air	    1225	       1311249.52	               1
-- k. Medium	         Express Air	    201	           247151.91	               1
-- l. Medium	         Delivery Truck	    205	           976998.95	               1
-- m. Not Specified	     Regular Air	    1277	       1279926.85	               1
-- n. Not Specified	     Express Air	    180	           194393.97	               1
-- o. Not Specified	     Delivery Truck	    215	           1085457.66	               1

-- Explanation: Shipping cost alignment with order priority: The company did not appropriately spend shipping 
-- cost based on order priority. This is because express air, which should be for citical order priority, requiring urgency, was used for 
-- low order priority in some cases and Delivery truck is also used for critical order priority in some cases. 
-- This shows a disalignment between order priority, the ship mode and even the order count.






