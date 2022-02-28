USE [TechnicalLabTestDB]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 28-Feb-22 10:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Location] [varchar](50) NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataField]    Script Date: 28-Feb-22 10:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataField](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DataField] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Object]    Script Date: 28-Feb-22 10:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Object](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Object] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reading]    Script Date: 28-Feb-22 10:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reading](
	[ReadingId] [bigint] IDENTITY(1,1) NOT NULL,
	[BuildingId] [smallint] NOT NULL,
	[ObjectId] [smallint] NOT NULL,
	[DataFieldId] [smallint] NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_Reading] PRIMARY KEY CLUSTERED 
(
	[ReadingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reading]  WITH CHECK ADD  CONSTRAINT [FK_Reading_Building] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Building] ([Id])
GO
ALTER TABLE [dbo].[Reading] CHECK CONSTRAINT [FK_Reading_Building]
GO
ALTER TABLE [dbo].[Reading]  WITH CHECK ADD  CONSTRAINT [FK_Reading_DataField] FOREIGN KEY([DataFieldId])
REFERENCES [dbo].[DataField] ([Id])
GO
ALTER TABLE [dbo].[Reading] CHECK CONSTRAINT [FK_Reading_DataField]
GO
ALTER TABLE [dbo].[Reading]  WITH CHECK ADD  CONSTRAINT [FK_Reading_Object] FOREIGN KEY([ObjectId])
REFERENCES [dbo].[Object] ([Id])
GO
ALTER TABLE [dbo].[Reading] CHECK CONSTRAINT [FK_Reading_Object]
GO
/****** Object:  StoredProcedure [dbo].[SpInsertDataIntoBuilding]    Script Date: 28-Feb-22 10:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpInsertDataIntoBuilding]
as
set nocount on;
declare @i int
set @i=1
while(@i<=100)
begin
insert into Building([Name],[Location]) values('Building_'+convert(varchar,@i),'Dhaka')
set @i=@i+1
end
GO
/****** Object:  StoredProcedure [dbo].[SpInsertDataIntoDataField]    Script Date: 28-Feb-22 10:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpInsertDataIntoDataField]
as
set nocount on;
declare @i int
set @i=1
while(@i<=1000)
begin
insert into DataField([Name]) values('DataField_'+convert(varchar,@i))
set @i=@i+1
end
GO
/****** Object:  StoredProcedure [dbo].[SpInsertDataIntoObject]    Script Date: 28-Feb-22 10:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpInsertDataIntoObject]
as
set nocount on;
declare @i int
set @i=1
while(@i<=500)
begin
insert into Object([Name]) values('Object_'+convert(varchar,@i))
set @i=@i+1
end
GO
