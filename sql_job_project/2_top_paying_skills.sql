/* What are the top skills for any remote job in Data Analysis?
- Select the top 5 in-demand skills and their asociate estimated average salary.
- Why? This will provide with a list of skills that I can learn, aiming to increase my possibilities 
of getting a job position.*/

-- CTE
WITH job_skills AS (
    SELECT 
        job_postings_fact.job_id,
        job_title,
        skills,
        salary_year_avg
    FROM
        job_postings_fact 
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        salary_year_avg IS NOT NULL AND
        job_location = 'Anywhere'
    ORDER BY 
        salary_year_avg DESC
    )

--Query
SELECT
    skills,
    COUNT (skills) AS count_of_requested_skill,
    ROUND (AVG (salary_year_avg),0) AS avg_salary
FROM
    job_skills
GROUP BY 
    skills
ORDER BY 
    count_of_requested_skill DESC
LIMIT
     5;


