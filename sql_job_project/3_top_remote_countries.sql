/* Where (Countries) are the top-paying jobs for Data Analyst?
- Only include jobs with salaries.
- Identifing the top 10 countries with the hihgest average paying jobs available remotely.
- Why? This will determine which sites located in which countries I would have better chances
to find better payment when working remotely.
*/

SELECT 
    job_country,
    COUNT (job_country) AS number_of_jobs,
    ROUND(AVG(salary_year_avg),0) AS average_salary
FROM
    job_postings_fact 
    INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere' AND
    job_country IS NOT NULL
GROUP BY
    job_country
HAVING
    COUNT (job_country) > 4
ORDER BY
    average_salary DESC,
    number_of_jobs
LIMIT 10;
    

