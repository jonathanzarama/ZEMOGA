USE [ZEMOGA_DB]
GO
/****** Object:  User [ZEMOGASA]    Script Date: 16/07/2020 14:41:58 ******/
CREATE USER [ZEMOGASA] FOR LOGIN [ZEMOGASA] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ZEMOGASA]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ZEMOGASA]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ZEMOGASA]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 16/07/2020 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[CommentPost] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 16/07/2020 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[ID] [uniqueidentifier] NOT NULL,
	[Post] [nvarchar](1000) NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[PublishDate] [datetime] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostComment]    Script Date: 16/07/2020 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostComment](
	[ID] [uniqueidentifier] NOT NULL,
	[IDComment] [uniqueidentifier] NOT NULL,
	[IDPost] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PostComment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[IDComment] ASC,
	[IDPost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostUser]    Script Date: 16/07/2020 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostUser](
	[ID] [uniqueidentifier] NOT NULL,
	[User] [uniqueidentifier] NOT NULL,
	[Post] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PostUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[User] ASC,
	[Post] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 16/07/2020 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](10) NOT NULL,
	[UserRole] [uniqueidentifier] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 16/07/2020 14:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[ID] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](10) NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Comment] ([ID], [Name], [CommentPost]) VALUES (N'b1562a4d-3b5e-4d70-9294-0408f83c2056', N'third comment', N'it is a comment third ')
INSERT [dbo].[Comment] ([ID], [Name], [CommentPost]) VALUES (N'f52af37e-a33c-49dd-bc7e-50e8f0dae61a', N'second comment', N'it is a second comment test2')
INSERT [dbo].[Comment] ([ID], [Name], [CommentPost]) VALUES (N'57c8c23d-7260-49e9-bfb3-af197c842899', N'Four Comment', N'it is a comment test4')
INSERT [dbo].[Comment] ([ID], [Name], [CommentPost]) VALUES (N'5b46219e-8de5-4a31-937b-fb5e8a65839e', N'first Comment', N'it is a comment test1')
GO
INSERT [dbo].[Post] ([ID], [Post], [IsApproved], [PublishDate]) VALUES (N'13975963-4420-4e57-bb97-1f172da29694', N'Four post                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', 0, CAST(N'2020-07-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Post] ([ID], [Post], [IsApproved], [PublishDate]) VALUES (N'735ca34c-710f-4357-bd06-33cda716537c', N'Third post                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 0, CAST(N'2020-07-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Post] ([ID], [Post], [IsApproved], [PublishDate]) VALUES (N'5618ef33-5657-4f01-b93f-65a7dbd9d0b0', N'Second Post                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 1, CAST(N'2020-07-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Post] ([ID], [Post], [IsApproved], [PublishDate]) VALUES (N'd53c9f1f-ef71-4a36-a86f-88ce649bc3d3', N'first post                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 1, CAST(N'2020-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PostComment] ([ID], [IDComment], [IDPost]) VALUES (N'5029fcd9-9689-4862-afed-24030c3961cd', N'b1562a4d-3b5e-4d70-9294-0408f83c2056', N'5618ef33-5657-4f01-b93f-65a7dbd9d0b0')
INSERT [dbo].[PostComment] ([ID], [IDComment], [IDPost]) VALUES (N'6b40b3b4-7b36-4870-b17a-365bc18de8fe', N'5b46219e-8de5-4a31-937b-fb5e8a65839e', N'13975963-4420-4e57-bb97-1f172da29694')
INSERT [dbo].[PostComment] ([ID], [IDComment], [IDPost]) VALUES (N'69895a59-95b7-4ea4-a946-73113ec800d4', N'5b46219e-8de5-4a31-937b-fb5e8a65839e', N'13975963-4420-4e57-bb97-1f172da29694')
INSERT [dbo].[PostComment] ([ID], [IDComment], [IDPost]) VALUES (N'd9386f11-637a-448a-9c97-f523a7f190ce', N'f52af37e-a33c-49dd-bc7e-50e8f0dae61a', N'735ca34c-710f-4357-bd06-33cda716537c')
GO
INSERT [dbo].[User] ([ID], [Name], [Password], [UserRole]) VALUES (N'fd3c8316-ea63-4de6-8ed0-472f3b18e8e1', N'jz@gmail.com', N'123456', N'dd82ed08-b36d-4f39-aad1-d5d1901cd119')
INSERT [dbo].[User] ([ID], [Name], [Password], [UserRole]) VALUES (N'9cf15999-e882-4040-89da-da04713a2b88', N'guest', N'123456', N'86eb020f-f88f-43ce-921b-f69032f9662d')
INSERT [dbo].[User] ([ID], [Name], [Password], [UserRole]) VALUES (N'310c8264-760b-49c1-b036-efe3ccc83599', N'editor@zemoga', N'123456', N'13f67355-092d-489b-9e5a-07797ba6e90e')
GO
INSERT [dbo].[UserRole] ([ID], [Nombre]) VALUES (N'13f67355-092d-489b-9e5a-07797ba6e90e', N'Editor')
INSERT [dbo].[UserRole] ([ID], [Nombre]) VALUES (N'dd82ed08-b36d-4f39-aad1-d5d1901cd119', N'Writer')
INSERT [dbo].[UserRole] ([ID], [Nombre]) VALUES (N'86eb020f-f88f-43ce-921b-f69032f9662d', N'Guest')
GO
ALTER TABLE [dbo].[PostComment]  WITH CHECK ADD  CONSTRAINT [FK_PostComment_Comment] FOREIGN KEY([IDComment])
REFERENCES [dbo].[Comment] ([ID])
GO
ALTER TABLE [dbo].[PostComment] CHECK CONSTRAINT [FK_PostComment_Comment]
GO
ALTER TABLE [dbo].[PostComment]  WITH CHECK ADD  CONSTRAINT [FK_PostComment_Post] FOREIGN KEY([IDPost])
REFERENCES [dbo].[Post] ([ID])
GO
ALTER TABLE [dbo].[PostComment] CHECK CONSTRAINT [FK_PostComment_Post]
GO
ALTER TABLE [dbo].[PostUser]  WITH CHECK ADD  CONSTRAINT [FK_PostUser_Post] FOREIGN KEY([Post])
REFERENCES [dbo].[Post] ([ID])
GO
ALTER TABLE [dbo].[PostUser] CHECK CONSTRAINT [FK_PostUser_Post]
GO
ALTER TABLE [dbo].[PostUser]  WITH CHECK ADD  CONSTRAINT [FK_PostUser_User] FOREIGN KEY([User])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[PostUser] CHECK CONSTRAINT [FK_PostUser_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserRole] FOREIGN KEY([UserRole])
REFERENCES [dbo].[UserRole] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserRole]
GO
