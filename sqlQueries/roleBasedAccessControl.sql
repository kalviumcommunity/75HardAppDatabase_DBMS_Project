-- Create Roles
CREATE ROLE Administrator;
CREATE ROLE AppUser;

-- Grant All Privileges to Administrator
GRANT ALL PRIVILEGES ON 75HardDatabase.* TO Administrator;

-- Grant Select Privileges to Both Roles
GRANT SELECT ON ALL TABLES IN 75HardDatabase TO Administrator, AppUser;

-- Revoke Insert, Update, Delete Privileges from AppUser
REVOKE INSERT, UPDATE, DELETE ON ALL TABLES IN 75HardDatabase FROM AppUser;

-- Grant Update Privileges on Users Table to AppUser
GRANT UPDATE (Username, Password) ON 75HardDatabase.users TO AppUser;

-- Grant Update Privileges on Challenge Logs Table to AppUser
GRANT UPDATE (ChallengeStatus) ON 75HardDatabase.challenge_logs TO AppUser;