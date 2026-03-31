-- Add user management tables
CREATE TABLE IF NOT EXISTS user_reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reported_user VARCHAR(50) NOT NULL,
    reason TEXT NOT NULL,
    reported_by INT NOT NULL,
    status ENUM('pending', 'resolved', 'dismissed') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reported_by) REFERENCES users(id)
);

-- Add status column to users table if not exists
ALTER TABLE users ADD COLUMN IF NOT EXISTS status ENUM('active', 'blocked') DEFAULT 'active';
