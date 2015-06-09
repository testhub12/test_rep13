DELETE FROM [Pfire_ApplicationController].[dbo].[PfireUserSite]
DELETE FROM [Pfire_ApplicationController].[dbo].[PfireUser]
DELETE FROM [Pfire_ApplicationController].[dbo].[Site]

-- Making change for testing--
SET IDENTITY_INSERT [Pfire_ApplicationController].[dbo].[PfireUser] ON 
INSERT INTO [Pfire_ApplicationController].[dbo].[PfireUser]
           ([PfireUserID]
           ,[WindowsUserName]
           ,[AdminIndicator]
           ,[FirstName]
           ,[LastName]
           ,[CreatedBy]
           ,[CreatedDateTime]
           ,[LastModifiedBy]
           ,[LastModifiedDateTime])
SELECT [PfireUserID]
      ,[WindowsUserName]
      ,[AdminIndicator]
      ,[FirstName]
      ,[LastName]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[LastModifiedBy]
      ,[LastModifiedDateTime]
  FROM [RDM_ApplicationController_R3].[dbo].[PfireUser]
SET IDENTITY_INSERT [Pfire_ApplicationController].[dbo].[PfireUser] OFF
GO

SET IDENTITY_INSERT [Pfire_ApplicationController].[dbo].[Site] ON
INSERT INTO [Pfire_ApplicationController].[dbo].[Site]
           ([SiteID]
           ,[SiteName]
           ,[SiteIdentifier]
           ,[URL]
           ,[CountryCode]
           ,[DatabaseName]
           ,[ConnectionString]
           ,[CreatedBy]
           ,[CreatedDateTime]
           ,[LastModifiedBy]
           ,[LastModifiedDateTime]
           ,[PfireConnectionString])
SELECT [RDMSiteID]
      ,[SiteName]
      ,[SiteIdentifier]
      ,[URL]
      ,[CountryCode]
      ,[DatabaseName]
      ,[ConnectionString]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[LastModifiedBy]
      ,[LastModifiedDateTime]
      ,[PfireConnectionString]
  FROM [RDM_ApplicationController_R3].[dbo].[RDMSite] r
  --WHERE r.PfireConnectionString Is Not Null
  SET IDENTITY_INSERT [Pfire_ApplicationController].[dbo].[Site] OFF
GO

SET IDENTITY_INSERT [Pfire_ApplicationController].[dbo].[PfireUserSite] ON
INSERT INTO [Pfire_ApplicationController].[dbo].[PfireUserSite]
           ([PfireUserSiteID]
           ,[PfireUserID]
           ,[SiteID]
           ,[CreatedBy]
           ,[CreatedDateTime]
           ,[LastModifiedBy]
           ,[LastModifiedDateTime])
SELECT [PfireUserSiteID]
      ,[PfireUserID]
      ,[RDMSiteID]
      ,[CreatedBy]
      ,[CreatedDateTime]
      ,[LastModifiedBy]
      ,[LastModifiedDateTime]
  FROM [RDM_ApplicationController_R3].[dbo].[PfireUserSite] us
  
SET IDENTITY_INSERT [Pfire_ApplicationController].[dbo].[PfireUserSite] OFF
GO

DECLARE @SiteName nvarchar(50) = 'Malaysia'
           ,@SiteIdentifier nvarchar(50) = 'CFR_RRDMDataConnection_Malaysia'
           ,@URL varchar(260) = 'http://emaedcw516.emea.pfizer.com'
           ,@CountryCode char(2) = 'MY'
           ,@DatabaseName varchar(128) = 'RDM_Malaysia'
           ,@ConnectionString varchar(500) = 'Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=aspsdcl059.pfizer.com)(PORT=1534)))(CONNECT_DATA=(SID=PFIANZ_S)));Persist Security Info=True;User ID=CFR_MY_ETL;Password=Pfizer_12'
           ,@CreatedBy sysname = SYSTEM_USER
           ,@CreatedDateTime datetime = GETUTCDATE()
           ,@LastModifiedBy sysname = SYSTEM_USER
           ,@LastModifiedDateTime datetime = GETUTCDATE()
           ,@PfireConnectionString varchar(500) = 'Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=aspsdcl059.pfizer.com)(PORT=1534)))(CONNECT_DATA=(SID=PFIANZ_S)));Persist Security Info=True;User ID=CFR_MY_ETL;Password=Pfizer_12'

IF NOT EXISTS (SELECT TOP 1 1 FROM [Pfire_ApplicationController].[dbo].[Site] WHERE CountryCode = @CountryCode)
BEGIN
INSERT INTO [Pfire_ApplicationController].[dbo].[Site]
           ([SiteName]
           ,[SiteIdentifier]
           ,[URL]
           ,[CountryCode]
           ,[DatabaseName]
           ,[ConnectionString]
           ,[CreatedBy]
           ,[CreatedDateTime]
           ,[LastModifiedBy]
           ,[LastModifiedDateTime]
           ,[PfireConnectionString])
