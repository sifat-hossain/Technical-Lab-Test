USE [TechnicalLabTestDB]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 03-Mar-22 2:43:07 AM ******/
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
/****** Object:  Table [dbo].[DataField]    Script Date: 03-Mar-22 2:43:07 AM ******/
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
/****** Object:  Table [dbo].[Object]    Script Date: 03-Mar-22 2:43:07 AM ******/
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
/****** Object:  Table [dbo].[Reading]    Script Date: 03-Mar-22 2:43:07 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetReadingByBuildingId]    Script Date: 03-Mar-22 2:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetReadingByBuildingId]
@BuildingID smallint
as
begin
select r.BuildingId, b.Name from Reading as r left join Building as b on b.Id=r.BuildingId where r.BuildingId=@BuildingID
end

--exec "GetReadingByBuildingId" '1'
GO
/****** Object:  StoredProcedure [dbo].[SpGetBuildingList]    Script Date: 03-Mar-22 2:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpGetBuildingList]
as 
begin
select Id,[Name] from Building
end

--exec "SpGetBuildingList"
GO
/****** Object:  StoredProcedure [dbo].[SpGetDataFieldList]    Script Date: 03-Mar-22 2:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* this query retrive the DataField list from DataField table*/

Create procedure [dbo].[SpGetDataFieldList]
as
begin
select Id,[Name]  from DataField
end

--exec "GetDataFieldList"
GO
/****** Object:  StoredProcedure [dbo].[SpGetObjectList]    Script Date: 03-Mar-22 2:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* this query retrive the object list from Object table*/

CREATE procedure [dbo].[SpGetObjectList]
as
begin
select Id,[Name]  from [Object]
end

--exec "GetObjectList"
GO
/****** Object:  StoredProcedure [dbo].[SpInsertDataIntoBuilding]    Script Date: 03-Mar-22 2:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpInsertDataIntoBuilding]
as
set nocount on;
declare @i int
set @i=1
while(@i<=100)
begin
insert into Building([Name],[Location]) values('Building_'+convert(varchar,@i),'Dhaka')
set @i=@i+1
end

--exec "SpInsertDataIntoBuilding"
GO
/****** Object:  StoredProcedure [dbo].[SpInsertDataIntoDataField]    Script Date: 03-Mar-22 2:43:07 AM ******/
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

--exec "SpInsertDataIntoDataField"
GO
/****** Object:  StoredProcedure [dbo].[SpInsertDataIntoObject]    Script Date: 03-Mar-22 2:43:07 AM ******/
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

--exec "SpInsertDataIntoObject"
GO
/****** Object:  StoredProcedure [dbo].[SpInsertDataIntoReadingTable]    Script Date: 03-Mar-22 2:43:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpInsertDataIntoReadingTable]
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

	declare @i int, @j int, @lastDataFieldId int, @lastObjectId int, @timestamp int

	set @lastDataFieldId= (select top(1) DataFieldTableId from @tempDataFieldTable order by DataFieldTableId desc)
	set @lastObjectId= (select top(1) ObjectTableId from @tempObjectTable order by ObjectTableId desc)

	set @timestamp=1
	set @i=1
	set @tempTimeStamp='2019/01/01 00:00:00'
	set @tempVlaue=1.00
	while(@i<=100)                                                                     /*1st loop start*/
	   begin
			--while(@timestamp<=10)                                                    /*2nd loop start*/
			--	Begin
						set @j=(@timestamp*10)-9
							while(@j<=(@timestamp*10))                                                    /*3rd loop start*/
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
													 if(@j%3=0) begin set @tempVlaue=@tempVlaue-0.1 end

													 else begin set @tempVlaue=@tempVlaue+0.1 end
									
											set @tempTimeStamp= DATEADD(MINUTE,1,@tempTimeStamp)
									   end
						      set @j=@j+1
					      end                                                          /*3rd loop end*/
					   --set @timestamp=@timestamp+1
				    --END                                                                /*2nd loop end*/
				set @i=@i+1
			end                                                                     /*1st loop end*/
	end

	--exec "SpInsertDataIntoReadingTable"
GO
