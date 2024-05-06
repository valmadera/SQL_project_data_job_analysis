/* What are the top-paying remote jobs?
- Only include jobs with salaries.
- Identifing the top 10 hihgest paying jobs available anywhere(remotely).
- Identify the companies that offer this jobs.
- Identify the platforms where I can apply for these roles.
- Why? This will provide insights about roles I can apply aiming to get the highest payment. Also
I will be able to see the companies that offer the best salaries and where I can apply to get the
job.*/

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