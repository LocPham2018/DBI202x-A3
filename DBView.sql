-- View này được tạo để tổng hợp các comment trên nền tảng
create view UserCmtView
as
select [Name], [Time], Note
from dbo.[User] u
inner join dbo.Comment c on u.ID = c.[User_ID];

select [Name] from UserCmtView
group by [Name]
having count(Note) = 2;