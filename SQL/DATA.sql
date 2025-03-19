INSERT INTO [dbo].[USER_ROLE] (ROLE_ID, ROLE_NAME) VALUES
(1, 'Admin'),
(2, 'Customer');

INSERT INTO [dbo].[USERS] (USER_NAME, FULLNAME, PASSWORD, EMAIL, PHONE, ROLE_ID, STATUS, TOKEN, profile_image) VALUES
('ngvanan', 'Nguyễn Văn An', 'pw123', 'a@gmail.com', '0912345678', 1, 'ACTIVE', NULL, NULL),
('tt_bich', 'Trần Thị Bích', 'pw123', 'b@gmail.com', '0923456789', 2, 'ACTIVE', NULL, NULL),
('lhminh', 'Lê Hoàng Minh', 'pw123', 'm@gmail.com', '0934567890', 3, 'ACTIVE', NULL, NULL),
('pthang', 'Phạm Thu Hằng', 'pw123', 'h@gmail.com', '0945678901', 3, 'ACTIVE', NULL, NULL),
('dqtrung', 'Đỗ Quốc Trung', 'pw123', 't@gmail.com', '0956789012', 3, 'ACTIVE', NULL, NULL),
('bnlan', 'Bùi Ngọc Lan', 'pw123', 'l@gmail.com', '0967890123', 3, 'ACTIVE', NULL, NULL),
('hvdung', 'Hoàng Văn Dũng', 'pw123', 'd@gmail.com', '0978901234', 3, 'ACTIVE', NULL, NULL),
('vtmai', 'Vũ Thị Mai', 'pw123', 'mai@gmail.com', '0989012345', 3, 'ACTIVE', NULL, NULL),
('ndkien', 'Nguyễn Đức Kiên', 'pw123', 'k@gmail.com', '0989012345', 2, 'ACTIVE', NULL, NULL);

ALTER TABLE [dbo].[USERS] 
ADD STATUS NVARCHAR(10) DEFAULT 'ACTIVE',
    TOKEN NVARCHAR(255) NULL,
    profile_image NVARCHAR(255) NULL;
