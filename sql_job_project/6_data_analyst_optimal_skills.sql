/*What are the most optimal skills to learn (High demand & high paying)?
- Identify skills is high demand but also with a high average salary for Data Analyst.
- This will include only remote position with not NULL salaries.
- Why? By knowing what skills are in high demand and well paid I could prioritize the skills to learn first.*/

SELECT
    skills,
    COUNT (skills) AS number_of_request,
    ROUND (AVG (salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere' AND
    job_title LIKE '%Data Analyst%' 
GROUP BY 
    skills
ORDER BY 
    number_of_request DESC
LIMIT
     5;