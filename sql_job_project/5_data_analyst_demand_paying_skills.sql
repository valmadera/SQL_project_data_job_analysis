/* What are the top skills based on salary for a Data Analyst?
- Average salary associated with each skill for Data Analyst positions.
- Include only the jobs with salaries, regardless of location.
- Why? It will allow me to understand how this skills impact at such level the salary of a data analyst. e.g. 
The skill is in high demand because there is a low offer of people who master it, however, if I choose this path
it could limit my possibilities of getting a job in a field that I enjoy.
*/

SELECT 
    company_dim.name,
    january_2023.job_title,
    january_2023.job_location,
    january_2023.job_work_from_home,
    january_2023.work_category,
    january_2023.salary_year_avg,
    CASE
        WHEN january_2023.salary_year_avg <= 60000 THEN 'Low'
        WHEN january_2023.salary_year_avg BETWEEN 60000 AND 100000 THEN 'STANDARD'
        ELSE 'High'
    END AS salary_category

FROM january_2023 
   LEFT JOIN company_dim
   ON january_2023.company_id = company_dim.company_id

WHERE salary_year_avg IS NOT NULL 
    AND job_title LIKE '%Data Analyst%'
    AND work_category = 'Remote'

ORDER BY salary_year_avg DESC