USE [Northwind]
GO
 
/****** Object:  Table [dbo].[Categories]    Script Date: 22/01/2026 10:33:37 ******/
SET ANSI_NULLS ON
GO
declare @x varchar(8)
declare @i int
declare @j int
set @i = 99
select @i=count(*)*2, @j=sum(categoryid) from categories
--set @i = (select categoryid,count(*) from categories group by categoryid)
set @x = '1'
print 'Linha 1'
print @x + ': Total Registos: ' + cast(@i + 100 as varchar(2)) 
set @x = '2'
print @x + ':' + cast(@j as varchar(2))
 
 
select * from products 
where  categoryid = (select categoryid from categories where categoryname='seafood' or categoryname='beverages')
 
 
select * from categories where categoryname='seafood' or categoryname='beverages'
 
select * from products 
where  categoryid in (1,8)
 
select count(*) from products 
where  categoryid in (select categoryid, categoryname from categories where categoryname='seafood' or categoryname='beverages')