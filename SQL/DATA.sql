INSERT INTO [dbo].[USER_ROLE] (ROLE_ID, ROLE_NAME) VALUES
(1, 'Admin'),
(2, 'Shopkeeper'),
(3, 'Customer');

INSERT INTO [dbo].[USERS] (USER_NAME, FULLNAME, PASSWORD, EMAIL, PHONE, ROLE_ID) VALUES
('ngvanan', 'Nguyễn Văn An', 'pw123', 'a@gmail.com', '0912345678', 1),
('tt_bich', 'Trần Thị Bích', 'pw123', 'b@gmail.com', '0923456789', 2),
('lhminh', 'Lê Hoàng Minh', 'pw123', 'm@gmail.com', '0934567890', 3),
('pthang', 'Phạm Thu Hằng', 'pw123', 'h@gmail.com', '0945678901', 3),
('dqtrung', 'Đỗ Quốc Trung', 'pw123', 't@gmail.com', '0956789012', 3),
('bnlan', 'Bùi Ngọc Lan', 'pw123', 'l@gmail.com', '0967890123', 3),
('hvdung', 'Hoàng Văn Dũng', 'pw123', 'd@gmail.com', '0978901234', 3),
('vtmai', 'Vũ Thị Mai', 'pw123', 'mai@gmail.com', '0989012345', 3),
('ndkien', 'Nguyễn Đức Kiên', 'pw123', 'k@gmail.com', '0989012345', 2);
