
	CREATE TABLE Users (
    userId VARCHAR(50) PRIMARY KEY,
    usname VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone int NOT NULL,
    role VARCHAR(50) NOT NULL
);

INSERT INTO Users (userId, usname, password, fullname, email, phone, role) VALUES
('USR001', 'A01', 'pw123', 'John Doe', 'john.doe@example.com', 0123456789, 'user'),
('USR002', 'A02', 'pw123', 'Jane Smith', 'jane.smith@example.com', 0987654321, 'admin'),
('USR003', 'A03', 'pw123', 'David Wilson', 'david.wilson@example.com', 0112233445, 'user'),
('USR004', 'A04', 'pw123', 'Emily Jones', 'emily.jones@example.com', 0223344556, 'user'),
('USR005', 'A05', 'pw123', 'Michael Brown', 'michael.brown@example.com', 0334455667, 'admin');
