create database work_life_balance;
USE work_life_balance;
SHOW TABLES;
DESCRIBE work_life_balance;
SELECT * FROM work_life_balance LIMIT 5;

#1 Does working more hours lead to shorter or longer lifespans?
SELECT 
    ROUND(AVG(avg_work_hours_per_day),2) AS avg_work_hours,
    ROUND(AVG(age_at_death),2) AS avg_lifespan
FROM work_life_balance
GROUP BY 
    CASE 
        WHEN avg_work_hours_per_day < 6 THEN 'Low Work'
        WHEN avg_work_hours_per_day BETWEEN 6 AND 9 THEN 'Moderate Work'
        ELSE 'High Work'
    END;



#2 What is the optimal amount of sleep for maximum longevity?
SELECT 
    ROUND(avg_sleep_hours_per_day,1) AS sleep_hours,
    ROUND(AVG(age_at_death),2) AS avg_lifespan
FROM work_life_balance
GROUP BY ROUND(avg_sleep_hours_per_day,1)
ORDER BY avg_lifespan DESC
LIMIT 5;



#3 How does exercise impact lifespan (controlled view)?

SELECT 
    ROUND(avg_exercise_hours_per_day,1) AS exercise_hours,
    ROUND(AVG(age_at_death),2) AS avg_lifespan
FROM work_life_balance
GROUP BY ROUND(avg_exercise_hours_per_day,1)
ORDER BY exercise_hours;


#4 Are there occupation-specific patterns in longevity?
SELECT 
    occupation_type,
    ROUND(AVG(age_at_death),2) AS avg_lifespan
FROM work_life_balance
GROUP BY occupation_type
ORDER BY avg_lifespan DESC;


#Q5 Do extreme outliers (24-hour work days) affect results?
SELECT 
    COUNT(*) AS extreme_workers,
    ROUND(AVG(age_at_death),2) AS avg_lifespan
FROM work_life_balance
WHERE avg_work_hours_per_day >= 20;


#Q6 Is there a gender gap in longevity?
SELECT 
    gender,
    ROUND(AVG(age_at_death),2) AS avg_lifespan
FROM work_life_balance
GROUP BY gender;

