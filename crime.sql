use Project
go
--select * from chicago2

--What is the yearly crime trend from 2012 to 2017?
--SELECT YEAR(Date) AS Year, COUNT(ID) AS Crime_Count
--FROM chicago2
--GROUP BY YEAR(Date)
--ORDER BY Year;

--Which months have the highest crime rates overall?
--SELECT MONTH(Date) AS Month, COUNT(ID) AS Crime_Count
--FROM chicago2
--GROUP BY MONTH(Date)
--ORDER BY Crime_Count DESC;

--Question: What are the crime type trends from 2012 to 2017?
--SELECT YEAR(Date) AS Year, Primary_Type, COUNT(ID) AS Crime_Count
--FROM chicago2
--GROUP BY YEAR(Date), Primary_Type
--ORDER BY Year, Crime_Count asc;

--How has the number of arrests varied each year from 2012 to 2017?
--SELECT YEAR(Date) AS Year, COUNT(CASE WHEN Arrest = 'TRUE' THEN 1 END) AS Arrest_Count
--FROM chicago2
--GROUP BY YEAR(Date)
--ORDER BY Year;

--Question: What are the yearly trends for domestic-related crimes?
--SELECT YEAR(Date) AS Year, COUNT(CASE WHEN Domestic = 'TRUE' THEN 1 END) AS Domestic_Crimes
--FROM chicago2
--GROUP BY YEAR(Date)
--ORDER BY Year;

--Question: How has crime changed over time in each police district?
--SELECT YEAR(Date) AS Year, District, COUNT(ID) AS Crime_Count
--FROM chicago2
--GROUP BY YEAR(Date), District
--ORDER BY Year, District;

--Which community areas have seen a rise in crime over the years?
--SELECT YEAR(Date) AS Year, Community_Area, COUNT(ID) AS Crime_Count
--FROM chicago2
--GROUP BY YEAR(Date), Community_Area
--ORDER BY Year, Community_Area;

--How has the trend of theft crimes evolved over time?
--SELECT YEAR(Date) AS Year, COUNT(ID) AS Theft_Count
--FROM chicago2
--WHERE Primary_Type = 'THEFT'
--GROUP BY YEAR(Date)
--ORDER BY Year;

--Top Crime Locations Per Year
--SELECT YEAR(Date) AS Year, Location_Description, COUNT(ID) AS Crime_Count
--FROM chicago2
--GROUP BY YEAR(Date), Location_Description
--ORDER BY Year, Crime_Count DESC;

--Most Common Crime Type Per Year
--Identifying the most frequent crime type in each year can help understand the nature of crime over time.
--SELECT Year, Primary_Type, Crime_Count
--FROM (
--  SELECT YEAR(Date) AS Year, Primary_Type, COUNT(ID) AS Crime_Count,
--         ROW_NUMBER() OVER (PARTITION BY YEAR(Date) ORDER BY COUNT(ID) DESC) AS rn
--  FROM chicago2
--  GROUP BY YEAR(Date), Primary_Type
--) AS subquery
--WHERE rn = 1;

-- Crimes by Time of Day for Each Year
--Understanding the times of day when crimes are most frequent can inform crime prevention strategies.
--SELECT 
--    YEAR(Date) AS Year, 
--    DATEPART(HOUR, Date) AS Hour, 
--    COUNT(ID) AS Crime_Count
--FROM 
--    chicago2
--GROUP BY 
--    YEAR(Date), DATEPART(HOUR, Date)
--ORDER BY 
--    Year, Hour;

--Arrest Rate Per Year
--The arrest rate helps to understand how often crimes led to arrests in each year.
--SELECT YEAR(Date) AS Year, COUNT(CASE WHEN Arrest = 'TRUE' THEN 1 END) AS Arrest_Count, COUNT(ID) AS Total_Crimes,
--       (COUNT(CASE WHEN Arrest = 'TRUE' THEN 1 END) * 100.0 / COUNT(ID)) AS Arrest_Rate
--FROM chicago2
--GROUP BY YEAR(Date)
--ORDER BY Year;

--Top Crime Locations Per Year
--Examining where crimes took place in each year can help identify high-risk locations.
--SELECT YEAR(Date) AS Year, Location_Description, COUNT(ID) AS Crime_Count
--FROM chicago2
--GROUP BY YEAR(Date), Location_Description
--ORDER BY Year, Crime_Count DESC;

--Crime Trends in Specific Districts for Each Year
--District-level crime analysis can reveal which police districts experienced higher crime rates in specific years.
--SELECT YEAR(Date) AS Year, District, COUNT(ID) AS Crime_Count
--FROM chicago2
--GROUP BY YEAR(Date), District
--ORDER BY Year, Crime_Count DESC;

--YEAR ANALYSIS

--Crime Type Distribution by Year and Month (2012-2017)
--This query will show the monthly distribution of crime types in each year.
--SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, Primary_Type, COUNT(ID) AS Crime_Count
--FROM chicago2
--GROUP BY YEAR(Date), MONTH(Date), Primary_Type
--ORDER BY Year, Month, Crime_Count DESC;

--Arrest Rate by Year and Month (2012-2017)
--This query will show the number of arrests made each month in every year and calculate the arrest rate (percentage of crimes that led to arrests).
--SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, 
--       COUNT(CASE WHEN Arrest = 'TRUE' THEN 1 END) AS Arrest_Count, 
--       COUNT(ID) AS Total_Crimes,
--       (COUNT(CASE WHEN Arrest = 'TRUE' THEN 1 END) * 100.0 / COUNT(ID)) AS Arrest_Rate
--FROM chicago2
--GROUP BY YEAR(Date), MONTH(Date)
--ORDER BY Year, Month;

--Domestic Crime Trends by Year and Month (2012-2017)
--This query will show the monthly trends in domestic-related crimes for each year.
--SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, 
--       COUNT(CASE WHEN Domestic = 'TRUE' THEN 1 END) AS Domestic_Crime_Count
--FROM chicago2
--GROUP BY YEAR(Date), MONTH(Date)
--ORDER BY Year, Month;

--Top Crime Locations by Year and Month (2012-2017)
--This query will show the most frequent locations for crimes, broken down by month in each year.
--SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, Location_Description, COUNT(ID) AS Crime_Count
--FROM chicago2
--GROUP BY YEAR(Date), MONTH(Date), Location_Description
--ORDER BY Year, Month, Crime_Count DESC;

-- Most Common Crime Type by Year and Month (2012-2017)
--This query will identify the most frequent crime type for each month in each year.
--SELECT Year, Month, Primary_Type, Crime_Count
--FROM (
--  SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, Primary_Type, COUNT(ID) AS Crime_Count,
--         ROW_NUMBER() OVER (PARTITION BY YEAR(Date), MONTH(Date) ORDER BY COUNT(ID) DESC) AS rn
--  FROM chicago2
--  GROUP BY YEAR(Date), MONTH(Date), Primary_Type
--) AS subquery
--WHERE rn = 1
--ORDER BY Year, Month;






