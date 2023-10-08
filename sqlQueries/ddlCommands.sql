CREATE DATABASE IF NOT EXISTS 75HardDatabase;
USE 75HardDatabase;

CREATE TABLE roles (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(255)
);

CREATE TABLE users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    Password VARCHAR(255),
    Email VARCHAR(255),
    RoleID INT,
    CreatedAt TIMESTAMP,
    FOREIGN KEY (RoleID) REFERENCES roles(RoleID)
);

CREATE TABLE challenge_days (
    ChallengeDay INT PRIMARY KEY
);

CREATE TABLE challenge_logs (
    LogID INT PRIMARY KEY,
    UserID INT,
    ChallengeDay INT,
    Date TIMESTAMP,
    ChallengeStatus VARCHAR(255)
);

CREATE TABLE daily_tasks (
    TaskID INT PRIMARY KEY,
    TaskName VARCHAR(255),
    TaskDescription VARCHAR(255),
    TaskCategory VARCHAR(255),
    TaskType VARCHAR(255),
    TaskDifficulty VARCHAR(255),
    ChallengeDay INT
);

CREATE TABLE achievements (
    AchievementID INT PRIMARY KEY,
    UserID INT,
    AchievementName VARCHAR(255),
    AchievementDescription VARCHAR(255),
    DateEarned TIMESTAMP
);

CREATE TABLE workouts (
    WorkoutID INT PRIMARY KEY,
    WorkoutName VARCHAR(255),
    WorkoutDescription VARCHAR(255),
    WorkoutCategory VARCHAR(255),
    WorkoutType VARCHAR(255),
    WorkoutDuration VARCHAR(255),
    ExerciseList VARCHAR(255),
    UserID INT,
    ChallengeDay INT
);

CREATE TABLE meal_plans (
    MealPlanID INT PRIMARY KEY,
    MealPlanName VARCHAR(255),
    MealPlanDescription VARCHAR(255),
    MealPlanType VARCHAR(255),
    MealPlanCalories INT,
    MealPlanRecipes VARCHAR(255),
    UserID INT,
    ChallengeDay INT
);

-- Add foreign key constraints using ALTER statements
ALTER TABLE challenge_logs
ADD CONSTRAINT fk_challenge_logs_users
FOREIGN KEY (UserID) REFERENCES users(UserID);

ALTER TABLE challenge_logs
ADD CONSTRAINT fk_challenge_logs_challenge_days
FOREIGN KEY (ChallengeDay) REFERENCES challenge_days(ChallengeDay);

ALTER TABLE daily_tasks
ADD CONSTRAINT fk_daily_tasks_challenge_days
FOREIGN KEY (ChallengeDay) REFERENCES challenge_days(ChallengeDay);

ALTER TABLE achievements
ADD CONSTRAINT fk_achievements_users
FOREIGN KEY (UserID) REFERENCES users(UserID);

ALTER TABLE workouts
ADD CONSTRAINT fk_workouts_users
FOREIGN KEY (UserID) REFERENCES users(UserID);

ALTER TABLE workouts
ADD CONSTRAINT fk_workouts_challenge_days
FOREIGN KEY (ChallengeDay) REFERENCES challenge_days(ChallengeDay);

ALTER TABLE meal_plans
ADD CONSTRAINT fk_meal_plans_users
FOREIGN KEY (UserID) REFERENCES users(UserID);

ALTER TABLE meal_plans
ADD CONSTRAINT fk_meal_plans_challenge_days
FOREIGN KEY (ChallengeDay) REFERENCES challenge_days(ChallengeDay);

DROP DATABASE 75HardDatabase;