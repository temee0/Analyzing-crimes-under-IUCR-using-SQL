create database Crime_Analysis;

use crime_analysis;

# Creating a table for crimes under the IUCR from 2001 till present
create table crimes_IUCR (
ID bigint,
Case_number varchar(50),
Date date,
Block varchar(150),
IUCR varchar(150),
Primary_type varchar(150),
Description varchar(150),
Location_Description varchar(150),
Arrest varchar(150),
Domestic varchar(150),
Beat int,
District int,
Ward int,
Community_Area varchar(150),
FBI_Code varchar(150),
Year year,
Updated_On Date
);

# Importing the data using MySQL 
 load data infile 'Crimes_-_2001_to_Present - Copy.csv' into table crimes_IUCR
 fields terminated by ','
 enclosed by '"'
 lines terminated by '\n'
 ignore 1 lines; 

# Changed the datatype of the ward column to allow data importation.
 alter table crimes_IUCR
 modify column ward varchar(50);
 
 # cleaning dataset and correcting errors (just 4 queries are shown here instead of 45 queries to reduce redundancy)
 update crimes_iucr
set primary_type = 'CRIMINAL SEXUAL ASSAULT'
Where primary_type = 'crim sexual assault';

update crimes_iucr
SET location_description = 'SCHOOL - PRIVATE BUILDING'
where location_description = 'SCHOOL, PRIVATE, BUILDING';

update crimes_iucr
set location_description = 'PARKING LOT / GARAGE (NON RESIDENTIAL)'
where location_description = 'PARKING LOT/GARAGE(NON.RESID.)';

update crimes_iucr
set location_description = 'GOVERNMENT BUILDING/PROPERTY'
where location_description = 'GOVERNMENT BUILDING / PROPERTY' OR location_description = 'GOVERNMENT BUILDING';

 # viewing the data after importation is complete
 select * from crimes_IUCR;
 

 # Below are the different analysis performed to explore our data and extract information and insights
 
 # (A) General Crimes
 
 # 1. The total count of cases from 2001 till present
 select count(distinct id) as 'Total count of cases'
 from crimes_IUCR;

# 2. The total count of cases grouped by year
select distinct year(date) as Year, count(distinct id) as 'Total number of cases'
from crimes_IUCR 
group by year(date)
order by year(date);

# 3. Number of cases by offense type
select distinct primary_type as offense, count(distinct id) as 'number of cases'
from crimes_IUCR
group by primary_type
order by count(distinct id) desc;

# 4. number of cases were arrest were made and not made 
select distinct arrest,
count(id) as 'Number of cases', 
round(count(id) * 100 / (select count(*) from crimes_iucr), 1) as percentage     #percentage of the total cases
from crimes_IUCR
group by arrest;       #note: true indicates where an arrest was made, while false means no arrest was made. 

# 5. Total arrest counts and percentage by offense 
select primary_type as offense,
count(case when arrest = 'true' then 1 else null end) as 'Arrest count',     
round(count(case when arrest = 'true' then 1 else null end) * 100 / count(*),2) as 'Arrest percentage'
from crimes_IUCR
group by primary_type
order by count(case when arrest = 'true' then 1 else null end) desc;

# 6. Total counts and percentage of cases without arrests by offense
select primary_type as offense,
count(case when arrest = 'false' then 1 else null end) as counts,
count(case when arrest = 'false' then 1 else null end) * 100 / count(*) as percentage
from crimes_IUCR
group by primary_type
order by count(case when arrest = 'false' then 1 else null end) desc;

# 7. Number of cases grouped by domestic and non-domestic 
select distinct domestic,
count(id) as 'Number of cases',
count(id) * 100 / (select count(*) from crimes_IUCR) as Percentage
from crimes_IUCR
group by domestic;        #note: true indicates cases classified as domestic, while false indicates cases classified as non_domestic.

# 8. how often crimes happen in distinct location description
select distinct location_description, count(distinct id) as 'number of cases', dense_rank() 
over 
(order by count(distinct id) desc) as ranks
from crimes_IUCR
group by location_description 
order by count(distinct id) desc;

# 9. Frequency of crimes in top 20 distinct location description.
select distinct location_description, count(distinct id) as 'number of cases', dense_rank() 
over 
(order by count(distinct id) desc) as ranks
from crimes_IUCR
group by location_description 
order by count(distinct id) desc
limit 20;

