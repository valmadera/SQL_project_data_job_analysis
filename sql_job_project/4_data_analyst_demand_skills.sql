/* What are the most in-demand skills for a Data Analyst?
- Indentify the top 5 in-demand skills for a data analyst.
- All job posting, including NULL values. 
- Why? This will provide insights of the most requested skills for someone who is not a Data Engineer 
or Data Scientist. Only data analyst roles.
*/


SELECT
    skills,
    COUNT (skills) AS count_of_requested_skill
FROM
    job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_location = 'Anywhere' AND
    job_title LIKE '%Data Analyst%'
GROUP BY 
    skills
ORDER BY 
    count_of_requested_skill DESC
LIMIT
     5;


