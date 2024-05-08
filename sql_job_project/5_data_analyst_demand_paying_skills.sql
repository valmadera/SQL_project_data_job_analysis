/* What are the top skills based on salary for a remote  Data Analyst?
- Average salary associated with each skill for Data Analyst positions.
- Include only the jobs with salaries.
- Why? It will allow me to understand how this skills impact at such level the salary of a data analyst. e.g. 
The skill is in high demand because there is a low offer of people who master it, however, if I choose this path
it could limit my possibilities of getting a job in a field that I enjoy.*/

SELECT
    skills,
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
    avg_salary DESC
LIMIT
     5;