#(B) Crimes involving minors/children

#Creating a new table from the general dataset
create table Child_Related_Crimes as (
select *
from crimes_IUCR
where description like '%child%' or description like '%minor%' or location_description like '%school%');

# viewing the data after creating new table
 select * from Child_Related_Crimes;

#checking for rows in our new table that have "minor" in them but are not related to minors/children
select *
from Child_Related_Crimes
where description like '%minor injury%'
except
select *
from Child_Related_Crimes
where location_description like '%school%';

/**Removing rows that are not relative to child crimes but had "minor" in their description 
without tampering with rows with minor injury cases that are child related**/
delete from child_related_crimes
where description like '%minor injury%'
and id not in (
select id 
from (
select id
from child_related_crimes
where location_description like '%school%') as sub
);

# 1. Total count of child related cases
select distinct count(id) as 'number of child related crimes'
from child_related_crimes;

# 2. The total count of cases grouped by year
select distinct year(date) as Year, count(distinct id) as 'Total number of cases'
from child_related_crimes
group by year(date)
order by year(date);

# 3. Number of cases by offense type
select distinct primary_type as offense, count(distinct id) as 'number of cases'
from child_related_crimes
group by primary_type
order by count(distinct id) desc;

# 4. number of cases were arrest were made and not made 
select distinct arrest,
count(id) as 'Number of cases', 
round(count(id) * 100 / (select count(*) from child_related_crimes), 1) as percentage     #percentage of the total cases
from child_related_crimes
group by arrest;        #note: true indicates where an arrest was made, while false means no arrest was made. 

# 5. Total arrest counts and percentage by offense 
select primary_type as offense,
count(case when arrest = 'true' then 1 else null end) as 'Arrest count',     
round(count(case when arrest = 'true' then 1 else null end) * 100 / count(*),2) as 'Arrest percentage'
from child_related_crimes
group by primary_type
order by count(case when arrest = 'true' then 1 else null end) desc;

# 6. Total counts and percentage of cases without arrests by offense
select primary_type as offense,
count(case when arrest = 'false' then 1 else null end) as counts,
round(count(case when arrest = 'false' then 1 else null end) * 100 / count(*),2) as percentage
from child_related_crimes
group by primary_type
order by count(case when arrest = 'false' then 1 else null end) desc;

# 7. Number of cases grouped by domestic and non-domestic 
select distinct domestic,
count(id) as 'Number of cases',
round(count(id) * 100 / (select count(*) from child_related_crimes),2) as Percentage
from child_related_crimes
group by domestic;        #note: true indicates cases classified as domestic, while false indicates cases classified as non_domestic.

# 8. how often crimes happen in distinct location description
select distinct location_description, count(distinct id) as 'number of cases', dense_rank() 
over 
(order by count(distinct id) desc) as ranks
from child_related_crimes
group by location_description 
order by count(distinct id) desc;

# 9. Frequency of crimes in top 20 distinct location description.
select distinct location_description, count(distinct id) as 'number of cases', dense_rank() 
over 
(order by count(distinct id) desc) as ranks
from child_related_crimes
group by location_description 
order by count(distinct id) desc
limit 20;

# (C) Sex crimes 

#Creating a new table from the general dataset
create table Sex_Crimes as (
select *
from crimes_usa
where primary_type like '%sex%' or description like '%sex%' or Primary_type like '%prostitution%' or description like '%prostitution%');

# viewing the data after importation is complete
 select * from sex_crimes;
 
 # 1. The total count of sex crimes from 2001 till present
 select count(distinct id) as 'Total number of cases'
 from sex_crimes;

# 2. The total count sex crimes grouped by year
select distinct year(date) as Year, count(distinct id) as 'Total number of cases'
from sex_crimes
group by year(date)
order by year(date);

# 3. Number of cases by offense type
select distinct primary_type as offense, count(distinct id) as 'total number of cases'
from sex_crimes
group by primary_type
order by count(distinct id) desc;

# 4. number of cases were arrest were made and not made 
select distinct arrest,
count(id) as 'Number of cases', 
round(count(id) * 100 / (select count(*) from sex_crimes), 2) as percentage     #percentage of the total cases
from sex_crimes
group by arrest;        #note: true indicates where an arrest was made, while false means no arrest was made. 

