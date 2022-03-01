USE [TechnicalLabTestDB]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 02-Mar-22 1:11:16 AM ******/
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
/****** Object:  Table [dbo].[DataField]    Script Date: 02-Mar-22 1:11:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataField](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DataField] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Object]    Script Date: 02-Mar-22 1:11:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Object](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Object] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reading]    Script Date: 02-Mar-22 1:11:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reading](
	[ReadingId] [bigint] IDENTITY(1,1) NOT NULL,
	[BuildingId] [smallint] NOT NULL,
	[ObjectId] [tinyint] NOT NULL,
	[DataFieldId] [tinyint] NOT NULL,
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
/****** Object:  StoredProcedure [dbo].[SpInsertDataIntoBuilding]    Script Date: 02-Mar-22 1:11:16 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SpInsertDataIntoDataField]    Script Date: 02-Mar-22 1:11:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpInsertDataIntoDataField]
as
set nocount on;
declare @i int
set @i=1
while(@i<=250)
begin
insert into DataField([Name]) values('DataField_'+convert(varchar,@i))
set @i=@i+1
end
GO
/****** Object:  StoredProcedure [dbo].[SpInsertDataIntoObject]    Script Date: 02-Mar-22 1:11:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpInsertDataIntoObject]
as
set nocount on;
declare @i int
set @i=1
while(@i<=250)
begin
insert into Object([Name]) values('Object_'+convert(varchar,@i))
set @i=@i+1
end
GO
/****** Object:  StoredProcedure [dbo].[SpInsertDataIntoReadingTable]    Script Date: 02-Mar-22 1:11:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SpInsertDataIntoReadingTable]
as
begin
    declare @tempBuildingTable table(buildingTableId int identity, BuildingId smallint)
    declare @tempDataFieldTable table(DataFieldTableId int identity, DataFieldId tinyint)
	declare @tempObjectTable table(ObjectTableId int identity, ObjectId tinyint)
	declare @tempTimeStamp datetime
	declare @tempVlaue decimal(18,2)

	insert into @tempBuildingTable(BuildingId) (select Id from Building)
	insert into @tempDataFieldTable(DataFieldId) (select Id from DataField)
	insert into @tempObjectTable(ObjectId) (select Id from [Object])

	declare @i int, @j int, @lastDataFieldId int, @lastObjectId int

	set @lastDataFieldId= (select top(1) DataFieldTableId from @tempDataFieldTable order by DataFieldTableId desc)
	set @lastObjectId= (select top(1) ObjectTableId from @tempObjectTable order by ObjectTableId desc)

	set @i=1
	set @tempTimeStamp='2020/01/01 00:00:00'
	set @tempVlaue=1.00
	while(@i<=10)
		begin
			set @j=(@i*10)-9
				while(@j<=(@i*10))
					begin
						if (@j>@lastDataFieldId)
							begin
								insert into Reading(BuildingId,ObjectId,DataFieldId,[Value],[Timestamp]) 
								values( 
										(@j-@lastDataFieldId),(@j-@lastObjectId),(@j-@lastDataFieldId),@tempVlaue, DATEADD(MINUTE,1,@tempTimeStamp)						
									  )
									set @tempVlaue=@tempVlaue+0.1
									set @tempTimeStamp= DATEADD(MINUTE,1,@tempTimeStamp)
								end
						else
							 begin
									insert into Reading(BuildingId,ObjectId,DataFieldId,[Value],[Timestamp]) 
									values(
									      (select BuildingId from @tempBuildingTable as bt where bt.buildingTableId=@i),
										  (select DataFieldId from @tempDataFieldTable as dft where dft.DataFieldTableId=@j),
										  (select ObjectId from @tempObjectTable as obt where obt.ObjectTableId=@j),
										  @tempVlaue,
										  DATEADD(MINUTE,1,@tempTimeStamp)
										 )
									set @tempVlaue=@tempVlaue+0.1
									set @tempTimeStamp= DATEADD(MINUTE,1,@tempTimeStamp)
								end
						set @j=@j+1
					end
				set @i=@i+1
			end
	end
GO
