# Exploring Crime Trends: An Analysis of IUCR Data (2001-Present)
![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/front_page.jpg)

## Introduction
This report is a meticulous examination of crimes cataloged under the **Illinois Uniform Crime Reporting (IUCR)** system, spanning from 2001 to the present day. The IUCR is a standardized method for classifying criminal offenses, offers a comprehensive framework for organizing and interpreting diverse criminal activities, providing invaluable insights into the evolving nature of crime over the years. Within this report, there are subsections derived from the main data that focus on child-related crimes, sex crimes, and homicides.    
The Structured query language(SQL) was used to understand the crime dynamics, thereby facilitating informed decision-making and targeted interventions.    
This project serves as a dynamic platform to elevate my SQL skills, allowing me to navigate the complexities of data analytics.    
**_click [here](https://github.com/temee0/Visualizing-IUCR-Crime-Data) to view the visualization of this report using PowerBI_**

## Analysis Toolkits
### Structured Query Language (MySQL):
- Database creation
- Table creation
- Dataset Importation
- Data cleaning
- Data exploration
- Data analysis

## Analysis and Questions
**_Note_** : _The SQL code for the project can be found above named **_Crimes_Analysis.sql_** or [here](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/Crimes_Analysis.sql)_   
## A. General Crimes     

 **(1) The total count of cases from 2001 till present.**
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/total_count_crime_iucr.jpg)

 **(2) The total count of cases grouped by year.**  
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/cases_by_year_1.jpg)    
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/cases_by%20_year_2.jpg)

 **(3) Number of cases by offense type.**   
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/cases_by_offense_1.jpg)    
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/cases_by_offense_2.jpg)

 **(4) Number of Cases with and without Arrests.**     
 
  **_Note:_** _True indicates cases where an arrest was made, while false indicates cases where no arrest was made._    
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/Arrest%20-%20Copy.jpg)    

 **(5) Total Arrest Counts and Percentage by Offense.**    
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/arrest_count_1.jpg)    
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/arrest_count_2.jpg)

 **(6) Total Counts and Percentage of Cases without Arrests by Offense.**     
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/non_arrest_1.jpg)   
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/non_arrest_2.jpg)

 **(7) Number of cases grouped by domestic and non-domestic.**      
 
 **_Note:_** _True indicates cases classified as domestic, while false indicates cases classified as non-domestic._   
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/Domestic%20-%20Copy.jpg)

 **(8) Frequency of Crimes in Top 20 Distinct Location descrptions.**      
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/top20_locations.jpg)

  **(9) Frequency of Crimes in Bottom 20 Distinct Location descrptions.**      
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/bottom%2020%20locations%20.jpg)

 ## B. Child Related Crimes     
 
 **(1) Total count of child related cases.**    
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/count_of_child_cases%20-%20Copy.jpg)
 
 **(2) The total count of cases grouped by year.**   
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/child_cases_by_year.jpg)     
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/child_cases_by_year_2.jpg)

 **(3) Number of cases by offense type.**  
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/child_cases_by_offense_1.jpg)     
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/child_cases_by_offense_2.jpg)

 **(4) Number of Cases with and without Arrests.**     
 
 **_Note:_** _True indicates cases where an arrest was made, while false indicates cases where no arrest was made._    
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/child_arrest%20-%20Copy.jpg)

 **(5) Total Arrest Counts and Percentage by Offense.**   
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/child_Arrest_count_1.jpg)    
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/child_Arrest_count_2.jpg)

 **(6) Total Counts and Percentage of Cases without Arrests by Offense.**    
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/child_non_arrest_1.jpg)    
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/child_non_arrest_2.jpg)     

 **(7) Number of cases grouped by domestic and non-domestic.**       
 
 **_Note:_** _True indicates cases classified as domestic, while false indicates cases classified as non-domestic._    
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/child_domestic%20-%20Copy.jpg)    

 **(8) Frequency of Crimes in Top 20 Distinct Location description.**    
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/child_top20_locations.jpg)

  **(9) Frequency of Crimes in Bottom 20 Distinct Location description.**    
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/child%20bottom%2020%20locations.jpg)

 ## C. Sex Crimes
 
 **(1) The total count of sex crimes from 2001 till present.**    
 
 ![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/count_of_sex_crimes%20-%20Copy.jpg)

**(2) The total count sex crimes grouped by year.**     

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/sex_cases_by%20_year_1.jpg)     
![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/sex_cases_by_year_2.jpg)

**(3) Number of cases by offense type.**    

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/sex_cases_by_offense%20-%20Copy.jpg)

**(4) Number of Cases with and without Arrests.**   

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/sex_arrest%20-%20Copy.jpg)

**(5) Total Arrest Counts and Percentage by Offense.**   

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/sex_arrest_count_1%20-%20Copy.jpg)

**(6) Total Counts and Percentage of Cases without Arrests by Offense.**    

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/sex_non_arrest%20-%20Copy.jpg)

**(7) Number of cases grouped by domestic and non-domestic.**   

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/sex_domestic%20-%20Copy.jpg)

**(8) Frequency of Crimes in Top 20 Distinct Location description.**    

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/sex_top20_locations.jpg)

**(9) Frequency of Crimes in Bottom 20 Distinct Location description.**    

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/sex%20bottom%2020%20locations.jpg)

## D. Homicides

**(1) The total count of Homicides from 2001 till present.**   

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/total_count_of_homicide.jpg)  

**(2) The total count Homicides grouped by year.**   

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/homicide_cases_by_year_1.jpg)      
![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/homicide_cases_by%20_year_2.jpg)

**(3) Number of cases by offense type.**   
![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/homicide_cases_by_offenses.jpg)

**(4) Number of Cases with and without Arrests.**   

 **_Note:_** _True indicates cases where an arrest was made, while false indicates cases where no arrest was made._   
![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/homicide_arrest%20-%20Copy.jpg)

**(5) Total Arrest Counts and Percentage by Offense.**     

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/homicide_arrest_count%20-%20Copy.jpg)

**(6) Total Counts and Percentage of Cases without Arrests by Offense.**   

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/homicide_non_arrest%20-%20Copy.jpg)

**(7) Number of homicide cases grouped by domestic and non-domestic.**    

**_Note:_** _True indicates cases classified as domestic, while false indicates cases classified as non-domestic._     
![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/homicide_domestic%20-%20Copy.jpg)

**(8) Frequency of Crimes in Top 20 Distinct Location description.**    

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/homicides_top20_locations.jpg)

**(9) Frequency of Crimes in Bottom 20 Distinct Location description.**    

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/homicides%20bottom%2020%20locations.jpg)

## Conclusion
This report functions as a magnifying lens, offering a detailed view of the dynamics of crime within the Illinois Uniform Crime Reporting (IUCR) system. Through thorough analysis, we have gained valuable knowledge regarding crime trends over the years, the efficacy of law enforcement under the IUCR framework, and the concerning rise in crime rates in recent years. For recommendations and suggestions on potential interventions, please refer to the PowerBI visualization of this report available [here](https://github.com/temee0/Visualizing-IUCR-Crime-Data).

----

![](https://github.com/temee0/Analyzing-crimes-under-IUCR-using-SQL/blob/main/thank_you.jpg)
#### Thank you for taking the time to read through this report.