# 5. Total arrest counts and percentage by offense  
select primary_type as offense,
count(case when arrest = 'true' then 1 else null end) as 'Arrest count',     
round(count(case when arrest = 'true' then 1 else null end) * 100 / count(*),2) as 'Arrest percentage'
from sex_crimes
group by primary_type
order by count(case when arrest = 'true' then 1 else null end) desc;

# 6. Total counts and percentage of cases without arrests by offense
select primary_type as offense,
count(case when arrest = 'false' then 1 else null end) as counts,
round(count(case when arrest = 'false' then 1 else null end) * 100 / count(*),2) as percentage
from sex_crimes
group by primary_type
order by count(case when arrest = 'false' then 1 else null end) desc;

# 7. Number of cases grouped by domestic and non-domestic 
select distinct domestic,
count(id) as 'Number of cases',
round(count(id) * 100 / (select count(*) from sex_crimes),2) as Percentage
from sex_crimes
group by domestic;       #note: true indicates cases classified as domestic, while false indicates cases classified as non_domestic.

# 8. how often does sex crimes happen in distinct location description
select distinct location_description, count(distinct id) as 'number of cases', dense_rank() 
over 
(order by count(distinct id) desc) as ranks
from sex_crimes
group by location_description 
order by count(distinct id) desc;

# 9. Frequency of crimes in top 20 distinct location description.
select distinct location_description, count(distinct id) as 'number of cases', dense_rank() 
over 
(order by count(distinct id) desc) as ranks
from sex_crimes
group by location_description 
order by count(distinct id) desc;

#Creating table from general table
create table Homicide as (
select * 
from crimes_usa
where primary_type like '%homicide%');

# viewing the data after importation is complete
 select * from homicide;
 
 # 1. The total count of Homicides from 2001 till present
 select count(distinct id) as 'Total number of cases'
 from homicide;

# 2. The total count Homicides grouped by year
select distinct year(date) as Year, count(distinct id) as 'Total number of cases'
from homicide
group by year(date)
order by year(date);

# 3. Number of cases by offense type
select distinct primary_type as offense, count(distinct id) as 'number of cases'
from homicide
group by primary_type
order by count(distinct id) desc;

# 4. number of cases with and without arrest
select distinct arrest,
count(id) as 'Number of cases', 
round(count(id) * 100 / (select count(*) from homicide), 1) as percentage     #percentage of the total cases
from homicide
group by arrest;        #note: true indicates where an arrest was made, while false means no arrest was made. 

# 5. Total arrest counts and percentage by offense 
select primary_type as offense,
count(case when arrest = 'true' then 1 else null end) as 'Arrest count',     
round(count(case when arrest = 'true' then 1 else null end) * 100 / count(*),2) as 'Arrest percentage'
from homicide
group by primary_type
order by count(case when arrest = 'true' then 1 else null end) desc;

# 6. Total counts and percentage of cases without arrests by offense
select primary_type as offense,
count(case when arrest = 'false' then 1 else null end) as counts,
round(count(case when arrest = 'false' then 1 else null end) * 100 / count(*),2) as percentage
from homicide
group by primary_type
order by count(case when arrest = 'false' then 1 else null end) desc;

# 7. Number of homicide cases grouped by domestic and non-domestic 
select distinct domestic,
round(count(id) * 100 / (select count(*) from homicide),2) as Percentage
from homicide
group by domestic;        #note: true indicates cases classified as domestic, while false indicates cases classified as non_domestic.

# 8. how often do hoicides happen in distinct location description
select distinct location_description, count(distinct id) as 'number of cases', dense_rank() 
over 
(order by count(distinct id) desc) as ranks
from homicide
group by location_description 
order by count(distinct id) desc;

# 9. Frequency of crimes in top 20 distinct location description.
select distinct location_description, count(distinct id) as 'number of cases', dense_rank() 
over 
(order by count(distinct id) desc) as ranks
from homicide
group by location_description 
order by count(distinct id) desc
limit 20;


select * from crimes_iucr;
select * from sex_crimes;
select * from homicide;
select * from child_related_crimes;
