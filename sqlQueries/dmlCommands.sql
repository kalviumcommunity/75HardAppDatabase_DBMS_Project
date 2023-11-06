-- Insert roles
INSERT INTO roles (RoleID, RoleName) VALUES
(1, 'Administrator'),
(2, 'Participant');

-- Insert users
INSERT INTO users (UserID, Username, Password, Email, RoleID, CreatedAt) VALUES
(1, 'admin', 'hashedAndSaltedPassword', 'admin@example.com', 1, CURRENT_TIMESTAMP),
(2, 'user1', 'hashedAndSaltedPassword', 'user1@example.com', 2, CURRENT_TIMESTAMP),
(3, 'user2', 'hashedAndSaltedPassword', 'user2@example.com', 2, CURRENT_TIMESTAMP);

-- Insert challenge_days
INSERT INTO challenge_days (ChallengeDay) VALUES
(1),
(2),
(3);

-- Insert daily_tasks
INSERT INTO daily_tasks (TaskID, TaskName, TaskDescription, TaskCategory, TaskType, TaskDifficulty, ChallengeDay) VALUES
(1, 'Morning Workout', 'Cardio and Strength Training', 'Workout', 'Gym', 'Moderate', 1),
(2, 'Healthy Meal', 'Balanced Nutrition', 'Meal', 'Home', 'Easy', 1),
(3, 'Evening Workout', 'High-Intensity Interval Training', 'Workout', 'Home', 'Hard', 2),
(4, 'Vegetarian Dinner', 'Plant-Based Recipes', 'Meal', 'Home', 'Moderate', 2);

-- Insert achievements
INSERT INTO achievements (AchievementID, UserID, AchievementName, AchievementDescription, DateEarned) VALUES
(1, 2, 'Fitness Milestone', 'Completed 30 consecutive days', CURRENT_TIMESTAMP),
(2, 3, 'Healthy Eating', 'Followed meal plan for 15 days', CURRENT_TIMESTAMP);

-- Insert workouts
INSERT INTO workouts (WorkoutID, WorkoutName, WorkoutDescription, WorkoutCategory, WorkoutType, WorkoutDuration, ExerciseList, UserID, ChallengeDay) VALUES
(1, 'Full Body Workout', 'Target all major muscle groups', 'Muscle Building', 'Gym', '45 minutes', 'Squats, Bench Press, Deadlifts', 2, 1),
(2, 'Home Cardio', 'No equipment needed', 'General Health', 'Home', '30 minutes', 'Jumping Jacks, High Knees, Burpees', 3, 2);

-- Insert meal_plans
INSERT INTO meal_plans (MealPlanID, MealPlanName, MealPlanDescription, MealPlanType, MealPlanCalories, MealPlanRecipes, UserID, ChallengeDay) VALUES
(1, 'Balanced Diet Plan', 'Nutrient-rich meals for the day', 'Vegetarian', 2000, 'Breakfast: Oatmeal, Lunch: Quinoa Salad, Dinner: Stir-Fried Vegetables', 2, 1),
(2, 'High Protein Meal Plan', 'Promotes muscle recovery', 'Non-Vegetarian', 2500, 'Breakfast: Eggs and Avocado, Lunch: Grilled Chicken Salad, Dinner: Salmon and Broccoli', 3, 2);

-- Update user email for user with UserID 2
UPDATE users
SET Email = 'newemail@example.com'
WHERE UserID = 2;

-- Update difficulty of the daily task with TaskID 1
UPDATE daily_tasks
SET TaskDifficulty = 'Hard'
WHERE TaskID = 1;

-- Update achievement description for achievement with AchievementID 1
UPDATE achievements
SET AchievementDescription = 'Completed 60 consecutive days'
WHERE AchievementID = 1;

-- Delete user with UserID 3
DELETE FROM users
WHERE UserID = 3;

-- Delete challenge log with LogID 1
DELETE FROM challenge_logs
WHERE LogID = 1;

-- Delete meal plan with MealPlanID 2
DELETE FROM meal_plans
WHERE MealPlanID = 2;
