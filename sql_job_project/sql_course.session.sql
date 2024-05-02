-- january
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
    
