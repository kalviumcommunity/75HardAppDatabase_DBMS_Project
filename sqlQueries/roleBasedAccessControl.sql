USE 75HardDatabase;

-- Create Users 'Administrator' and 'AppUser'
CREATE USER IF NOT EXISTS 'Administrator'@'localhost' IDENTIFIED BY 'admin_password';
CREATE USER IF NOT EXISTS 'AppUser'@'localhost' IDENTIFIED BY 'appuser_password';

-- Grant All Privileges on the Entire Database to 'Administrator'
GRANT ALL PRIVILEGES ON 75HardDatabase.* TO 'Administrator'@'localhost';

-- Grant SELECT Privileges on the Entire Database to Both 'Administrator' and 'AppUser'
GRANT SELECT ON 75HardDatabase.* TO 'Administrator'@'localhost', 'AppUser'@'localhost';

-- Revoke Insert, Update, Delete Privileges from 'AppUser'
REVOKE INSERT, UPDATE, DELETE ON 75HardDatabase.* FROM 'AppUser'@'localhost';

-- Grant Update Privileges on Users Table to 'AppUser'
GRANT UPDATE (Username, Password) ON 75HardDatabase.users TO 'AppUser'@'localhost';

-- Grant Update Privileges on Challenge Logs Table to 'AppUser'
GRANT UPDATE (ChallengeStatus) ON 75HardDatabase.challenge_logs TO 'AppUser'@'localhost';
