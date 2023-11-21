USE 75HardDatabase;
-- Inner Join to Retrieve User and Role Information
SELECT users.UserID, users.Username, users.Email, roles.RoleName
FROM users
INNER JOIN roles ON users.RoleID = roles.RoleID;

-- Left Join to Include Users Without Roles
SELECT users.UserID, users.Username, users.Email, roles.RoleName
FROM users
LEFT JOIN roles ON users.RoleID = roles.RoleID;

-- Subquery to Find Users with Achievements
SELECT UserID, Username
FROM users
WHERE UserID IN (SELECT UserID FROM achievements);

-- Join with Aggregation to Count Daily Tasks per Challenge Day
SELECT challenge_days.ChallengeDay, COUNT(daily_tasks.TaskID) AS TaskCount
FROM challenge_days
LEFT JOIN daily_tasks ON challenge_days.ChallengeDay = daily_tasks.ChallengeDay
GROUP BY challenge_days.ChallengeDay;

-- Correlated Subquery to Find Users with Most Achievements
SELECT UserID, Username
FROM users u
WHERE (SELECT COUNT(*) FROM achievements a WHERE a.UserID = u.UserID) = (SELECT MAX(achCount) FROM (SELECT UserID, COUNT(*) AS achCount FROM achievements GROUP BY UserID) AS counts);

-- Join with Filtering on Challenge Status
SELECT users.Username, challenge_logs.Date, challenge_logs.ChallengeStatus
FROM challenge_logs
JOIN users ON challenge_logs.UserID = users.UserID
WHERE challenge_logs.ChallengeStatus = 'Completed';

-- Subquery to Find Users with Specific Workout Type
SELECT UserID, Username
FROM users
WHERE UserID IN (SELECT DISTINCT UserID FROM workouts WHERE WorkoutType = 'Gym');

-- Join with Filtering on Meal Plan Type
SELECT users.Username, meal_plans.MealPlanName, meal_plans.MealPlanType
FROM meal_plans
JOIN users ON meal_plans.UserID = users.UserID
WHERE meal_plans.MealPlanType = 'Vegetarian';