--- ETL BULK LOADING  1


--EmadeOrderitem 
USE [EmadeDev]
GO

/****** Object:  Table [dbo].[EmadeOrderItems]    Script Date: 12/20/2025 10:13:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmadeOrderItemsBulk](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[list_price] [varchar](50) NULL,
	[discount] [varchar](50) NULL
) ON [PRIMARY]
GO

Select *
From EmadeOrderItemsBulk

bulk insert EmadeOrderItemsBulk

 from 'C:\Users\owner\Documents\ETL Training\Inbound\Data\ifelola ajibola - EmadeOrderItems.csv'

with

(format='csv', firstrow = 2,

fieldterminator=',',

rowterminator='0x0a'

)

;


--EmadeOrderBulk

USE [EmadeDev]
GO

/****** Object:  Table [dbo].[EmadeOrders]    Script Date: 12/20/2025 10:21:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmadeOrdersBULK](
	[order_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_status] [varchar](50) NULL,
	[order_date] [varchar](50) NULL,
	[required_date] [varchar](50) NULL,
	[shipped_date] [varchar](50) NULL,
	[store_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
 CONSTRAINT [PK_EmadeOrders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EmadeOrders]  WITH CHECK ADD  CONSTRAINT [FK_EmadeOrders_EmadeCustomers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[EmadeCustomers] ([customer_id])
GO

ALTER TABLE [dbo].[EmadeOrders] CHECK CONSTRAINT [FK_EmadeOrders_EmadeCustomers]
GO

ALTER TABLE [dbo].[EmadeOrders]  WITH CHECK ADD  CONSTRAINT [FK_EmadeOrders_EmadeStaffs] FOREIGN KEY([staff_id])
REFERENCES [dbo].[EmadeStaffs] ([staff_id])
GO

ALTER TABLE [dbo].[EmadeOrders] CHECK CONSTRAINT [FK_EmadeOrders_EmadeStaffs]
GO


bulk insert EmadeCategoriesBulk

 from 'C:\Users\owner\Documents\ETL Training\Inbound\Data\ifelola ajibola - EmadeOrders.csv'

with

(format='csv', firstrow = 2,

fieldterminator=',',

rowterminator='0x0a'

)

;


