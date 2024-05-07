# Introduction
Dive into the data job market on data analyst roles, this project explores top-paying jobs, in-demand skills, and where high demand meets high salary in data analytics.

SQL queries? Check them out here: [sql_job_project folder](/sql_job_project/)
# Background
Driven by a quest to navigate the data analyst job mmarket more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs. 

Data hails from my [SQL Course](https://lukebarousse.com/sql). It is packed with insights on job titles, salaries, locations, and essential skills.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying remote jobs?
2. What are the top skills for any remote job in Data Analysis?
3. Where (Countries) are the top-paying jobs for any job in Data Analysis? What are their demand?
4. What are the most in-demand skills for a Data Analyst?
5. What are the top skills based on salary for a Data Analyst?
6. What are the most optimal skills to learn (High demand & high paying)?

# Tools I Used
- **SQL ->** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgresSQL ->** The chosen database management system, ideal for handling the job post data.
- **Visual Studio Code ->** My go-to for database management and executing SQL queries.
- **Git & Github ->** Essential for version control and sharing my SQL script and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here is how I approached each question:

### 1. What are the top-paying remote jobs?
To identify the highest-paying roles I filteres data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql 
SELECT
    job_title,
    name,
    job_country,
    salary_year_avg,
    job_via
FROM
    job_postings_fact 
    INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 
    10;
```

Here is the breakdown of the top data analyst jobs in 2023:

- **Wide Salary Range:** Top 10 paying data analyst roles span from $184,000 to $650,000 indicating significant salary potential in the field.
- **Diverse employers:** Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a broad interest across different industries.
- **Wide Salary Range:** There is a high diversity in job title, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

![Top Paying Remote Roles](graphs\query_1.jpg)
*This graph was built in Excel with the data results from my query*

### 2. What are the top skills for any remote job in Data Analysis?

### 3. Where (Countries) are the top-paying jobs for any job in Data Analysis? What are their demand?

|Country       |Demand Count|  Avg. Salary ($)|
|--------------|------------|-----------------|
|Brazil	       |9	        |  182,931        |
|Argentina	   |7	        |  156,643        | 
|Colombia	   |10	        |  154,275        |
|Sudan	       |393	        |  143,543        |
|Canada	       |67	        |  138,656        |
|United States |2653	    |  131,604        |  
|France        |6	        |  121,750        |
|Mexico	       |8	        |  110,313        |
|Australia	   |7	        |  85,357         |
|India	       |7	        |  84,571         |

![Top Average Salaries By Countries](graphs\query_3.jpg)
*This graph was built in Excel, it takes into account all roles for Data Analysts*

### 4. What are the most in-demand skills for a Data Analyst?

### 5. What are the top skills based on salary for a Data Analyst?

### 6. What are the most optimal skills to learn (High demand & high paying)?

# What I Learned



# Conclusions
