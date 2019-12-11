-- kiểm tra User có tồn tại
create function CheckExistUser (@Name varchar(40))
returns bit
as
begin
	declare @ext bit;

	if exists (select * from dbo.[User] where [Name] = @Name)
		set @ext = 1;
	else
		set @ext = 0;

	return @ext;
end

-- test case
-- the name Albert exist in User table, but Bert doesn't
select dbo.CheckExistUser('Albert');
select dbo.CheckExistUser('Bert');