USE [master]
GO
drop database [UserManagement]
go

CREATE DATABASE [UserManagement] 

USE [UserManagement]
GO

DROP TABLE IF EXISTS [tblUsers];

go

CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140201', N'PHAM HOANG TU', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE150443', N'LE MINH KHOA', N'1', N'US', 1)

CREATE TABLE [dbo].[tblFlowers](
	[flowerID] [nvarchar](50) NOT NULL,
	[flowerName] [nvarchar](50) NULL,
	[flowerPrice] [float] NULL,
	[flowerQuantity] [int]
	PRIMARY KEY ([flowerID]),
)
GO

INSERT [dbo].[tblFlowers] ([flowerID], [flowerName], [flowerPrice], [flowerQuantity]) VALUES (N'F001', N'Red Rose', 500, 20)
INSERT [dbo].[tblFlowers] ([flowerID], [flowerName], [flowerPrice], [flowerQuantity]) VALUES (N'F002', N'White Rose', 600, 20)
INSERT [dbo].[tblFlowers] ([flowerID], [flowerName], [flowerPrice], [flowerQuantity]) VALUES (N'F003', N'Tiny Bloss', 40, 20)
INSERT [dbo].[tblFlowers] ([flowerID], [flowerName], [flowerPrice], [flowerQuantity]) VALUES (N'F004', N'Sun Flower', 1000, 20)
GO

DROP TABLE IF EXISTS [tblBills];
go
CREATE TABLE [dbo].[tblBills](
	[billID] int primary key identity(1,1),
	[userID] [nvarchar](50) NOT NULL,
	createdate date,
	
)

ALTER TABLE [dbo].[tblBills]
	ADD CONSTRAINT [FKBills]
	FOREIGN KEY ([userID])
	REFERENCES [dbo].[tblUsers]([userID])
GO
DROP TABLE IF EXISTS [tblDetailBills]
go
CREATE TABLE [dbo].[tblDetailBills](
	[billID] int NOT NULL,
	[flowerID] [nvarchar](50) NOT NULL,
	[quantity] [int] NULL,
	[flowerPrice] [float] NULL,
	PRIMARY KEY ([billID], [flowerID]),
)

ALTER TABLE [dbo].[tblDetailBills]
	ADD CONSTRAINT [FKDetailBill1]
	FOREIGN KEY ([flowerID])
	REFERENCES [dbo].[tblFlowers]([flowerID])

ALTER TABLE [dbo].[tblDetailBills]
	ADD CONSTRAINT [FKDetailBill2]
	FOREIGN KEY ([billID])
	REFERENCES [dbo].[tblBills]([billID])
GO