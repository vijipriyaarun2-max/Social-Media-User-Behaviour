CREATE DATABASE social_media_db;  
USE social_media_db;


CREATE TABLE social_media_user_behavior (
    user_id VARCHAR(50) PRIMARY KEY,
    age INT,
    age_group VARCHAR(20),
    gender VARCHAR(20),
    country VARCHAR(50),
    occupation VARCHAR(50),
    education_level VARCHAR(50),
    income_bracket VARCHAR(30),
    relationship_status VARCHAR(30),
    primary_platform VARCHAR(50),
    num_platforms_used INT,
    daily_screen_time_minutes INT,
    weekly_sessions INT,
    avg_session_duration_minutes DOUBLE,
    preferred_content_type VARCHAR(50),
    primary_device VARCHAR(50),
    usage_purpose VARCHAR(100),
    posts_per_week INT,
    likes_per_day INT,
    comments_per_day INT,
    shares_per_week INT,
    followers_count INT,
    following_count INT
);

USE social_media_db;
SELECT * FROM social_media_user_behavior;
SHOW TABLES;

DESCRIBE social_media_user_behavior;
SELECT * FROM social_media_user_behavior;

SELECT COUNT(*) 
FROM social_media_user_behavior;


-- . Identify the most used social media platform based on the number of users, in descending order
SELECT primary_platform, COUNT(*) AS users 
FROM social_media_user_behavior 
GROUP BY primary_platform 
ORDER BY users DESC;

-- Find which age group spends the highest average screen timein descending order

SELECT age_group, AVG(daily_screen_time_minutes) AS avg_screen_time
FROM social_media_user_behavior
GROUP BY age_group
ORDER BY avg_screen_time DESC;

-- Find the favourite platform for each gender in descending ORDER

SELECT gender, primary_platform, COUNT(*) AS count
FROM social_media_user_behavior
GROUP BY gender, primary_platform
ORDER BY gender, count DESC;

-- Check whether higher income users spend more screen time
SELECT income_bracket, AVG(daily_screen_time_minutes) AS avg_time
FROM social_media_user_behavior
GROUP BY income_bracket;

-- . Retrieve the users who spend more than 200 minutes daily (addicted users)
Use social_media_db;
SELECT user_id, age, country, primary_platform, daily_screen_time_minutes
FROM social_media_user_behavior
WHERE daily_screen_time_minutes > 200
ORDER BY daily_screen_time_minutes DESC;


SELECT occupation, AVG(num_platforms_used) AS avg_platforms
FROM social_media_user_behavior
GROUP BY occupation
ORDER BY avg_platforms DESC;


SELECT primary_platform, COUNT(*) AS total 
FROM social_media_user_behavior 
GROUP BY primary_platform;

USE social_media_db;
CREATE TABLE country_details (
    country VARCHAR(50) PRIMARY KEY,
    continent VARCHAR(30),
    avg_internet_speed VARCHAR(20)
);

DESCRIBE social_media_user_behavior;
USE social_media_db;

 
INSERT INTO country_details VALUES
('Philippines', 'Asia', 'High'),
('United Kingdom', 'Europe', 'Very High'),
('UAE', 'Asia', 'Very High'),
('Saudi Arabia', 'Asia', 'High'),
('Poland', 'Europe', 'High'),
('Mexico', 'North America', 'Medium'),
('India', 'Asia', 'Medium'),
('France', 'Europe', 'Very High'),
('United States', 'North America', 'Very High'),
('Egypt', 'Africa', 'Low');

SELECT * FROM country_details;

SELECT u.user_id, u.country, u.primary_platform, c.continent
FROM social_media_user_behavior u
INNER JOIN country_details c 
ON u.country = c.country;


SELECT u.user_id, u.country, u.primary_platform, c.continent
FROM social_media_user_behavior u
LEFT JOIN country_details c 
ON u.country = c.country;


SELECT u.user_id, u.country, u.primary_platform, c.continent
FROM social_media_user_behavior u
RIGHT JOIN country_details c
 ON u.country = c.country;
 
 
 ALTER TABLE social_media_user_behavior
MODIFY country VARCHAR(50);

ALTER TABLE social_media_user_behavior
ADD CONSTRAINT fk_country
FOREIGN KEY (country)
REFERENCES country_details(country);
