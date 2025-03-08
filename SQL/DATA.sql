INSERT INTO [dbo].[USER_ROLE] (ROLE_ID, ROLE_NAME) VALUES
('1', 'Admin'),
('2', 'Shopkeeper'),
('3', 'Customer');

INSERT INTO [dbo].[USERS] (USER_ID, FULLNAME, USER_NAME, PASSWORD, EMAIL, PHONE, ROLE_ID) VALUES
('US001', 'Nguyễn Văn An', 'ngvanan', 'pw123', 'a@gmail.com', '912345678', '1'),
('US002', 'Trần Thị Bích', 'tt_bich', 'pw123', 'b@gmail.com', '923456789', '2'),
('US003', 'Lê Hoàng Minh', 'lhminh', 'pw123', 'm@gmail.com', '934567890', '3'),
('US004', 'Phạm Thu Hằng', 'pthang', 'pw123', 'h@gmail.com', '945678901', '3'),
('US005', 'Đỗ Quốc Trung', 'dqtrung', 'pw123', 't@gmail.com', '956789012', '3'),
('US006', 'Bùi Ngọc Lan', 'bnlan', 'pw123', 'l@gmail.com', '967890123', '3'),
('US007', 'Hoàng Văn Dũng', 'hvdung', 'pw123', 'd@gmail.com', '978901234', '3'),
('US008', 'Vũ Thị Mai', 'vtmai', 'pw123', 'mai@gmail.com', '989012345', '3'),
('US009', 'Nguyễn Đức Kiên', 'ndkien', 'pw123', 'k@gmail.com', '989012345', '2');
