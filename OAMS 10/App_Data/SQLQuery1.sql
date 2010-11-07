DECLARE Site_Cursor CURSOR FOR
SELECT ID, CurrentClientID, CategoryID1,CategoryID2,CategoryID3,CurrentProduct,Format
FROM Site


OPEN Site_Cursor;
declare @ID int, @ClientID int, 
@CatID1 uniqueidentifier, 
@CatID2 uniqueidentifier, 
@CatID3 uniqueidentifier,
@Product nvarchar(max),
@Format  nvarchar(max)


FETCH NEXT FROM Site_Cursor INTO @ID,@ClientID,@CatID1,@CatID2,@CatID3,@Product,@Format;

WHILE @@FETCH_STATUS = 0
   BEGIN
		 insert into SiteDetail (SiteID,ClientID,Name,CategoryID1,CategoryID2
		,CategoryID3,Product,Format)
		 values(@ID,@ClientID,'Main Site',@CatID1,@CatID2,@CatID3,@Product,@Format)
		
		
FETCH NEXT FROM Site_Cursor INTO @ID,@ClientID,@CatID1,@CatID2,@CatID3,@Product,@Format;
  
   END;
CLOSE Site_Cursor;
DEALLOCATE Site_Cursor;
GO

-- select * from Site
-- select * from SiteDetail
-- select distinct(Product) from SiteDetail
-- delete SiteDetail


DECLARE ContractDetail_Cursor CURSOR FOR
SELECT ID, SiteID
FROM ContractDetail


OPEN ContractDetail_Cursor;
declare @ID int, @SiteID int,
@CatID1 uniqueidentifier, 
@CatID2 uniqueidentifier, 
@CatID3 uniqueidentifier,
@Product nvarchar(max),
@Format  nvarchar(max)



FETCH NEXT FROM ContractDetail_Cursor INTO @ID,@SiteID;

WHILE @@FETCH_STATUS = 0
   BEGIN

	set @CatID1 = (select CategoryID1 from Site where ID = @SiteID)
	set @CatID2 = (select CategoryID2 from Site where ID = @SiteID)
	set @CatID3 = (select CategoryID3 from Site where ID = @SiteID)
	set @Product = (select CurrentProduct from Site where ID = @SiteID)
	set @Format = (select Format from Site where ID = @SiteID)
	--set @Name = (select Format from Site where ID = @SiteID)
	
	
	update ContractDetail 
		set SiteDetailName= 'Main Site'
		,Product = @Product
		,CategoryID1 = @CatID1
		,CategoryID2 =@CatID2
		,CategoryID3 = @CatID3
		,Format = @Format
		where ID = @ID
		
		
		
FETCH NEXT FROM ContractDetail_Cursor INTO @ID,@SiteID;

  
   END;
CLOSE ContractDetail_Cursor;
DEALLOCATE ContractDetail_Cursor;
GO

-- select * from ContractDetail
-- SiteDetail, ContractDetail,SiteMonitoringPhoto