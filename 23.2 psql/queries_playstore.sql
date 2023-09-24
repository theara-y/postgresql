-- Comments in SQL Start with dash-dash --
-- 1
SELECT app_name FROM analytics WHERE id = 1880;

-- 2
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';

-- 3
SELECT category, COUNT(*) FROM analytics GROUP BY category;

-- 4
SELECT app_name, reviews FROM analytics ORDER BY reviews desc LIMIT 5;

-- 5
SELECT app_name, rating, reviews FROM analytics WHERE rating >= 4.8 ORDER BY reviews desc LIMIT 1;

-- 6
SELECT category, AVG(rating) AS avg_rating FROM analytics GROUP BY category ORDER BY avg_rating desc;

-- 7
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price desc LIMIT 1;

-- 8
SELECT app_name, rating, min_installs FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating desc;

-- 9
SELECT app_name, rating, reviews FROM analytics WHERE rating < 3 AND reviews >= 10000;

-- 10
SELECT app_name, reviews, price FROM analytics WHERE price BETWEEN 0.1 AND 1 ORDER BY reviews desc LIMIT 10;

-- 11
SELECT app_name, last_updated FROM analytics WHERE last_updated = (
    SELECT MIN(last_updated) FROM analytics
);

-- 12
SELECT app_name, price FROM analytics WHERE price = (
    SELECT MAX(price) FROM analytics
);

-- 13
SELECT SUM(reviews) FROM analytics;

-- 14
SELECT category, COUNT(*) FROM analytics GROUP BY category HAVING COUNT(*) > 300;

-- 15
SELECT app_name, reviews, min_installs, min_installs/reviews as proportion FROM analytics WHERE min_installs >= 100000 ORDER BY proportion desc LIMIT 1;

-- FS1
SELECT app_name, rating, category FROM analytics WHERE (category, rating) IN (
SELECT category, MAX(rating) FROM analytics WHERE min_installs >= 50000 GROUP BY category
) ORDER BY category;

-- FS2
SELECT app_name FROM analytics WHERE app_name ILIKE '%facebook%';

-- FS3
SELECT app_name, genres FROM analytics WHERE array_length(genres, 1) > 1;

-- FS4
SELECT app_name, genres FROM analytics WHERE array_to_string(genres,',') ILIKE '%education%';