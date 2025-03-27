
INSERT INTO [dbo].[USER_ROLE] (ROLE_ID, ROLE_NAME) VALUES
(1, 'Admin'),
(2, 'Customer');

INSERT INTO [dbo].[USERS] (USER_NAME, FULLNAME, PASSWORD, EMAIL, PHONE, ROLE_ID, STATUS, TOKEN, profile_image) VALUES
('ngvanan', 'Nguyễn Văn An', '12345678', 'a@gmail.com', '0912345678', 1, 'ACTIVE', NULL, NULL),
('tt_bich', 'Trần Thị Bích', '12345678', 'b@gmail.com', '0923456789', 2, 'ACTIVE', NULL, NULL),
('lhminh', 'Lê Hoàng Minh', '12345678', 'm@gmail.com', '0934567890', 2, 'ACTIVE', NULL, NULL),
('pthang', 'Phạm Thu Hằng', '12345678', 'h@gmail.com', '0945678901', 2, 'ACTIVE', NULL, NULL),
('dqtrung', 'Đỗ Quốc Trung', '12345678', 't@gmail.com', '0956789012', 2, 'ACTIVE', NULL, NULL),
('bnlan', 'Bùi Ngọc Lan', '12345678', 'l@gmail.com', '0967890123', 2, 'ACTIVE', NULL, NULL),
('hvdung', 'Hoàng Văn Dũng', '12345678', 'd@gmail.com', '0978901234', 2, 'ACTIVE', NULL, NULL),
('vtmai', 'Vũ Thị Mai', '12345678', 'mai@gmail.com', '0989012345', 2, 'ACTIVE', NULL, NULL),
('ndkien', 'Nguyễn Đức Kiên', '12345678', 'k@gmail.com', '0989012345', 2, 'ACTIVE', NULL, NULL);

ALTER TABLE [dbo].[USERS] 
ADD STATUS NVARCHAR(10) DEFAULT 'ACTIVE',
    TOKEN NVARCHAR(255) NULL,
    profile_image NVARCHAR(255) NULL;
