/*Find the 5 oldest users of the instagram from the database provided*/
select * 
from users
order by created_at asc
limit 5;

/* Find the users who have never posted a single photo on instagram*/
SELECT users.id, username
FROM users
LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.id IS NULL;

/* Total users who have never posted a single photo on instagram */
SELECT COUNT(users.id)
FROM users
LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.id IS NULL;

/* Identify the winner of the contest and provide their details to the team */
SELECT username,photos.id,photos.image_url,
count(*) AS winning_score FROM photos
inner JOIN likes ON likes.photo_id = photos.id 
inner join users on photos.user_id= users.id
group by photos.id
order by winning_score desc
limit 1;

/* identify and suggest the top 5 most commonly used hashtags on the platform */

SELECT tag_id, tag_name, COUNT(*) AS Count_Tags
FROM photo_tags
join tags on photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY Count_Tags DESC
LIMIT 5;

/* What day of the week do most users register on? Provide insights on when to schedule an ad campaign

SELECT DAYNAME(created_at) AS day_of_week, COUNT(*) AS count
FROM users
GROUP BY DAYOFWEEK(created_at)
ORDER BY count DESC
LIMIT 1;

















