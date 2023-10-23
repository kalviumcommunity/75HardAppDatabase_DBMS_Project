CREATE DATABASE IF NOT EXISTS 75HardDatabase;
USE 75HardDatabase;

-- roles table
CREATE TABLE roles (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(255) COMMENT 'e.g., Administrator, Participant'
);

-- users table
CREATE TABLE users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    Password VARCHAR(255) COMMENT 'Hashed and Salted',
    Email VARCHAR(255),
    RoleID INT,
    CreatedAt TIMESTAMP,
    FOREIGN KEY (RoleID) REFERENCES roles(RoleID)
);

-- challenge_days table
CREATE TABLE challenge_days (
    ChallengeDay INT PRIMARY KEY
);

-- challenge_logs table
CREATE TABLE challenge_logs (
    LogID INT PRIMARY KEY,
    UserID INT,
    ChallengeDay INT,
    Date TIMESTAMP,
    ChallengeStatus VARCHAR(255) COMMENT 'e.g., In Progress, Completed'
);

-- daily_tasks table
CREATE TABLE daily_tasks (
    TaskID INT PRIMARY KEY,
    TaskName VARCHAR(255),
    TaskDescription VARCHAR(255),
    TaskCategory VARCHAR(255) COMMENT 'e.g., Workout, Meal',
    TaskType VARCHAR(255) COMMENT 'e.g., Gym, Home, Meal',
    TaskDifficulty VARCHAR(255) COMMENT 'e.g., Easy, Moderate, Hard',
    ChallengeDay INT
);

-- achievements table
CREATE TABLE achievements (
    AchievementID INT PRIMARY KEY,
    UserID INT,
    AchievementName VARCHAR(255),
    AchievementDescription VARCHAR(255),
    DateEarned TIMESTAMP
);

-- workouts table
CREATE TABLE workouts (
    WorkoutID INT PRIMARY KEY,
    WorkoutName VARCHAR(255),
    WorkoutDescription VARCHAR(255),
    WorkoutCategory VARCHAR(255) COMMENT 'e.g., Muscle Building, General Health',
    WorkoutType VARCHAR(255) COMMENT 'e.g., Gym, Home',
    WorkoutDuration VARCHAR(255),
    ExerciseList VARCHAR(255) COMMENT 'List of exercises in the workout',
    UserID INT,
    ChallengeDay INT
);

-- meal_plans table
CREATE TABLE meal_plans (
    MealPlanID INT PRIMARY KEY,
    MealPlanName VARCHAR(255),
    MealPlanDescription VARCHAR(255),
    MealPlanType VARCHAR(255) COMMENT 'e.g., Vegetarian, Non-Vegetarian, Vegan',
    MealPlanCalories INT,
    MealPlanRecipes VARCHAR(255) COMMENT 'List of recipes in the meal plan',
    UserID INT,
    ChallengeDay INT
);

-- Add foreign key constraints using ALTER statements

-- foreign key constraint to challenge_logs table
ALTER TABLE challenge_logs
ADD CONSTRAINT fk_challenge_logs_users
FOREIGN KEY (UserID) REFERENCES users(UserID);

ALTER TABLE challenge_logs
ADD CONSTRAINT fk_challenge_logs_challenge_days
FOREIGN KEY (ChallengeDay) REFERENCES challenge_days(ChallengeDay);

-- foreign key constraint to daily_tasks table
ALTER TABLE daily_tasks
ADD CONSTRAINT fk_daily_tasks_challenge_days
FOREIGN KEY (ChallengeDay) REFERENCES challenge_days(ChallengeDay);

-- foreign key constraint to achievements table
ALTER TABLE achievements
ADD CONSTRAINT fk_achievements_users
FOREIGN KEY (UserID) REFERENCES users(UserID);

-- foreign key constraint to workouts table
ALTER TABLE workouts
ADD CONSTRAINT fk_workouts_users
FOREIGN KEY (UserID) REFERENCES users(UserID);

ALTER TABLE workouts
ADD CONSTRAINT fk_workouts_challenge_days
FOREIGN KEY (ChallengeDay) REFERENCES challenge_days(ChallengeDay);

-- foreign key constraint to meal_plans table
ALTER TABLE meal_plans
ADD CONSTRAINT fk_meal_plans_users
FOREIGN KEY (UserID) REFERENCES users(UserID);

ALTER TABLE meal_plans
ADD CONSTRAINT fk_meal_plans_challenge_days
FOREIGN KEY (ChallengeDay) REFERENCES challenge_days(ChallengeDay);

-- Modify the foreign key constraint
ALTER TABLE achievements
DROP FOREIGN KEY fk_achievements_users;

-- Add the foreign key constraint with ON DELETE CASCADE
ALTER TABLE achievements
ADD CONSTRAINT fk_achievements_users
FOREIGN KEY (UserID) REFERENCES users(UserID)
ON DELETE CASCADE;

-- Modify the foreign key constraint
ALTER TABLE meal_plans
DROP FOREIGN KEY fk_meal_plans_users;

-- Add the foreign key constraint with ON DELETE CASCADE
ALTER TABLE meal_plans
ADD CONSTRAINT fk_meal_plans_users
FOREIGN KEY (UserID) REFERENCES users(UserID)
ON DELETE CASCADE;

-- Modify the foreign key constraint
ALTER TABLE workouts
DROP FOREIGN KEY fk_workouts_users;

-- Add the foreign key constraint with ON DELETE CASCADE
ALTER TABLE workouts
ADD CONSTRAINT fk_workouts_users
FOREIGN KEY (UserID) REFERENCES users(UserID)
ON DELETE CASCADE;

-- DROP DATABASE 75HardDatabase;