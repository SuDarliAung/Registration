USE [Registration]
GO
/****** Object:  Table [dbo].[LogInfo]    Script Date: 3/6/2025 1:28:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogInfo](
	[id] [uniqueidentifier] NOT NULL,
	[actiontime] [datetime] NULL,
	[actiondescription] [varchar](255) NULL,
	[userid] [uniqueidentifier] NOT NULL,
	[createdOn] [datetime] NULL,
	[createdBy] [nvarchar](255) NULL,
	[modifiedOn] [datetime] NULL,
	[modifiedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 3/6/2025 1:28:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[id] [uniqueidentifier] NOT NULL,
	[userid] [nvarchar](255) NOT NULL,
	[nric] [varchar](50) NULL,
	[name] [varchar](100) NOT NULL,
	[gender] [char](1) NOT NULL,
	[birthday] [datetime] NOT NULL,
	[availabledate] [datetime] NULL,
	[subjects] [varchar](255) NULL,
	[createdOn] [datetime] NULL,
	[createdBy] [nvarchar](255) NULL,
	[modifiedOn] [datetime] NULL,
	[modifiedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LogInfo] ([id], [actiontime], [actiondescription], [userid], [createdOn], [createdBy], [modifiedOn], [modifiedBy]) VALUES (N'1d932bd9-5496-463f-8bea-978608237cab', CAST(N'2025-03-06T13:23:38.037' AS DateTime), N'New user registered: single', N'dbfe41e7-b529-426a-85c6-17e3124d7ad4', CAST(N'2025-03-06T13:23:38.037' AS DateTime), N'system', CAST(N'2025-03-06T13:23:38.037' AS DateTime), N'system')
INSERT [dbo].[LogInfo] ([id], [actiontime], [actiondescription], [userid], [createdOn], [createdBy], [modifiedOn], [modifiedBy]) VALUES (N'1e70212c-b185-4c0e-9e18-c52dc2b05063', CAST(N'2025-03-06T13:18:26.287' AS DateTime), N'New user registered: david jones', N'71fb48c5-f997-42cd-8fd6-a3dd39da45ca', CAST(N'2025-03-06T13:18:26.293' AS DateTime), N'system', CAST(N'2025-03-06T13:18:26.300' AS DateTime), N'system')
GO
INSERT [dbo].[UserInfo] ([id], [userid], [nric], [name], [gender], [birthday], [availabledate], [subjects], [createdOn], [createdBy], [modifiedOn], [modifiedBy]) VALUES (N'dbfe41e7-b529-426a-85c6-17e3124d7ad4', N'111112', N'12/mayaka(N)842321', N'single', N'F', CAST(N'2001-06-13T00:00:00.000' AS DateTime), CAST(N'2025-03-28T00:00:00.000' AS DateTime), N'Science', CAST(N'2025-03-06T13:23:37.787' AS DateTime), N'system', CAST(N'2025-03-06T13:23:37.787' AS DateTime), N'system')
INSERT [dbo].[UserInfo] ([id], [userid], [nric], [name], [gender], [birthday], [availabledate], [subjects], [createdOn], [createdBy], [modifiedOn], [modifiedBy]) VALUES (N'71fb48c5-f997-42cd-8fd6-a3dd39da45ca', N'111111', N'12/katata(N)842321', N'david jones', N'M', CAST(N'2025-03-06T00:00:00.000' AS DateTime), CAST(N'2025-03-21T00:00:00.000' AS DateTime), N'English', CAST(N'2025-03-06T13:18:16.580' AS DateTime), N'system', CAST(N'2025-03-06T13:18:16.587' AS DateTime), N'system')
GO
ALTER TABLE [dbo].[LogInfo] ADD  DEFAULT (getdate()) FOR [actiontime]
GO
ALTER TABLE [dbo].[LogInfo]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[UserInfo] ([id])
GO
