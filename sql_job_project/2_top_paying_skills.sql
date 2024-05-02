/* What are the top-paying skills?
- Select the skills for the previous top 10 jobs.
- Add the specific skills required for these jobs.
- Why? This will provide with a list of skills that I can learn, with the aim of increasing
my possibilities of getting the job possition. 
*/

SELECT
    skills,
    COUNT (skills) AS count_of_requested_skill,
    ROUND (AVG (salary_year_avg),0) AS avg_salary

FROM
    job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    salary_year_avg IS NOT NULL

GROUP BY skills

ORDER BY count_of_requested_skill DESC

LIMIT 5;