SELECT @SiteName
           ,@SiteIdentifier
           ,@URL
           ,@CountryCode
           ,@DatabaseName
           ,@ConnectionString
           ,@CreatedBy
           ,@CreatedDateTime
           ,@LastModifiedBy
           ,@LastModifiedDateTime
           ,@PfireConnectionString
END
GO

DECLARE @SiteName nvarchar(50) = 'Singapore'
           ,@SiteIdentifier nvarchar(50) = 'CFR_RRDMDataConnection_Singapore'
           ,@URL varchar(260) = 'http://emaedcw516.emea.pfizer.com'
           ,@CountryCode char(2) = 'SG'
           ,@DatabaseName varchar(128) = 'RDM_Singapore'
           ,@ConnectionString varchar(500) = 'Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=aspsdcl059.pfizer.com)(PORT=1534)))(CONNECT_DATA=(SID=PFIANZ_S)));Persist Security Info=True;User ID=CFR_SG_ETL;Password=Pfizer#321'
           ,@CreatedBy sysname = SYSTEM_USER
           ,@CreatedDateTime datetime = GETUTCDATE()
           ,@LastModifiedBy sysname = SYSTEM_USER
           ,@LastModifiedDateTime datetime = GETUTCDATE()
           ,@PfireConnectionString varchar(500) = 'Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=aspsdcl059.pfizer.com)(PORT=1534)))(CONNECT_DATA=(SID=PFIANZ_S)));Persist Security Info=True;User ID=CFR_SG_ETL;Password=Pfizer#321'

IF NOT EXISTS (SELECT TOP 1 1 FROM [Pfire_ApplicationController].[dbo].[Site] WHERE CountryCode = @CountryCode)
BEGIN
INSERT INTO [Pfire_ApplicationController].[dbo].[Site]
           ([SiteName]
           ,[SiteIdentifier]
           ,[URL]
           ,[CountryCode]
           ,[DatabaseName]
           ,[ConnectionString]
           ,[CreatedBy]
           ,[CreatedDateTime]
           ,[LastModifiedBy]
           ,[LastModifiedDateTime]
           ,[PfireConnectionString])
SELECT @SiteName
           ,@SiteIdentifier
           ,@URL
           ,@CountryCode
           ,@DatabaseName
           ,@ConnectionString
           ,@CreatedBy
           ,@CreatedDateTime
           ,@LastModifiedBy
           ,@LastModifiedDateTime
           ,@PfireConnectionString
END
GO

DECLARE @SiteName nvarchar(50) = 'Australia'
           ,@SiteIdentifier nvarchar(50) = 'CFR_RRDMDataConnection_Australia'
           ,@URL varchar(260) = 'http://emaedcw516.emea.pfizer.com'
           ,@CountryCode char(2) = 'AU'
           ,@DatabaseName varchar(128) = 'RDM_Australia'
           ,@ConnectionString varchar(500) = 'Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST= aspsdcl059.PFIZER.COM)(PORT=1534)))(CONNECT_DATA=(SID=PFIANZ_S)));Persist Security Info=True;User ID=CFR_ANZ_ETL;Password=Pfizer_123'
           ,@CreatedBy sysname = SYSTEM_USER
           ,@CreatedDateTime datetime = GETUTCDATE()
           ,@LastModifiedBy sysname = SYSTEM_USER
           ,@LastModifiedDateTime datetime = GETUTCDATE()
           ,@PfireConnectionString varchar(500) = 'Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST= aspsdcl059.PFIZER.COM)(PORT=1534)))(CONNECT_DATA=(SID=PFIANZ_S)));Persist Security Info=True;User ID=CFR_ANZ_ETL;Password=Pfizer_123'

IF NOT EXISTS (SELECT TOP 1 1 FROM [Pfire_ApplicationController].[dbo].[Site] WHERE CountryCode = @CountryCode)
BEGIN
INSERT INTO [Pfire_ApplicationController].[dbo].[Site]
           ([SiteName]
           ,[SiteIdentifier]
           ,[URL]
           ,[CountryCode]
           ,[DatabaseName]
           ,[ConnectionString]
           ,[CreatedBy]
           ,[CreatedDateTime]
           ,[LastModifiedBy]
           ,[LastModifiedDateTime]
           ,[PfireConnectionString])
SELECT @SiteName
           ,@SiteIdentifier
           ,@URL
           ,@CountryCode
           ,@DatabaseName
           ,@ConnectionString
           ,@CreatedBy
           ,@CreatedDateTime
           ,@LastModifiedBy
           ,@LastModifiedDateTime
           ,@PfireConnectionString
END
GO
