-- IMPORTANT
/*UPDATE job_postings_fact
SET salary_year_avg = 65000
WHERE 
    job_id = 226942 AND
    salary_year_avg = 650000*/

/* What are the top-paying jobs?
- Only include jobs with salaries.
- Identifing the top 10 hihgest paying jobs available remotely.
- Identify the companies that offer this jobs.
- Identify the platforms where I can apply for these roles.
- Why? This will provide insights about roles I can apply aiming to get the highest payment. Also
I will be able to see the companies that offer the best salaries and where I can apply to get the
job.
*/

WITH job_application AS (
    SELECT *
    FROM
        job_postings_fact 
        INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        salary_year_avg IS NOT NULL
    )

SELECT
    job_title,
    name,
    job_country,
    salary_year_avg,
    job_via

FROM
    job_application

WHERE
    job_location = 'Anywhere' 

ORDER BY salary_year_avg DESC

LIMIT 10;